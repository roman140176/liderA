<?php
$this->title = Yii::t('UserModule.user', 'Sign in');
$assets = Yii::app()->getTheme()->getAssetsUrl();
Yii::app()->getClientScript()->registerScriptFile('https://www.google.com/recaptcha/api.js');
?>

<div class="personal-account">
    <div class="container d-flex justify-content-center">
        <div class="login-box">
            <div class="login-main">
                <div class="login-title">
                    Вход в личный кабинет
                </div>
                <?php $form = $this->beginWidget(
                        'bootstrap.widgets.TbActiveForm',
                        [
                            'id' => 'login-form',
                            'type' => 'vertical',
                            'htmlOptions' => [
                                'class' => 'login-form form-white',
                            ]
                        ]
                    ); ?>
                    <div class="main__inputs">
                        <div class="form-group posrel">
                            <div class="abs-inter abs">Введите E-mail или логин</div>
                            <label class="control-label required" for="LoginForm_email">
                            Имя пользователя или Email
                            <span class="required">*</span>
                            </label>
                            <input class=" form-control" placeholder="Ваш E-mail" autocomplete="" name="LoginForm[email]" id="LoginForm_email" type="text">
                            <?= $form->error($model, 'email');?>
                        </div>

                        <div class="password-form-group form-group posrel">
                            <div class="abs-inter abs">Введите пароль</div>
                            <label class="control-label required" for="LoginForm_password">
                            Пароль
                            <span class="required">*</span>
                            </label>
                            <div class="input-group">
                            <input
                            class="form-control"
                            placeholder="Пароль"
                            name="LoginForm[password]"
                            id="LoginForm_password"
                            type="password"
                            autocomplete="current-password"
                            >
                            <span class="password-input-show input-group-addon abs">
                            </span>
                            </div>
                            <?= $form->error($model, 'password');?>
                        </div>
                    </div>
                    <div class="forgot d-flex">
                        <?php if ($this->getModule()->sessionLifeTime > 0): ?>
                            <div class="checkbox checkbox-one">
                                <input checked="checked" name="LoginForm[remember_me]" id="LoginForm_remember_me" value="1" type="checkbox">
                                <label for="LoginForm_remember_me"><span>Запомнить меня</span></label>
                            </div>
                        <?php endif; ?>
                        <?= CHtml::link(Yii::t('UserModule.user', 'Forgot your password?'), ['/user/account/recovery'], [
                        'class' => 'login-form__link'
                        ]) ?>
                    </div>

                    <div class="login-form-bot">
                        <div class="form-captcha">
                            <div class="g-recaptcha" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey; ?>">
                            </div>
                            <?= $form->error($model, 'verify');?>
                        </div>
                        <div class="form-button-lk">
                            <button class="but but-pink" id="login-btn" data-send="ajax">
                                <span>Войти</span>
                            </button>
                        </div>
                    </div>
                </div>

            <?php $this->endWidget(); ?>
            <div class="login-box-footer d-flex">
                <a class="reg-link" href="<?= Yii::app()->createUrl('user/account/registration'); ?>"><?= Yii::t('UserModule.user', 'Зарегистрироваться'); ?></a>
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
    let eye = document.querySelector('.password-input-show')
    let lb = document.querySelector('.login-box')
    for(let inp of inputs){
        inp.addEventListener('mousedown',(e)=>{
            let fg = e.currentTarget.closest('.form-group')
            fg.querySelector('.abs-inter').classList.add('active')
            })
        }
        lb.addEventListener('click',e=>{
            if(e.target.id !='LoginForm_email' && e.target.id !='LoginForm_password'){
                for(let inp of inputs){
                    let fg = inp.closest('.form-group')
                    if(inp.value.trim() == ''){
                        fg.querySelector('.abs-inter').classList.remove('active')
                        }
                    }
            }
        })
        eye.addEventListener('click',(e) => {
         let pasw = document.querySelector('#LoginForm_password')
         let fg = e.currentTarget.closest('.form-group')
         if(!e.currentTarget.classList.contains('active')){
                e.currentTarget.classList.add('active')
                pasw.setAttribute('type','text')
            }else{
                e.currentTarget.classList.remove('active')
                pasw.setAttribute('type','password')
            }

        })
    })
</script>
<?php if (Yii::app()->user->hasFlash("success")) : ?>
    <div id="registrationModal" class="modal modal-my fade" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div data-dismiss="modal" class="modal-close"><div></div></div>
                    <div class="modal-header__heading">
                        <div class="modal-header__h2">Уведомление</div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="message-success">
                        <?= Yii::app()->user->getFlash('success') ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="#" class="hidden reg" data-bs-target="#registrationModal" data-bs-toggle="modal"></a>
        <!-- $('#registrationModal').modal('show');
        setTimeout(function(){
            $('#registrationModal').modal('hide');
        }, 6000); -->

    <script>
    document.addEventListener('DOMContentLoaded',()=>{
        setTimeout(() => {
        document.querySelector('.reg').click()
        }, 1000);
        setTimeout(() => {
        document.getElementById('registrationModal').style.display='none'
        document.querySelector('.modal-backdrop').style.display='none'
        document.body.classList.remove('modal-open')
        document.body.removeAttribute('style')
        }, 5000);
    })

    </script>
<?php endif; ?>