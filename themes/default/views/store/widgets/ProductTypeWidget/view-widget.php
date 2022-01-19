<div class="container container-newproducts">
    <h2 class="page-title">Похожие товары</h2>
    <div class="sliderwrapper">
        <div class="home-product-box posrel">
            <div class="swiper-wrapper">
                    <?php foreach ($models as $key => $data) : ?>
                        <?php Yii::app()->controller->renderPartial('//store/product/_itemSlide', ['data' => $data]) ?>
                    <?php endforeach; ?>
            </div>
            <div class="swp swiper-button-prev"></div>
            <div class="swp swiper-button-next"></div>
        </div>
    </div>
</div>