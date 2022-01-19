<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', [
    'id'=>'form-qwues',
    'type' => 'vertical',
    'htmlOptions' => ['class' => 'form', 'data-type' => 'ajax-form'],
]); ?>

    <div class="form-flex">
        <h2 class="page-title"><?= $title?></h2>
        <div class="inputs-wrap d-flex">
                <?= $form->textFieldGroup($model, 'name', [
                    'widgetOptions'=>[
                        'htmlOptions'=>[
                            'class' => '',
                            'placeholder' => '',
                            'autocomplete' => 'off'
                        ]
                    ]
                ]); ?>
               <div class="form-group">
                            <?= $form->labelEx($model, 'phone', ['class' => 'control-label']) ?>
                            <?php $this->widget('CMaskedTextFieldPhone', [
                                'model' => $model,
                                'attribute' => 'phone',
                                'mask' => '+7(999)999-99-99',
                                'htmlOptions'=>[
                                    'class' => 'data-mask form-control',
                                    'data-mask' => 'phone',
                                    'placeholder' => '',
                                    'autocomplete' => 'off'
                                ]
                            ]) ?>
                <?= $form->error($model, 'phone');?>
                </div>
                <?= $form->textFieldGroup($model, 'email', [
                    'widgetOptions'=>[
                        'htmlOptions'=>[
                            'class' => '',
                            'placeholder' => '',
                            'autocomplete' => 'off'
                        ]
                    ]
                ]); ?>
        </div>
        <div class="textarea">
             <?= $form->textAreaGroup($model, 'text',[
                'widgetOptions'=>[
                    'htmlOptions'=>[
                        'class' => '',
                        'placeholder' => '',
                        'autocomplete' => 'off'
                    ]
                ]
            ]) ?>
        </div>
        <?= $form->hiddenField($model, 'code'); ?>
        <div class="form-footer">
                <div class="form-footer-small small">* - поля, отмеченные звёздочкой, обязательны для заполнения</div>
                <span class="form-captcha">
                    <div class="g-recaptcha" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey ?>"></div>
                    <?= $form->error($model, 'verifyCode');?>
                </span>

                <button id="form-button" class="category-form-btn" data-send="ajax" >Связаться с нами</button>
                <div class="politic small" id="politic">
                    Нажимая на кнопку «Отправить заявку», я даю согласие на обработку персональных данных в соответствии
                    <br>с «Политикой конфиденциальности» компании «Кванпром»
                </div>
        </div>
    </div>
  <?php if (Yii::app()->user->hasFlash('success')): ?>
        <script>
            $('#messageModal').modal('show');
            setTimeout(function(){
                $('#messageModal').modal('hide');
                }, 5000);
        </script>
    <?php endif ?>

<?php $this->endWidget() ?>

