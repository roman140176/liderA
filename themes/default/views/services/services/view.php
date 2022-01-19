<?php
/* @var $model Carbrands */
/* @var $this CarbrandsController */

$this->title = $model->meta_title ?: $model->name;
$this->description = $model->meta_description ?: Yii::app()->getModule('yupe')->siteDescription;
$this->keywords = $model->meta_keywords ?: Yii::app()->getModule('yupe')->siteKeyWords;

$this->breadcrumbs = array_merge(
    ['Услуги' => ['/services']],
    [$model->name]
);

$this->headerClass = 'header-services';

?>

<div class="container">
	<?= $model->description ?>

</div>