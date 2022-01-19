<?php $Assets = Yii::app()->getTheme()->getAssetsUrl();?>
<div class="catalog-home grid-box">
    <?php foreach ($category as $key => $data): ?>
        <a href="<?= $data->getCategoryUrl()?>" class="catalog-home__item posrel">
            <header>
                <?php $ex = explode('<br>', $data->title);$newEx=[];?>
                <?php foreach ($ex as $i => $e): ?>
                    <?php $e =  ' <div><span>'.$e.'</span></div>'?>
                    <?php $newEx[] = $e ?>
                <?php endforeach ?>

                <?= implode($newEx)?>
            </header>
            <div class="catalog-home__img abs">
                <img
                src="<?= $Assets. '/images/elements/citem.gif' ?>"
                data-src="<?= $data->getImageUrl(345,227,true)?>"
                alt="<?= $data->name?>"
                class="slide-image"
                >
                <div class="spinner-border text-success abs" role="status" id="spinner">
                   <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </a>
    <?php endforeach ?>
</div>