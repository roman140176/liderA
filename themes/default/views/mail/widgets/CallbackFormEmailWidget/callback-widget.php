<?php $assets = Yii::app()->getTheme()->getAssetsUrl()?>
<div id="CallbackFormEmail" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content d-flex">
            <div class="modal__left">
                <img
                data-src="<?= $assets.'/images/elements/mod.jpg'?>"
                src="<?= $assets.'/images/elements/mod.gif'?>"
                alt="Задать вопрос">
            </div>
            <div class="modal__right">
                <div class="modal-header">
                    <div class="mh__head">
                        <h5 class="modal-title" id="exampleModalLabel">Задать вопрос</h5>
                        <div class="mod-desription">
                            Заполните форму обратной связи и наши специалисты свяжутся
                            <br>с вами в ближайшее время
                        </div>
                    </div>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', [
                        'id'=>'callback-form-emailmodal',
                        'type' => 'vertical',
                        'htmlOptions' => ['class' => 'ajax-form', 'data-type' => 'ajax-form'],
                    ]); ?>

                    <div class="modal-body">
                        <div class="client-warn">
                            Все поля отмеченные знаком * обязательны для заполнения
                        </div>
                        <div class="modal-flex-inputs d-flex">
                            <div class="form-group">
                                <label for="CallbackFormEmailModal_name" class="required">
                                    <?= $model->getAttributeLabel('name')?>
                                    <span>*</span>
                                </label>
                                <input type="text"
                                id="CallbackFormEmailModal"
                                autocomplete="off"
                                name="CallbackFormEmailModal[name]"
                                class="form_field form-control"
                                placeholder="Имя*"
                                data-name="имя">
                                <div class="status"></div>
                            </div>

                            <div class="form-group">
                                <label class="control-label required" for="CallbackFormEmailModal_phone">
                                    <?= $model->getAttributeLabel('phone')?>
                                    <span class="required">*</span>
                                </label>
                                <input class="form_field tel form-control"
                                id="CallbackFormEmailModal_phone"
                                placeholder="Телефон*"
                                autocomplete="off"
                                name="CallbackFormEmailModal[phone]"
                                type="tel"
                                data-name="телефон">
                                <div class="status"></div>
                            </div>
                        </div>
                        <div class="areabox">
                            <div class="form-group">
                                <label class="control-label required" for="CallbackFormEmailModal_body">
                                    <?= $model->getAttributeLabel('body')?>
                                    <span class="required">*</span>
                                </label>
                                <textarea
                                id="CallbackFormEmailModal_body"
                                autocomplete="off"
                                name="CallbackFormEmailModal[body]"
                                class="form_field form-control"
                                placeholder="сообщение"
                                data-name="Сообщение"></textarea>
                                <div class="status"></div>
                             </div>
                       </div>
                        <?= $form->hiddenField($model, 'verify'); ?>
                        <div class="form-bot">
                            <div class="form-captcha">
                                <div class="g-recaptcha" data-callback="recaptcha_callback" data-sitekey="<?= Yii::app()->getModule('yupe')->siteKey ?>">
                                </div>
                                <div class="status capcha-error"></div>
                            </div>
                            <div class="form-button d-flex">
                                <button type="submit" class="redButton" data-send="ajax" id="callback-emailform-modal">
                                <span>Отправить</span>
                                </button>
                                <div class="condition-accept">
                                    При отправке заявки вы подтверждаете <br>
                                    согласие с <a href="#">политикой конфиденциальности</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php $this->endWidget(); ?>
            </div>
        </div>
    </div>
</div>