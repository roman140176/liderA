<?php

$mainAssets = Yii::app()->getTheme()->getAssetsUrl();
$this->title = Yii::app()->getModule('store')->metaTitle ?: Yii::t('StoreModule.store', 'Catalog');
$this->description = Yii::app()->getModule('store')->metaDescription;
$this->keywords = Yii::app()->getModule('store')->metaKeyWords;

$this->breadcrumbs = ['Результаты поиска'];?>
<div class="search-result-content w991">
    <div class="container">
    <?php $this->widget('application.components.MyTbBreadcrumbs', [
                'links' => $this->breadcrumbs,
        ]); ?>
    <h1 class="page-title">Результаты поиска - &laquo;<?= $mainSearchParam['name']?>&raquo;</h1>
    </div>
    <div class="result-search-container">
        <div class="container">
            <?php $this->widget(
                'application.components.NewsListView',
                [
                    'dataProvider' => $dataProvider,
                    'emptyText'=>'Ничего не найдено.',
                    'itemView' => '_itemSlide',
                    'htmlOptions' => [
                        'class' => 'search-list-view',
                        ],
                    'itemsCssClass'=>'search-list',
                    'pager' => [
                        'class' => 'booster.widgets.TbPager',
                        'maxButtonCount' => 5,
                        'htmlOptions' => [
                            'class' => 'pagination-box'
                        ],
                    ]
                ]
            ); ?>
        </div>
    </div>
</div>