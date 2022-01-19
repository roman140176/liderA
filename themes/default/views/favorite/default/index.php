<?php
$mainAssets = Yii::app()->getTheme()->getAssetsUrl();


$this->title = 'Избранные товары';
$this->breadcrumbs = [
    Yii::t("StoreModule.store", "Catalog") => ['/store/category/index'],
    'Избранные товары'
];
?>

<div class="page-content-favorites w991">
    <div class="container">
        <?php $this->widget('bootstrap.widgets.TbBreadcrumbs', [
            'links' => $this->breadcrumbs,
        ]); ?>
        <h1 class="page-title favorite-title" id="favorite-title">Избранные товары</h1>
    </div>
    <div class="container result-search-container">

        <?php $this->widget(
            'application.components.NewsListView', [
                'dataProvider' => $dataProvider,
                'viewData' => [
                    'isdelete' => true
                ],
                'itemView' => '//store/product/_favorite',
                'template' => '
                    {items}
                    {pager}
                ',
                'summaryText' => '',
                'htmlOptions' => [
                        'class' => 'search-list-view',
                        ],
                'itemsCssClass'=>'search-list',
                'pagerCssClass' => 'pagination-box',
                'ajaxUpdate'=>'true',
                     'pagerCssClass' => 'pagination-box',
                    'pager' => [
                    'class' => 'booster.widgets.TbPager',
                    'maxButtonCount' => 5,
                    'htmlOptions' => [
                        'class' => 'pagination'
                    ],
                ]
            ]
        ); ?>


    </div>
</div>