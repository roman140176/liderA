<?php $Assets = Yii::app()->getTheme()->getAssetsUrl() ;$nav = []?>
<section class="container container-sliders">
    <div class="main-slider posrel">
        <div class="swiper-wrapper">
                <?php foreach ($model->images as $key => $image): ?>
                    <div class="swiper-slide main-slider__item">
                        <img
                            src="<?= $Assets. '/images/elements/top.gif' ?>"
                            data-src="<?= $image->getImageUrl()?>"
                            alt="<?= Yii::app()->getModule('yupe')->siteName?>"
                            class="slide-image"
                        >
                        <div class="spinner-border text-success abs" role="status" id="spinner">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                <?php endforeach ?>
        </div>
        <div class="sp swiper-button-prev"></div>
        <div class="sn swiper-button-next"></div>
        <div class="swiper-pagination"></div>
    </div>
</section>