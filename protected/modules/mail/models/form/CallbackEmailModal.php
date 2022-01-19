<?php
/**
 * Форма обратный звонок
 */
class CallbackEmailModal extends CFormModel
{
    public $name;
    public $phone;
    public $comment;
    public $verify;
    public $verifyCode;
    public $ip;

    public function rules()
    {
        return [
            ['name, phone, comment', 'required'],
            ['name, phone, comment', 'checkField'],
            ['verify', 'safe'],
            ['verifyCode', 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'name' => 'Ваше имя',
            'phone' => 'Ваш телефон',
            'comment' => 'Адрес',
            'verify' => 'Код проверки',
        ];
    }

    public function beforeValidate()
    {
        if ($_POST['g-recaptcha-response']=='') {
            $this->addError('verifyCode', 'Пройдите проверку reCAPTCHA..');
        } else {
            $ip = CHttpRequest::getUserHostAddress();
            $post = [
                'secret' => Yii::app()->getModule('yupe')->secretKey,
                'response' => $_POST['g-recaptcha-response'],
                'remoteip' => $ip,
            ];
            $ch = curl_init('https://www.google.com/recaptcha/api/siteverify');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            $response = curl_exec($ch);
            curl_close($ch);
            $this->ip = $ip;
            $response = CJSON::decode($response);
            if (isset($response['success']) and isset($response['error-codes']) and $response['success']===false) {
                $this->addError('verifyCode', implode(', ', $response['error-codes']));
            }
        }
        return parent::beforeValidate();
    }

    public function afterValidate()
    {
        $module = Yii::app()->getModule('mail');
         $ips = explode(',', $module->blockedIp);
         if (array_search($this->ip, $ips)===false) {
            if (empty($this->getErrors())) {
                Yii::app()->mailMessage->raiseMailEvent('forma', $this->getAttributes());
            }
         }
        return parent::afterValidate();
    }

    public function checkField($attribure, $params)
    {
        $value = $this->$attribure;
        $ignores = ['http', 'https', '<div', '<br', 'href', 'span', '<p','<a'];
        foreach ($ignores as $key => $ignore) {
            if (strpos($value, $ignore)!==false) {
                $this->addError($name, 'invalid value');
            }
        }
    }
}
