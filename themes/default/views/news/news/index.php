<?php
$this->title = Yii::app()->getModule('news')->metaTitle ?: Yii::t('NewsModule.news', 'News');
$this->description = Yii::app()->getModule('news')->metaDescription;
$this->keywords = Yii::app()->getModule('news')->metaKeyWords;

$this->breadcrumbs = [Yii::t('NewsModule.news', 'News')];
?>
<div class="container">
<?php $this->widget(
    'bootstrap.widgets.TbBreadcrumbs',
    [
        'links' => $this->breadcrumbs,
    ]
);?>
<h1><?= Yii::t('NewsModule.news', 'News') ?></h1>

<?php $this->widget(
    'application.components.NewsListView',
    [
        'dataProvider' => $dataProvider,
        'itemView' => '_item',
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
