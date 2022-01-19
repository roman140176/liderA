<?php
use yupe\widgets\YPurifier;

/**
 * Форма регистрации
 *
 * @category YupeComponents
 * @package  yupe.modules.user.forms
 * @author   YupeTeam <team@yupe.ru>
 * @license  BSD http://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_BSD
 * @version  0.5.3
 * @link     https://yupe.ru
 *
 **/
class RegistrationForm extends CFormModel
{

    public $first_name;
    public $phone;
    public $nick_name;
    public $email;
    public $about;
    public $location;
    public $password;
    public $cPassword;
    public $verifyCode;
    // public $check;

    public $disableCaptcha = false;

    public function isCaptchaEnabled()
    {
        $module = Yii::app()->getModule('user');

        if (!$module->showCaptcha || !CCaptcha::checkRequirements() || $this->disableCaptcha) {
            return false;
        }

        return true;
    }

    public function rules()
    {
        $module = Yii::app()->getModule('user');

        return [
            ['nick_name, email, first_name,location, about, phone', 'filter', 'filter' => 'trim'],
            ['nick_name, email, first_name,location, about, phone', 'filter', 'filter' => [new YPurifier(), 'purify']],
            ['nick_name, email, password, cPassword, first_name', 'required'],
            ['nick_name, email, first_name', 'length', 'max' => 50],
            ['password, cPassword', 'length', 'min' => $module->minPasswordLength],
            [
                'nick_name',
                'match',
                'pattern' => '/^[A-Za-z0-9_-]{2,50}$/',
                'message' => Yii::t(
                    'UserModule.user',
                    'Bad field format for "{attribute}". You can use only letters and digits from 2 to 20 symbols'
                )
            ],
            ['nick_name', 'checkNickName'],
            [
                'cPassword',
                'compare',
                'compareAttribute' => 'password',
                'message' => Yii::t('UserModule.user', 'Password is not coincide')
            ],
            ['email', 'email'],
            ['email', 'checkEmail'],
            // [
            //     'phone',
            //     'match',
            //     'pattern' => $module->phonePattern,
            //     'message' => 'Некорректный формат поля {attribute}'
            // ],
            // ['check', 'compare', 'compareValue' => 1, 'message' => 'Для продолжения Вы должны принять условия политики конфиденциальности'],
            ['first_name, phone, location, about', 'safe'],
        ];
    }

    /**
     * Метод выполняется перед валидацией
     *
     * @return bool
     */
    public function beforeValidate()
    {
        $module = Yii::app()->getModule('user');

        if ($module->generateNickName) {
            $this->nick_name = 'user' . time();
        }

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

            $response = CJSON::decode($response);
            if (isset($response['success']) and isset($response['error-codes']) and $response['success']===false) {
                $this->addError('verifyCode', implode(', ', $response['error-codes']));
            }
        }

        return parent::beforeValidate();
    }

    public function attributeLabels()
    {
        return [
            'first_name' => Yii::t('UserModule.user', 'Name'),
            'phone'      => Yii::t('UserModule.user', 'Phone'),
            'nick_name'  => Yii::t('UserModule.user', 'User name'),
            'email'      => Yii::t('UserModule.user', 'Email'),
            'about'      => 'Должность',
            'location'      => 'Наименование организации',
            'password'   => Yii::t('UserModule.user', 'Password'),
            'cPassword'  => Yii::t('UserModule.user', 'Password confirmation'),
            'verifyCode' => Yii::t('UserModule.user', 'Check code'),
            // 'check'      => '<span>Принимаю условия <a href="#" target="_blank">политики конфиденциальности</a></span>',
        ];
    }

    public function checkNickName($attribute, $params)
    {
        $model = User::model()->find('nick_name = :nick_name', [':nick_name' => $this->$attribute]);

        if ($model) {
            $this->addError('nick_name', Yii::t('UserModule.user', 'User name already exists'));
        }
    }

    public function checkEmail($attribute, $params)
    {
        $model = User::model()->find('email = :email', [':email' => $this->$attribute]);

        if ($model) {
            $this->addError('email', Yii::t('UserModule.user', 'Email already busy'));
        }
    }

    public function emptyOnInvalid($attribute, $params)
    {
        if ($this->hasErrors()) {
            $this->verifyCode = null;
        }
    }
}
