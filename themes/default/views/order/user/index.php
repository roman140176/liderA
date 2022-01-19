<?php
/* @var $orders Order[] */

$mainAssets = Yii::app()->getTheme()->getAssetsUrl();
$this->breadcrumbs = [
    "Личный кабинет" => [Yii::app()->createUrl('/user/profile/index')],
    Yii::t('OrderModule.order', 'Orders history')
];
$this->layout = "//layouts/user";

$this->title = Yii::t('OrderModule.order', 'Orders history');
?>

<!-- <h1><?= Yii::t('OrderModule.order', 'Orders history'); ?></h1> -->

<div class="lk-order">
    <div class="lk-order__header">
        <div class="lk-order__column lk-order__column-date"><?= Yii::t("OrderModule.order", "Date");?></div>
        <div class="lk-order__column lk-order__column-name"><?= Yii::t("OrderModule.order", "Order #");?></div>
        <div class="lk-order__column"><?= Yii::t("OrderModule.order", "Status");?></div>
    </div>
    <?php $this->widget(
        'application.components.NewsListView',
        [
            'dataProvider' => $dataProvider,
            'id' => '',
            'itemView' => '_item',
            'summaryText' => '',
            'template'=>'{items} {pager}',
            'itemsCssClass' => 'lk-order__box',
            'ajaxUpdate'=> false,
            'pagerCssClass' => 'pagination-box',
            'pager' => [
            'class' => 'booster.widgets.TbPager',
            'maxButtonCount' => 9,
                'htmlOptions' => [
                    'class' => 'pagination'
                ],
            ]
        ]
    ); ?>
</div>
