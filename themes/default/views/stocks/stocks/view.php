<?php
/**
* Отображение для ./themes/default/views/news/news/news.php:
*
* @category YupeView
* @package  YupeCMS
* @author   Yupe Team <team@yupe.ru>
* @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
* @link     http://yupe.ru
*
* @var $this NewsController
* @var $model News
**/
?>
<?php

$this->title = $model->title ? $model->title : $model->title;
$this->description = $model->description;

?>

<?php
$this->breadcrumbs = [
    $model->title,
];
$this->breadcrumbs = array_merge(
['Акции' => ['/stocks']],
[$model->title]
);
?>
<div class="container">
        <?php $this->widget('application.components.MyTbBreadcrumbs', [
                'links' => $this->breadcrumbs,
        ]); ?>
        <h1 class="page-title producttitle">
            <?= CHtml::encode($model->title)?>
        </h1>
</div>