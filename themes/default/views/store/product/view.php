<?php

/* @var $product Product */

$this->title = $product->getMetaTitle();
$this->description = $product->getMetaDescription();
$this->keywords = $product->getMetaKeywords();
$this->canonical = $product->getMetaCanonical();

$mainAssets = Yii::app()->getModule('store')->getAssetsUrl();
$images = $product->getImages();
$this->breadcrumbs = array_merge(
    [Yii::t("StoreModule.store", 'Catalog') => ['/store']],
    $product->category ? $product->category->getBreadcrumbs(true) : [],
    [CHtml::encode($product->name)]
);
Yii::import('application.components.MyHtml');
?>
<div class="product-row w991" xmlns="http://www.w3.org/1999/html" itemscope itemtype="http://schema.org/Product">
    <div class="container">
        <?php $this->widget('application.components.MyTbBreadcrumbs', [
                'links' => $this->breadcrumbs,
        ]); ?>
        <h1 class="page-title producttitle">
            <?= CHtml::encode($product->name)?>
        </h1>
    </div>
    <div class="container container-singl-product d-flex">
        <?php $this->renderPartial('./_images',['product' => $product,'images' => $images]); ?>
        <?php $this->renderPartial('./_info',['product' => $product]); ?>
    </div>
    <section class="similar-products">
        <?php $this->widget('application.modules.store.widgets.ProductTypeWidget',[
        'category_id' => $product->category->id,
        'delete' => "id <> {$product->id}"
        ]); ?>
    </section>
</div>
