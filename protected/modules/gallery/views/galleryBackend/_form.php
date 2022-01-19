<?php
$form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',
    [
        'id' => 'gallery-form',
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        'type' => 'vertical',
         'htmlOptions'            => ['class' => 'well', 'enctype' => 'multipart/form-data'],
    ]
); ?>
<div class="alert alert-info">
    <?= Yii::t('GalleryModule.gallery', 'Fields with'); ?>
    <span class="required">*</span>
    <?= Yii::t('GalleryModule.gallery', 'are required.'); ?>
</div>

<?= $form->errorSummary($model); ?>

<div class='row'>
    <div class="col-sm-2">
        <?= $form->dropDownListGroup(
            $model,
            'owner',
            [
                'widgetOptions' => [
                    'data' => User::getFullNameList(),
                ],
            ]
        ); ?>
    </div>
    <div class='col-sm-2'>
        <?= $form->dropDownListGroup(
            $model,
            'status',
            [
                'widgetOptions' => [
                    'data' => $model->getStatusList(),
                ],
            ]
        ); ?>
    </div>
    <div class="col-sm-2">
        <?= $form->dropDownListGroup(
            $model,
            'category_id',
            [
                'widgetOptions' => [
                    'data' => Yii::app()->getComponent('categoriesRepository')->getFormattedList(
                        (int)Yii::app()->getModule('gallery')->mainCategory
                    ),
                    'htmlOptions' => [
                        'empty' => Yii::t('GalleryModule.gallery', '--choose--'),
                        'encode' => false,
                    ],
                ],
            ]
        ); ?>
    </div>
    <div class="col-sm-2">     <br>
    <?= $form->checkBoxGroup($model, 'names'); ?>
    </div>
    <div class="col-sm-2">     <br>
    <?= $form->checkBoxGroup($model, 'pic_name'); ?>
    </div>
</div>

<div class='row'>
    <div class="col-sm-6">
        <?= $form->textFieldGroup($model, 'name'); ?>
    </div>
     <div class="col-sm-4">
                <?= $form->dropDownListGroup(
                    $model,
                    'self_id',
                    [
                        'widgetOptions' => [
                            'data' => $model->getGalleryList(),
                            'htmlOptions' => [
                                'class' => 'popover-help',
                                'empty' => 'Выбрать',
                                'data-original-title' => $model->getAttributeLabel('self_id'),
                                'data-content' => $model->getAttributeDescription('self_id'),
                                'encode' => false
                            ],
                        ],
                    ]
                ); ?>
    </div>
</div>

<div class="row">
    <div class="col-sm-12 form-group">
        <?= $form->labelEx($model, 'description'); ?>
        <?php $this->widget(
            $this->module->getVisualEditor(),
            [
                'model' => $model,
                'attribute' => 'description',
            ]
        ); ?>
        <?= $form->error($model, 'description'); ?>
    </div>
</div>
<div class='row'>
            <div class="col-sm-7">
                <?php
                echo CHtml::image(
                    !$model->isNewRecord && $model->image ? $model->getImageUrl() : '#',
                    '',
                    [
                        'class' => 'preview-image2',
                        'style' => !$model->isNewRecord && $model->image ? '' : 'display: none',
                    ]
                ); ?>

                <?php if (!$model->isNewRecord && $model->image): ?>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="delete-image2"> <?= Yii::t('YupeModule.yupe', 'Delete the file') ?>
                        </label>
                    </div>
                <?php endif; ?>

                <?= $form->fileFieldGroup(
                    $model,
                    'image',
                    [
                        'widgetOptions' => [
                            'htmlOptions' => [
                                'onchange' => 'readImageURL(this, ".preview-image2");',
                                'style' => 'background-color: inherit;',
                            ],
                        ],
                    ]
                ); ?>

            </div>
        </div>


<?php $this->widget(
    'bootstrap.widgets.TbButton',
    [
        'buttonType' => 'submit',
        'context' => 'primary',
        'label' => $model->isNewRecord ? Yii::t('GalleryModule.gallery', 'Create gallery and continue') : Yii::t(
            'GalleryModule.gallery',
            'Save gallery and continue'
        ),
    ]
); ?>

<?php $this->widget(
    'bootstrap.widgets.TbButton',
    [
        'buttonType' => 'submit',
        'htmlOptions' => ['name' => 'submit-type', 'value' => 'index'],
        'label' => $model->isNewRecord ? Yii::t('GalleryModule.gallery', 'Create gallery and close') : Yii::t(
            'GalleryModule.gallery',
            'Save gallery and close'
        ),
    ]
); ?>

<?php $this->endWidget(); ?>
