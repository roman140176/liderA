<div id="callbackModal" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Заполните форму отправки</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', [
                        'id'=>'callback-form-head',
                        'type' => 'vertical',
                        'action' => '/',
                        'htmlOptions' => ['class' => 'ajax-form',
                        'data-type' => 'ajax-form',
                        'autocomplete' => 'off'
                        ],
                    ]); ?>
                    <div class="modal-body">

                        <div class="form group">
                            <label for="CallbackFormModal_name" class="required">
                                <?= $model->getAttributeLabel('name')?>
                                <span>*</span>
                            </label>
                            <input type="text"
                            id="CallbackFormModal_name"
                            autocomplete="off"
                            name="CallbackFormModal[name]"
                            class="form_field form-control"
                            placeholder="Ваше имя"
                            data-name="имя">
                            <div class="status"></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label required" for="CallbackFormModal_phone">
                                <?= $model->getAttributeLabel('phone')?>
                                <span class="required">*</span>
                            </label>
                            <input class="form_field tel form-control"
                            id="CallbackFormModal_phone"
                            placeholder="+7 (xxx) xxx xxxx"
                            autocomplete="off"
                            name="CallbackFormModal[phone]"
                            type="tel"
                            data-name="телефон">
                            <div class="status"></div>
                       </div>
                       <!--  testing-->
                       <!-- <div class="form-group">
                           <label for="simple">Выбрать Дату</label><br>
                            <input type="text" id="simple" autocomplete="off" name="CallbackFormModal[date]">
                       </div> -->
                       <!-- /testing -->
                        <?= $form->hiddenField($model, 'verify'); ?>
                        <div class="form-bot" style="margin-top:40px">
                            <div class="form-captcha">
                                <div class="g-recaptcha" data-callback="recaptcha_callback" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey ?>">
                                </div>
                                <div class="status capcha-error"></div>
                            </div>
                            <div class="form-button">
                               <button type="submit" class="redButton" data-send="ajax" id="callback-form-modal">Отправить</button>
                            </div>
                        </div>
                        <div class="callback-form-footer">
                            <div class="terms_of_use"> * Нажимая на кнопку "Отправить", я даю согласие на обработку моих персональных данных в соответствии с <a style="display:inline" href="#agreement">Соглашением об обработке персональных данных</a>
                            </div>
                        </div>
                    </div>

                <?php $this->endWidget(); ?>
        </div>
    </div>
</div>

