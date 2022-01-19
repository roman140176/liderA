<?php
/**
 * Форма обратный звонок
 */
class CallbackFormModal extends CFormModel
{
    public $name;
    public $phone;
    public $verify;
    public $body;
    public $verifyCode;
    public $date;

    public function rules()
    {
        return [
            ['name, phone', 'required'],
            ['verify, date', 'safe'],
            ['verifyCode', 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'name' => 'Имя',
            'phone' => 'Ваш телефон',
            'date' => 'Дата',
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
        if (empty($this->getErrors()) and get_class($this) != 'CallbackServicesFormModal') {
            Yii::app()->mailMessage->raiseMailEvent('obratnaya-svyaz', $this->getAttributes());
        }
        return parent::afterValidate();
    }
}
