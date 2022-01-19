<div id="CallbackEmail" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex">
                <h4 class="modal-title">Заполните форму отправки</h4>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Закрыть">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', [
                        'id'=>'callback-email-modal',
                        'type' => 'vertical',
                        'htmlOptions' => ['class' => '', 'data-type' => 'ajax-form',
                        ],
                    ]); ?>

                   <?php if (Yii::app()->user->hasFlash('success2')): ?>
                        <div class="modal-success-message" style="color: green; text-align: center; padding: 35px 0px; font-size: 16px;">
                            <?= Yii::app()->user->getFlash('success2') ?>
                        </div>
                     <script>

                            $('.modal-body').hide();
                            $('.modal-header').hide();
                            $('.modal-footer').hide();
                            setTimeout(function(){
                                $('#CallbackEmail').modal('hide');
                            }, 2000);
                           setTimeout(function(){
                            $('.modal-header').show();
                            $('.modal-body').show();
                            $('.modal-footer').show();
                            $('.modal-success-message').hide();

                                }, 4000);
                    </script>

                    <?php endif ?>

                    <div class="modal-body">
                        <?= $form->textFieldGroup($model, 'name', [
                            'widgetOptions'=>[
                                'htmlOptions'=>[
                                    'class' => '',
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
                                    'placeholder' => 'Телефон',
                                    'autocomplete' => 'off'
                                ]
                            ]) ?>
                        </div>
                        <?= $form->hiddenField($model, 'verify'); ?>
                        <?= $form->hiddenField($model, 'ip'); ?>
                         <?= $form->textAreaGroup($model, 'comment',[
                            'widgetOptions' => [
                                    'htmlOptions' => [
                                        'placeholder' => 'улица, № дома, № квартиры, № подъезда, № этажа',
                                    ]
                                ]
                            ]) ?>


                            <div class="form-captcha">
                                <div class="g-recaptcha" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey ?>"></div>
                                <?= $form->error($model, 'verifyCode');?>
                            </div>
                            <div class="terms_of_use"> * Нажимая на кнопку "Отправить", я даю согласие на обработку моих персональных данных в соответствии с <a style="display:inline" href="/politika-konfidencialnosti" target="_blank">Соглашением об обработке персональных данных</a>
                        </div>

                    </div>
                            <div class="form-button modal-footer d-flex">
                            <button type="submit" class="prod-modal-button" data-send="ajax" id="callback-email-button">Отправить</button>
                            </div>




                <?php $this->endWidget(); ?>
        </div>
    </div>
</div>