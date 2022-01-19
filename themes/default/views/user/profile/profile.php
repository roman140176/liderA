<?php
$this->title = Yii::t('UserModule.user', 'Настройки');
// $this->breadcrumbs = [Yii::t('UserModule.user', 'Настройки')];
$this->breadcrumbs = [
    "Личный кабинет" => [Yii::app()->createUrl('/user/profile/index')],
    Yii::t('UserModule.user', 'Настройки')
];
$this->layout = "//layouts/user";

$form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',
    [
        'id' => 'profile-form',
        'enableAjaxValidation' => false,
        'enableClientValidation' => false,
        'type' => 'vertical',
        'htmlOptions' => ['class' => 'settings-form', 'data-type' => 'ajax-form','enctype' => 'multipart/form-data']
    ]
);
?>
    <?= $form->errorSummary($model); ?>

    <h3>Настройки</h3>
    <div class="lk-setting">
        <div class="lk-setting__img">
                <?php if($user->avatar) : ?>
                 <div class="lk-setting__avatar">
                    <?= CHtml::image( '/uploads/' . $this->module->avatarsDir . '/' . $user->avatar, ''); ?>
                 </div>
                <?php else: ?>
                <div class="lk-setting__avatar no-avatar">
                    <?= CHtml::image(Yii::app()->getTheme()->getAssetsUrl() . '/images/empty.svg', '', ['class' => 'nophoto']); ?>
                </div>
                <?php endif; ?>
            <div class="upload-box">
                <div class="upload-box__btn"><span>Прикрепить фото</span></div>
                <div class="form-group" id="uploaud_box">
                    <input class="multi with-preview form-control"
                    maxlength="20" id="ProfileForm_avatar"
                    multiple="multiple" name="ProfileForm[avatar]"
                    accept="image/*,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                    type="file">
                    <div class="file-list"></div>
                </div>
            </div>

        </div>
        <div class="lk-setting__content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="ProfileForm_last_name">
                                <?= $model->getAttributeLabel('last_name')?>
                            </label>
                            <input type="text"
                            id="ProfileForm_last_name"
                            autocomplete="off"
                            name="ProfileForm[last_name]"
                            class="form_field form-control"
                            placeholder="Фамилия"
                            data-name="Фамилия"
                            value="<?= $user->last_name ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="ProfileForm_first_name">
                                <?= $model->getAttributeLabel('first_name')?>
                            </label>
                            <input type="text"
                            id="ProfileForm_first_name"
                            autocomplete="off"
                            name="ProfileForm[first_name]"
                            class="form_field form-control"
                            placeholder="Имя"
                            data-name="Имя"
                            value="<?= $user->first_name ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="ProfileForm_middle_name">
                                <?= $model->getAttributeLabel('middle_name')?>
                            </label>
                            <input type="text"
                            id="ProfileForm_middle_name"
                            autocomplete="off"
                            name="ProfileForm[middle_name]"
                            class="form_field form-control"
                            placeholder="Отчество"
                            data-name="Отчество"
                            value="<?= $user->middle_name ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="ProfileForm_location">
                            <?= $model->getAttributeLabel('location')?>
                            </label>
                            <input type="text"
                            id="ProfileForm_location"
                            autocomplete="off"
                            name="ProfileForm[location]"
                            class="form_field form-control"
                            placeholder="Наименование организации"
                            data-name="Наименование организации"
                            value="<?= $user->location ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>

                </div>
                <div class="col-sm-6" id="adv_inp">
                    <div class="col-sm-12">
                        <div class="form-group form-group-radio">
                            <?= $form->labelEx($model, 'gender'); ?>
                            <div class="input-group radio-list">
                                <?= $form->radioButtonList($model, 'gender', User::model()->getGendersList(),[
                                    'template'=>'<div class="radio-inline">{input}{label}</div>',
                                    'separator' => ''
                                ]) ?>
                            </div>
                            <?= $form->error($model, 'gender');?>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="control-label" for="ProfileForm_phone">
                                <?= $model->getAttributeLabel('phone')?>
                            </label>
                            <input class="form_field tel form-control"
                            id="ProfileForm_phone"
                            placeholder="+7 (xxx) xxx xxxx"
                            autocomplete="off"
                            name="ProfileForm[phone]"
                            type="tel"
                            data-name="телефон"
                            value="<?= $user->phone ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="ProfileForm_about">
                            <?= $model->getAttributeLabel('about')?>
                            </label>
                            <input type="text"
                            id="ProfileForm_about"
                            autocomplete="off"
                            name="ProfileForm[about]"
                            class="form_field form-control"
                            placeholder="<?= $model->getAttributeLabel('about')?>"
                            data-name="<?= $model->getAttributeLabel('about')?>"
                            value="<?= $user->about ? : ''?>"
                            >
                            <div class="status"></div>
                        </div>
                     </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="User_email" class="required">
                                <?= $user->getAttributeLabel('email')?>
                                <span>*</span>
                            </label>
                            <input type="text"
                            id="User_email"
                            autocomplete="off"
                            name="User[email]"
                            class="form_field form-control"
                            placeholder="Ваше имя"
                            data-name="имя"
                            disabled="true"
                            value="<?= $user->email?>"
                            >
                            <div class="status"></div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <button class="user-button but-pink" type="submit">
                            <span>Сохранить данные</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row lk-setting__bottom">

            </div>
        </div>
    </div>
<?php $this->endWidget(); ?>

<script>
    let btnUpload = document.querySelector('.upload-box__btn')
        btnUpload.addEventListener('click',()=>{
            document.getElementById('ProfileForm_avatar').click()
        })
    document.getElementById('ProfileForm_avatar').addEventListener('change', event => {
        let files = Array.from(event.target.files)
        files.forEach((file) => {
            if (!event.target.files.length) {
                return
            }
            const reader = new FileReader()
            reader.onload = ev => {
                let result = ev.target.result
                document.querySelector('.lk-setting__avatar').innerHTML = `<img src="${result}"/>`
            }
            reader.readAsDataURL(file)
        })
    })
</script>
