<?php
/**
 * Отображение для _form:
 *
 *   @category YupeView
 *   @package  yupe
 *   @author   Yupe Team <team@yupe.ru>
 *   @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
 *   @link     https://yupe.ru
 *
 *   @var $model Services
 *   @var $form TbActiveForm
 *   @var $this ServicesBackendController
 **/
Yii::import('application.modules.menu.models.*');
?>
<script type='text/javascript'>
    $(document).ready(function () {
        $('#menu_id').change(function () {
            var menuId = parseInt($(this).val());
            if (menuId) {
                $.post('<?= Yii::app()->createUrl('/menu/menuitemBackend/getjsonitems/') ?>', {
                    '<?= Yii::app()->getRequest()->csrfTokenName;?>': '<?= Yii::app()->getRequest()->csrfToken;?>',
                    'menuId': menuId
                }, function (response) {
                    if (response.result) {
                        var option = false;
                        var current = <?= (int)$menuParentId; ?>;
                        $.each(response.data, function (index, element) {
                            if (index == current) {
                                option = true;
                            } else {
                                option = false;
                            }
                            $('#parent_id').append(new Option(element, index, option));
                        })
                        if (current) {
                            $('#parent_id').val(current);
                        }
                        $('#parent_id').removeAttr('disabled');
                        $('#pareData').show();
                    }
                });
            }
        });

        if ($('#menu_id').val() > 0) {
            $('#menu_id').trigger('change');
        }

    })
</script>

<ul class="nav nav-tabs">
    <li class="active"><a href="#common" data-toggle="tab">Общие</a></li>
    <li><a href="#seo" data-toggle="tab">Данные для поисковой оптимизации</a></li>
    <li><a href="#setting" data-toggle="tab">Произвольные поля</a></li>
</ul>
<?php

$form = $this->beginWidget(
    '\yupe\widgets\ActiveForm', [
        'id'                     => 'services-form',
        'enableAjaxValidation'   => false,
        'enableClientValidation' => true,
        'htmlOptions' => ['class' => 'well', 'enctype' => 'multipart/form-data'],
    ]
);
?>

<div class="alert alert-info">
    <?=  Yii::t('ServicesModule.services', 'Поля, отмеченные'); ?>
    <span class="required">*</span>
    <?=  Yii::t('ServicesModule.services', 'обязательны.'); ?>
</div>

<?=  $form->errorSummary($model); ?>
<div class="tab-content">
    <div class="tab-pane active" id="common">
        <?php if (Yii::app()->hasModule('menu')): { ?>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <?= CHtml::label(Yii::t('ServicesModule.service', 'Меню'), 'menu_id'); ?>
                        <?= CHtml::dropDownList(
                            'menu_id',
                            $menuId,
                            CHtml::listData(Menu::model()->active()->findAll(['order' => 'name DESC']), 'id', 'name'),
                            ['empty' => Yii::t('ServicesModule.service', '-выбрать-'), 'class' => 'form-control']
                        ); ?>
                    </div>

                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <div id="pareData" style='display:none;'>
                            <?= CHtml::label(Yii::t('ServicesModule.service', 'Родительский пункт меню'), 'parent_id'); ?>
                            <?= CHtml::dropDownList(
                                'parent_id',
                                $menuParentId,
                                ['0' => Yii::t('ServicesModule.service', 'Корень')],
                                [
                                    'disabled' => true,
                                    'empty' => Yii::t('ServicesModule.service', '-выбрать-'),
                                    'class' => 'form-control'
                                ]
                            ); ?>
                        </div>
                    </div>

                </div>
            </div>
        <?php } endif ?>
        <div class="row">
            <div class="col-sm-4">
                <?= $form->dropDownListGroup(
                    $model,
                    'parent_id',
                    [
                        'widgetOptions' => [
                            'data' => $model->getFormattedList(),
                            'htmlOptions' => [
                                'class' => 'popover-help',
                                'empty' => Yii::t('ServicesModule.services', '--нет--'),
                                'data-original-title' => $model->getAttributeLabel('parent_id'),
                                'data-content' => $model->getAttributeDescription('parent_id'),
                                'encode' => false,
                            ],
                        ],
                    ]
                ); ?>
            </div>
            <div class="col-sm-3">
                <br/>
                <?= $form->checkBoxGroup($model, 'is_home'); ?>
                <?= $form->checkBoxGroup($model, 'is_menu'); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textFieldGroup($model, 'name_short', [
                    'widgetOptions' => [
                        'htmlOptions' => [
                            'class' => 'popover-help',
                            'data-original-title' => $model->getAttributeLabel('name_short'),
                            'data-content' => $model->getAttributeDescription('name_short')
                        ]
                    ]
                ]); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textFieldGroup($model, 'name', [
                    'widgetOptions' => [
                        'htmlOptions' => [
                            'class' => 'popover-help',
                            'data-original-title' => $model->getAttributeLabel('name'),
                            'data-content' => $model->getAttributeDescription('name')
                        ]
                    ]
                ]); ?>
            </div>
        </div>
        <div class='row'>
            <div class="col-sm-8">
                <?= $form->slugFieldGroup($model, 'slug', ['sourceAttribute' => 'name']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textFieldGroup($model, 'name_h1', [
                    'widgetOptions' => [
                        'htmlOptions' => [
                            'class' => 'popover-help',
                            'data-original-title' => $model->getAttributeLabel('name_h1'),
                            'data-content' => $model->getAttributeDescription('name_h1')
                        ]
                    ]
                ]); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 popover-help" data-original-title='<?= $model->getAttributeLabel('description_short'); ?>'
                 data-content='<?= $model->getAttributeDescription('description_short'); ?>'>
                <?= $form->labelEx($model, 'description_short'); ?>
                <?php
                $this->widget(
                    $this->module->getVisualEditor(),
                    [
                        'model' => $model,
                        'attribute' => 'description_short',
                    ]
                ); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 popover-help" data-original-title='<?= $model->getAttributeLabel('description'); ?>'
                 data-content='<?= $model->getAttributeDescription('description'); ?>'>
                <?= $form->labelEx($model, 'description'); ?>
                <?php
                $this->widget(
                    $this->module->getVisualEditor(),
                    [
                        'model' => $model,
                        'attribute' => 'description',
                    ]
                ); ?>
            </div>
        </div>
        <div class='row'>
            <div class="col-sm-8">
                <?php
                echo CHtml::image(
                    !$model->isNewRecord && $model->image ? $model->getImageUrl(100, 100) : '#',
                    '',
                    [
                        'class' => 'preview-image',
                        'style' => !$model->isNewRecord && $model->image ? '' : 'display:none',
                    ]
                ); ?>

                <?php if (!$model->isNewRecord && $model->image): ?>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="delete-file"> <?= Yii::t('YupeModule.yupe', 'Delete the file') ?>
                        </label>
                    </div>
                <?php endif; ?>

                <?= $form->fileFieldGroup($model, 'image'); ?>

            </div>
        </div>

        <br/>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->dropDownListGroup($model, 'status', [
                    'widgetOptions' => [
                        'data' => $model->getStatusList(),
                        'htmlOptions' => [
                            'class' => 'popover-help',
                            'data-original-title' => $model->getAttributeLabel('status'),
                            'data-content' => $model->getAttributeDescription('status')
                        ]
                    ]
                ]); ?>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="seo">
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textFieldGroup($model, 'meta_title', [
                    'widgetOptions' => [
                        'htmlOptions' => [
                            'class' => 'popover-help',
                            'data-original-title' => $model->getAttributeLabel('meta_title'),
                            'data-content' => $model->getAttributeDescription('meta_title')
                        ]
                    ]
                ]); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textAreaGroup($model, 'meta_keywords', [
                'widgetOptions' => [
                    'htmlOptions' => [
                        'class' => 'popover-help',
                        'rows' => 6,
                        'cols' => 50,
                        'data-original-title' => $model->getAttributeLabel('meta_keywords'),
                        'data-content' => $model->getAttributeDescription('meta_keywords')
                    ]
                ]]); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <?=  $form->textAreaGroup($model, 'meta_description', [
                'widgetOptions' => [
                    'htmlOptions' => [
                        'class' => 'popover-help',
                        'rows' => 6,
                        'cols' => 50,
                        'data-original-title' => $model->getAttributeLabel('meta_description'),
                        'data-content' => $model->getAttributeDescription('meta_description')
                    ]
                ]]); ?>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="setting">
        <?php $this->renderPartial('application.modules.yupe.views.customFieldBehavior._my-custom-field', ['model' => $model]) ?>
    </div>
</div>

    <?php $this->widget(
        'bootstrap.widgets.TbButton', [
            'buttonType' => 'submit',
            'context'    => 'primary',
            'label'      => Yii::t('ServicesModule.services', 'Сохранить Услугу и продолжить'),
        ]
    ); ?>
    <?php $this->widget(
        'bootstrap.widgets.TbButton', [
            'buttonType' => 'submit',
            'htmlOptions'=> ['name' => 'submit-type', 'value' => 'index'],
            'label'      => Yii::t('ServicesModule.services', 'Сохранить Услугу и закрыть'),
        ]
    ); ?>

<?php $this->endWidget(); ?>