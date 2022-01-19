<?php
    /**
     * @var Category $category
     */
        $this->title = 'Акции Вивальди';
        $this->description = 'Акции Вивальди';
        $this->breadcrumbs = ['Акции'];
        $stocks = Stocks::model()->published()->findAll();
        $this->breadcrumbs = array_merge(
            ['Новости и Акции' => ['/novosti-akcii']],
            ['Акции']
            );
 ?>
    <!-- start хлебные крошки-->
        <div class="container">
            <?php $this->widget(
                'bootstrap.widgets.TbBreadcrumbs',
                [
                    'links' => $this->breadcrumbs,
                ]
            );?>
        </div>
        <div class="pageMainContent">
            <div class="container">
                <div class="stock-header d-flex">
                <h1 class="page_title">Мы работаем для Вас!</h1>
                </div>
            </div>
            <div class="container stock-grid">
                <?php foreach ($stocks as $key => $stock): ?>
                    <?php if ($stock->status ==1): ?>
                    <a class="stocks__item" href="<?= Yii::app()->createUrl('/stocks/stocks/view', ['slug'=>$stock->slug]) ?>">
                        <picture>
                            <source data-webp="<?= $stock->getImageUrlWebp(0,0,true,null,'image')?>"  type="image/webp">
                            <img data-src="<?= $stock->getImageUrl(0,0,true,null,'image')?>" alt="">
                        </picture>
                        <div class="stock-name">
                            <?= $stock->badge?>
                        </div>
                    </a>
                    <?php endif ?>
                <?php endforeach ?>
            </div>
        </div>
    <!-- end хлебные крошки-->

