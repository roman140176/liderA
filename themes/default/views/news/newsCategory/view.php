<?php
/**
 * @var Category $category
 */

$this->title = $category->name;
$this->breadcrumbs = [
    Yii::t('NewsModule.news', 'News') => ['/news/news/index'],
    Yii::t('NewsModule.news', 'News categories') => ['/news/newsCategory/index'],
    $category->name,
];
?>

<div class="container">
    <?php $this->widget(
                    'bootstrap.widgets.TbBreadcrumbs',
                    [
                        'links' => $this->breadcrumbs,
                    ]
                );?>
    <h1><?= Yii::t('NewsModule.news', 'News in category {name}', ['{name}' => $category->name]) ?></h1>

    <?php $this->widget(
        'application.components.NewsListView',
        [
            'dataProvider' => $dataProvider,
            'itemView' => '//news/news/_item',
        ]
    ); ?>

</div>

