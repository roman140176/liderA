<?php
/**
 * Отображение для index:
 *
 *   @category YupeView
 *   @package  yupe
 *   @author   Yupe Team <team@yupe.ru>
 *   @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
 *   @link     https://yupe.ru
 **/
$this->breadcrumbs = [
    $this->getModule()->getCategory() => [],
    Yii::t('ServicesModule.services', 'Услуги') => ['/services/servicesBackend/index'],
    Yii::t('ServicesModule.services', 'Управление'),
];

$this->pageTitle = Yii::t('ServicesModule.services', 'Услуги - управление');

$this->menu = [
    ['icon' => 'fa fa-fw fa-list-alt', 'label' => Yii::t('ServicesModule.services', 'Управление Услугами'), 'url' => ['/services/servicesBackend/index']],
    ['icon' => 'fa fa-fw fa-plus-square', 'label' => Yii::t('ServicesModule.services', 'Добавить Услугу'), 'url' => ['/services/servicesBackend/create']],
];
?>
<div class="page-header">
    <h1>
        <?=  Yii::t('ServicesModule.services', 'Услуги'); ?>
        <small><?=  Yii::t('ServicesModule.services', 'управление'); ?></small>
    </h1>
</div>

<p>
    <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="collapse" data-target="#search-toggle">
        <i class="fa fa-search">&nbsp;</i>
        <?=  Yii::t('ServicesModule.services', 'Поиск Услуг');?>
        <span class="caret">&nbsp;</span>
    </a>
</p>

<div id="search-toggle" class="collapse out search-form">
        <?php Yii::app()->clientScript->registerScript('search', "
        $('.search-form form').submit(function () {
            $.fn.yiiGridView.update('services-grid', {
                data: $(this).serialize()
            });

            return false;
        });
    ");
    $this->renderPartial('_search', ['model' => $model]);
?>
</div>

<br/>

<p> <?=  Yii::t('ServicesModule.services', 'В данном разделе представлены средства управления Услугами'); ?>
</p>

<?php
 $this->widget(
    'yupe\widgets\CustomGridView',
    [
        'id'           => 'services-grid',
        'sortableRows'      => true,
        'sortableAjaxSave'  => true,
        'sortableAttribute' => 'position',
        'sortableAction'    => '/services/servicesBackend/sortable',
        'type'         => 'condensed',
        'dataProvider' => $model->search(),
        'filter'       => $model,
        'columns'      => [
            'id',
            [
                'type' => 'raw',
                'value' => function ($data) {
                    return CHtml::image($data->getImageUrl(100, 100), '', ["width" => 40, "height" => 40, "class" => "img-thumbnail"]);
                },
            ],
            [
                'type' => 'raw',
                'name'   => 'parent_id',
                'value'  => function($data){
                    return '<span class="label label-primary">'.strip_tags($data->parentService->name).'</span>';
                },
                'filter' => CHtml::activeDropDownList(
                    $model,
                    'parent_id',
                    $model->getFormattedList(),
                    ['encode' => false, 'empty' => '', 'class' => 'form-control']
                )
            ],
            'name',
            'slug',
            [
                'class' => 'yupe\widgets\EditableStatusColumn',
                'name' => 'status',
                'url' => $this->createUrl('/services/servicesBackend/inline'),
                'source' => $model->getStatusList(),
                'options' => [
                    Services::STATUS_PUBLIC => ['class' => 'label-success'],
                    Services::STATUS_MODERATE => ['class' => 'label-default'],
                ],
            ],
            [
                'class' => 'yupe\widgets\CustomButtonColumn',
            ],
        ],
    ]
); ?>
