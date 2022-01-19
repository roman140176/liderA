<?php
$assets = Yii::app()->getTheme()->getAssetsUrl();
$this->title = Yii::t('UserModule.user', 'Sign up');
$this->breadcrumbs = [Yii::t('UserModule.user', 'Sign up')];
Yii::app()->getClientScript()->registerScriptFile('https://www.google.com/recaptcha/api.js');
?>

<div class="personal-account">
    <div class="container d-flex justify-content-center">
        <div class="login-box">
            <div class="login-main">
                <div class="login-title">
                    Регистрация
                </div>
                <?php $form = $this->beginWidget(
                        'bootstrap.widgets.TbActiveForm',
                        [
                            'id' => 'registration-form',
                            'type' => 'vertical',
                            'htmlOptions' => [
                                'class' => 'registration-form form-white',
                                'autocomplete'=>'off'
                            ]
                        ]
                    ); ?>
                    <?= $form->errorSummary($model); ?>
                    <div class="main__inputs">
                        <div class="form-group posrel">
                            <div class="abs-inter abs">Наименование организации</div>
                            <label class="control-label" for="RegistrationForm_location">
                            Наименование организации
                            </label>
                            <input class=" form-control" placeholder="Наименование организации" autocomplete="" name="RegistrationForm[location]" id="RegistrationForm_location" type="text">
                        </div>

                        <div class="form-group posrel">
                            <div class="abs-inter abs">Ваше Имя*</div>
                            <label class="control-label required" for="RegistrationForm_first_name">
                            Ваше Имя*
                            <span class="required">*</span>
                            </label>
                            <input class=" form-control" placeholder="Ваше Имя*" autocomplete="off" name="RegistrationForm[first_name]" id="RegistrationForm_first_name" type="text">
                        </div>
                        <div class="form-group posrel">
                            <div class="abs-inter abs">E-mail*</div>
                            <label class="control-label required" for="RegistrationForm_email">
                            E-mail*
                            <span class="required">*</span>
                            </label>
                            <input class=" form-control" placeholder="E-mail*" name="RegistrationForm[email]" id="RegistrationForm_email" type="text" autocomplete="nope">
                        </div>
                        <div class="form-group posrel">
                            <div class="abs-inter abs">Должность</div>
                            <label class="control-label" for="RegistrationForm_about">
                            Должность
                            </label>
                            <input class="form-control" placeholder="Должность" autocomplete="off" name="RegistrationForm[about]" id="RegistrationForm_about" type="text">
                        </div>
                        <div class="form-group posrel">
                            <div class="abs-inter abs">Введите телефон</div>
                            <label class="control-label" for="RegistrationForm_phone">
                                Контактный номер телефона
                            </label>
                            <input class="tel form-control"
                            id="RegistrationForm_phone"
                            placeholder="+7 (xxx) xxx xxxx"
                            autocomplete="false"
                            name="RegistrationForm[phone]"
                            type="tel"
                            data-name="Контактный номер телефона">
                       </div>
                       <div class="password-form-group form-group posrel">
                            <div class="abs-inter abs">Введите пароль</div>
                            <label class="control-label required" for="RegistrationForm_password">
                            Пароль
                            <span class="required">*</span>
                            </label>
                            <div class="input-group posrel">
                                <input class="form-control" placeholder="Пароль" name="RegistrationForm[password]" id="RegistrationForm_password" type="password" autocomplete="current-password">
                                <span class="password-input-show input-group-addon abs">
                                </span>
                            </div>
                       </div>
                       <div class="password-form-group form-group posrel">
                            <div class="abs-inter abs">Подтвердите пароль</div>
                            <label class="control-label required" for="RegistrationForm_cPassword">
                            Подтвердите пароль
                            <span class="required">*</span>
                            </label>
                            <div class="input-group posrel">
                                <input class="form-control" placeholder="Подтвердите пароль" name="RegistrationForm[cPassword]" id="RegistrationForm_cPassword" type="password" autocomplete="current-cPassword">
                                <span class="password-input-show input-group-addon abs">
                                </span>
                            </div>
                       </div>
                    </div>
                    <div class="login-form-bot">
                        <div class="form-captcha">
                            <div class="g-recaptcha" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey; ?>">
                            </div>
                            <?= $form->error($model, 'verify');?>
                        </div>
                        <div class="checkbox checkbox-one d-flex">
                                <input checked="checked" name="accept" id="accept" value="1" type="checkbox">
                                <label for="accept" class="accept-label"></label>
                                <div class="accept-client">
                                    <a href="#">
                                        Я ознакомился и согласен c политикой <br>конфиденциальности
                                    </a>
                                </div>
                        </div>
                        <div class="form-button-lk">
                            <button class="but but-pink" id="reg-btn" data-send="ajax">
                                <span>Зарегистрироваться</span>
                            </button>
                        </div>
                    </div>
                </div>

            <?php $this->endWidget(); ?>
            <div class="login-box-footer d-flex">
                <a class="reg-link" href="<?= Yii::app()->createUrl('user/account/login'); ?>"><?= Yii::t('UserModule.user', 'Войти'); ?></a>
                <div class="accept text-center">
                    При входе вы подтверждаете согласие <br>с <a href="#">политикой конфиденциальности</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded',()=>{
    let box = document.querySelector('.main__inputs')
    let inputs = box.querySelectorAll('input')
    let eyes = document.querySelectorAll('.password-input-show')
    let lb = document.querySelector('.login-box')
    for(let inp of inputs){
        if(inp.value.length > 1){
            inp.cssText = 'background:#fff!important'
        }
        inp.addEventListener('mousedown',(e)=>{
            let fg = e.currentTarget.closest('.form-group')
            fg.querySelector('.abs-inter').classList.add('active')
            })
        }
        lb.addEventListener('click',e=>{
            if(!e.target.classList.contains('form-control')){
                for(let inp of inputs){
                    let fg = inp.closest('.form-group')
                    if(inp.value.trim() == ''){
                        fg.querySelector('.abs-inter').classList.remove('active')
                        }
                    }
            }
        })
        for (let eye of eyes){
            eye.addEventListener('click',(e) => {
            let fg = e.currentTarget.closest('.form-group')
            let inp = fg.querySelector('input')
            if(!e.currentTarget.classList.contains('active')){
                    e.currentTarget.classList.add('active')
                    inp.setAttribute('type','text')
                }else{
                    e.currentTarget.classList.remove('active')
                    inp.setAttribute('type','password')
                }

            })
        }
    })
</script>

