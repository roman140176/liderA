<?php
$mainAssets = Yii::app()->getTheme()->getAssetsUrl();

/* @var $category StoreCategory */

$this->title =  $category->getMetaTitle();
$this->description = $category->getMetaDescription();
$this->keywords =  $category->getMetaKeywords();
$this->canonical = $category->getMetaCanonical();

$this->breadcrumbs = [Yii::t("StoreModule.store", "Catalog") => ['/store']];

$this->breadcrumbs = array_merge(
    $this->breadcrumbs,
    $category->getBreadcrumbs(true)
);

?>

<div class="container w991">
    <?php $this->widget('application.components.MyTbBreadcrumbs', [
        'links' => $this->breadcrumbs,
        ]); ?>
    <h1 class="page-title"><?= CHtml::encode($category->name); ?></h1>
</div>

<div class="container d-grid container-category-view">
    <div class="filters-form-wrapper">
    <div class="wrap-title">
        Категории
    </div>
        <?php $this->widget('application.modules.store.widgets.CatalogWidget',['view' => 'categories']); ?>

        <form id="store-filter" name="store-filter" method="get">
            <header class="form-filter-header">
                <div class="ffh__flex d-flex">
                    <div class="params-title">Параметры отбора</div>
                    <div class="ff-close"><span>Закрыть</span></div>
                    <button type="submit" class="params-close"><span>Применить</span></button>
                </div>
            </header>
            <div class="filters">
                <?php $this->widget('application.modules.store.widgets.filters.FilterBlockWidget', [
                    'category' => $category
                ]); ?>
            </div>
        </form>
    </div>

    <section class="grid">
        <?php if($category->children): ?>
            <div class="catalog-home grid-box">
                <?php foreach ($category->children as $child): ?>
                    <a href="<?= $child->getCategoryUrl()?>" class="catalog-home__item catalogmain posrel">
                        <span class="link-header db">
                            <?php $ex = explode('<br>', $child->title);$newEx=[];?>
                            <?php foreach ($ex as $i => $e): ?>
                                <?php $e =  ' <div><span>'.$e.'</span></div>'?>
                                <?php $newEx[] = $e ?>
                            <?php endforeach ?>

                            <?= implode($newEx)?>
                        </span>
                        <span class="catalog-home__img abs">
                            <img
                                src="<?= $child->getImageUrl(345,227,true)?>"
                                alt="<?= $child->name?>"
                                class="slide-image"
                            >
                        </span>
                    </a>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="mobile-filter-box">
                <div class="mfb d-flex">
                    <div class="visible-mobile open-category" data-open="cm-data">
                        Категории
                    </div>
                    <div class="visible-mobile open-filter" data-open="store-filter">
                        Фильтры
                    </div>
                </div>
            </div>
            <?php $this->widget(
                'application.components.MyListView',
                [
                    'dataProvider' => $dataProvider,
                    'id' => 'product-box',
                    'itemView' => '//store/product/'.$this->storeItem,
                    'emptyText'=>'В данной категории нет товаров.',
                    'summaryText'=>"<div class=\"catalog-controls__label-pr-count\">
                                {start}-{end} из {count}
                            </div>",
                    'template'=>'
                    {controls}
                        {items}
                        <div class="product-nav">
                            {pager}
                        </div>
                    ',
                    'countProduct' => count($category->getProducts()),
                    'sorterDropDown' => [
                        'is_new.desc' => 'Новинки',
                        'populate.desc' => 'По популярности',
                    ],
                    // 'sortableAttributes' => [
                    //     'name' => 'По названию',
                    //     'price_result' => 'По цене',
                    // ],
                    'sorterClassUl' => 'sort-box__list',
                    'sorterHeader' => 'Сортировка',
                    'itemsCssClass' => "product-list d-grid",
                    'ajaxUpdate'=>false,
                    'enableHistory' => false,
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
        <?php endif; ?>
    </section>
</div>
