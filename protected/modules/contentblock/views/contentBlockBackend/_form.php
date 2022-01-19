<?php
/**
 * @var $model ContentBlock
 * @var $this ContentBlockBackendController
 * @var $form \yupe\widgets\ActiveForm
 */
?>
<?php
$form = $this->beginWidget(
    'yupe\widgets\ActiveForm',
    [
        'id'                     => 'content-block-form',
        'enableAjaxValidation'   => false,
        'enableClientValidation' => true,
        'type'                   => 'vertical',
        'htmlOptions'            => ['class' => 'well','enctype' => 'multipart/form-data'],
    ]
); ?>
<div class="alert alert-info">
    <?=  Yii::t('ContentBlockModule.contentblock', 'Fields with'); ?>
    <span class="required">*</span>
    <?=  Yii::t('ContentBlockModule.contentblock', 'are required.'); ?>
</div>

<?=  $form->errorSummary($model); ?>

<div class="row">
    <div class="col-sm-7">
        <?=  $form->dropDownListGroup(
            $model,
            'type',
            ['widgetOptions' => ['data' => $model->getTypes()]]
        ); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-7">
        <?=  $form->textFieldGroup($model, 'name'); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-7">
        <?=  $form->textFieldGroup($model, 'title_short'); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-7">
        <?=  $form->slugFieldGroup($model, 'code', ['sourceAttribute' => 'name']); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-7">
        <?=  $form->dropDownListGroup(
            $model,
            'category_id',
            [
                'widgetOptions' => [
                    'data'        => Yii::app()->getComponent('categoriesRepository')->getFormattedList(),
                    'htmlOptions' => [
                        'empty'               => Yii::t('ContentBlockModule.contentblock', '--choose--'),
                        'class'               => 'popover-help',
                        'data-original-title' => $model->getAttributeLabel('category_id'),
                        'data-content'        => $model->getAttributeDescription('category_id'),
                        'encode'              => false
                    ],
                ],
            ]
        ); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 form-group">
        <?php if (!$model->isNewRecord && $model->type == ContentBlock::HTML_TEXT): ?>
            <?=  $form->labelEx($model, 'content'); ?>
            <?php $this->widget(
                $this->yupe->getVisualEditor(),
                [
                    'model'     => $model,
                    'attribute' => 'content',
                ]
            ); ?>
            <?=  $form->error($model, 'content'); ?>
        <?php else: ?>
            <?=  $form->textAreaGroup(
                $model,
                'content',
                ['widgetOptions' => ['htmlOptions' => ['rows' => 6]]]
            ); ?>
        <?php endif; ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 form-group">
        <?=  $form->labelEx($model, 'description'); ?>
        <?php $this->widget(
            $this->yupe->getVisualEditor(),
            [
                'model'     => $model,
                'attribute' => 'description',
            ]
        ); ?>
        <?=  $form->error($model, 'description'); ?>
    </div>
</div>
<div class='row'>
            <div class="col-sm-7">
                <svg width="35" height="45" viewBox="0 0 35 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M27.3333 43.4444H1V7.66663H19.8913L27.3333 15.1086V43.4444Z" stroke="#56B29D" stroke-width="2"/>
                    <path d="M7.55566 8.62639V1H26.5075H34.0001V8.62639V36.8889H26.5075" stroke="#56B29D" stroke-width="2"/>
                </svg>

                <?php if (!$model->isNewRecord && $model->image): ?>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="delete-image"> <?= Yii::t('YupeModule.yupe', 'Delete the file') ?>
                        </label>
                    </div>
                <?php endif; ?>
                <?= $form->fileFieldGroup(
                    $model,
                    'image',
                    [
                        'widgetOptions' => [
                            'htmlOptions' => [
                                'onchange' => 'readImageURL(this, ".preview-image");',
                                'style' => 'background-color: inherit;',
                            ],
                        ],
                    ]
                ); ?>
            </div>
        </div>
<div class="row">
    <div class="col-sm-12">
        <?=  $form->dropDownListGroup($model, 'status', ['widgetOptions' => ['data' => $model->getStatusList()]]); ?>
    </div>
</div>

<?php $this->widget(
    'bootstrap.widgets.TbButton',
    [
        'buttonType' => 'submit',
        'context'    => 'primary',
        'label'      => $model->isNewRecord ? Yii::t(
            'ContentBlockModule.contentblock',
            'Add block and continue'
        ) : Yii::t('ContentBlockModule.contentblock', 'Save block and continue'),
    ]
); ?>

<?php $this->widget(
    'bootstrap.widgets.TbButton',
    [
        'buttonType'  => 'submit',
        'htmlOptions' => ['name' => 'submit-type', 'value' => 'index'],
        'label'       => $model->isNewRecord ? Yii::t(
            'ContentBlockModule.contentblock',
            'Add block and close'
        ) : Yii::t('ContentBlockModule.contentblock', 'Save block and close'),
    ]
); ?>

<?php $this->endWidget(); ?>
