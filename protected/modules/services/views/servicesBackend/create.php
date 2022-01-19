<?php
/**
 * Отображение для create:
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
    Yii::t('ServicesModule.services', 'Добавление'),
];

$this->pageTitle = Yii::t('ServicesModule.services', 'Услуги - добавление');

$this->menu = [
    ['icon' => 'fa fa-fw fa-list-alt', 'label' => Yii::t('ServicesModule.services', 'Управление Услугами'), 'url' => ['/services/servicesBackend/index']],
    ['icon' => 'fa fa-fw fa-plus-square', 'label' => Yii::t('ServicesModule.services', 'Добавить Услугу'), 'url' => ['/services/servicesBackend/create']],
];
?>
<div class="page-header">
    <h1>
        <?=  Yii::t('ServicesModule.services', 'Услуги'); ?>
        <small><?=  Yii::t('ServicesModule.services', 'добавление'); ?></small>
    </h1>
</div>

<?=  $this->renderPartial('_form', [
    'model' => $model,
    'menuId'       => $menuId,
     'menuParentId' => $menuParentId
    ]); ?>