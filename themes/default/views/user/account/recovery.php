<?php
/**
 * @var TbActiveForm $form
 */

$this->title = Yii::t('UserModule.user', 'Password recovery');

Yii::app()->getClientScript()->registerScriptFile('https://www.google.com/recaptcha/api.js');
?>

<div class="recovery-account">
    <div class="container d-flex justify-content-center">
        <div class="login-box">
        <div class="login-main">
               <div class="login-title">
                    <?= $this->title?>
                </div>


            <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', [
                'id' => 'recovery-form',
                'type' => 'vertical',
                'htmlOptions' => ['class' => 'recovery-form form-white'],
            ]); ?>
                <div class="main__inputs">
                    <div class="form-group posrel">
                    <div class="abs-inter abs">Введите E-mail</div>
                    <input autocomplete="off" class="form-control"
                    placeholder="Email"
                    name="RecoveryForm[email]"
                    id="RecoveryForm_email"
                    type="text">
                    <?= $form->error($model, 'email');?>
                    <?= $model->checkEmail('email',[':email' => 'email'])?>
                    </div>
                </div>
                <div class="login-form-bot">
                    <div class="form-captcha" style="margin-bottom: 11px;">
                        <div class="g-recaptcha" data-sitekey="<?= Yii::app()->params['key']; ?>">
                        </div>
                        <?= $form->error($model, 'verify');?>
                    </div>
                    <div class="form-button">
                        <button class="but but-pink" id="recovery-btn" data-send="ajax">
                            <span><?= Yii::t('UserModule.user', 'Recover password'); ?></span>
                        </button>
                    </div>
                </div>
                <input type="hidden" name="RecoveryForm[validate]">
                </div>
            <?php $this->endWidget(); ?>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded',()=>{
    let box = document.querySelector('.main__inputs')
    let inp = box.querySelector('input')
    let eyes = document.querySelectorAll('.password-input-show')
    let lb = document.querySelector('.login-box')

        if(inp.value.length > 1){
            inp.cssText = 'background:#fff!important'
        }
        inp.addEventListener('mousedown',(e)=>{
            let fg = e.currentTarget.closest('.form-group')
            fg.querySelector('.abs-inter').classList.add('active')
            })

        lb.addEventListener('click',e=>{
            if(!e.target.classList.contains('form-control')){
                    let fg = inp.closest('.form-group')
                    if(inp.value.trim() == ''){
                        fg.querySelector('.abs-inter').classList.remove('active')
                        }
            }
        })
    })
</script>