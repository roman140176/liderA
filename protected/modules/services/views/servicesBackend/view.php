<?php
/**
 * Отображение для view:
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
    $model->name,
];

$this->pageTitle = Yii::t('ServicesModule.services', 'Услуги - просмотр');

$this->menu = [
    ['icon' => 'fa fa-fw fa-list-alt', 'label' => Yii::t('ServicesModule.services', 'Управление Услугами'), 'url' => ['/services/servicesBackend/index']],
    ['icon' => 'fa fa-fw fa-plus-square', 'label' => Yii::t('ServicesModule.services', 'Добавить Услугу'), 'url' => ['/services/servicesBackend/create']],
    ['label' => Yii::t('ServicesModule.services', 'Услуга') . ' «' . mb_substr($model->id, 0, 32) . '»'],
    ['icon' => 'fa fa-fw fa-pencil', 'label' => Yii::t('ServicesModule.services', 'Редактирование Услуги'), 'url' => [
        '/services/servicesBackend/update',
        'id' => $model->id
    ]],
    ['icon' => 'fa fa-fw fa-eye', 'label' => Yii::t('ServicesModule.services', 'Просмотреть Услугу'), 'url' => [
        '/services/servicesBackend/view',
        'id' => $model->id
    ]],
    ['icon' => 'fa fa-fw fa-trash-o', 'label' => Yii::t('ServicesModule.services', 'Удалить Услугу'), 'url' => '#', 'linkOptions' => [
        'submit' => ['/services/servicesBackend/delete', 'id' => $model->id],
        'confirm' => Yii::t('ServicesModule.services', 'Вы уверены, что хотите удалить Услугу?'),
        'csrf' => true,
    ]],
];
?>
<div class="page-header">
    <h1>
        <?=  Yii::t('ServicesModule.services', 'Просмотр') . ' ' . Yii::t('ServicesModule.services', 'Услуги'); ?>        <br/>
        <small>&laquo;<?=  $model->name; ?>&raquo;</small>
    </h1>
</div>

<?php $this->widget('bootstrap.widgets.TbDetailView', [
    'data'       => $model,
    'attributes' => [
        'id',
        'create_user_id',
        'update_user_id',
        'create_time',
        'update_time',
        'parent_id',
        'name_short',
        'name',
        'slug',
        'name_h1',
        'image',
        'description_short',
        'description',
        'meta_title',
        'meta_keywords',
        'meta_description',
        'status',
        'position',
    ],
]); ?>
