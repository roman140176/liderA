<?php
/**
 * Форма обратный звонок
 */
class CallbackFormEmailModal extends CFormModel
{
    public $name;
    public $phone;
    public $body;
    public $verify;
    public $verifyCode;

    public function rules()
    {
        return [
            ['name, phone, body', 'required'],
            ['verify', 'safe'],
            ['verifyCode', 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'name' => 'Ваше имя',
            'phone' => 'Ваш телефон',
            'body' => 'Текст сообщения',
            'verify' => 'Код проверки',
        ];
    }

    public function beforeValidate()
    {
        if ($_POST['g-recaptcha-response']=='') {
            $this->addError('verifyCode', 'Пройдите проверку reCAPTCHA..');
        } else {
            // $ip = CHttpRequest::getUserHostAddress();
            $post = [
                'secret' => Yii::app()->getModule('yupe')->secretKey,
                'response' => $_POST['g-recaptcha-response'],
                // 'remoteip' => $ip,
            ];

            $ch = curl_init('https://www.google.com/recaptcha/api/siteverify');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            $response = curl_exec($ch);
            curl_close($ch);

            $response = CJSON::decode($response);
            if (isset($response['success']) and isset($response['error-codes']) and $response['success']===false) {
                $this->addError('verifyCode', implode(', ', $response['error-codes']));
            }
        }
        return parent::beforeValidate();
    }

     public function afterValidate()
    {
        if (empty($this->getErrors())) {
            if (Yii::app()->hasModule('feedback')){
                Yii::import('application.modules.feedback.FeedbackModule');

                $feedback = new FeedBack;
                $feedback->name = $this->name;
                $feedback->phone = $this->phone;
                $feedback->text = $this->body;
                $feedback->theme = 'Форма обратной связи';

                $feedback->save();
            }

            Yii::app()->mailMessage->raiseMailEvent('napisat-nam', $this->getAttributes());
        }
        return parent::afterValidate();
    }
}
