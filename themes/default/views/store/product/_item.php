
    <div class="glide__slide product-item-glide" data-item="product-<?= $data->id?>">
        <form action="<?= Yii::app()->createUrl('cart/cart/add'); ?>" method="post" data-max-value='<?= (int)$data->quantity ?>'>
            <input type="hidden" name="Product[id]" value="<?= $data->id; ?>"/>
            <?= CHtml::hiddenField(
                Yii::app()->getRequest()->csrfTokenName,
                Yii::app()->getRequest()->csrfToken
            ); ?>
            <div id="product-<?= $data->id?>"  class="product-item posrel" >
                <?php $images = $data->images;?>
                <?php if ($data->is_new): ?>
                    <header class="card-head d-flex">
                        <div class="isnew">Новинка</div>
                        <a class="toolbar-button" href="<?= Yii::app()->createUrl('/favorite/default/index'); ?>">
                            <div class="product-button__item product-favorite">
                                <?php $this->widget('application.modules.favorite.widgets.FavoriteControl', [
                                    'product' => $data,
                                    'view' => "favorite-item"
                                ]);?>
                            </div>
                        </a>
                    </header>
                <?php endif ?>
                <a href="<?= ProductHelper::getUrl($data); ?>" class="image-wrap posrel">
                    <div class="prod__img abs">
                        <img
                            src=""
                            data-src="<?= $data->getImageUrl(214,220,true); ?>"
                            title="<?= CHtml::encode($data->getImageTitle()); ?>"
                            class="product-image"
                        />
                        <div class="spinner-border text-success abs" role="status" id="spinner">
                           <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                    <?php if ($images>0): ?>
                        <?php foreach ($images as $key => $image) : ?>
                            <div class="prod__img abs">
                                <img
                                    src=""
                                    data-src="<?= $image->getImageUrl(214,220,true); ?>"
                                     title="<?= CHtml::encode($data->getImageTitle()); ?>"
                                     class="product-image"
                                />
                                <div class="spinner-border text-success abs" role="status" id="spinner">
                                   <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        <?php endforeach ?>
                    <?php endif ?>

                </a>
                <div class="in_stock<?= $data->in_stock ? ' active' : ''?>">
                    <?php if ($data->in_stock): ?>
                        В наличии
                    <?php else: ?>
                        Под заказ
                    <?php endif ?>
                </div>
                <div class="produkt-sku">
                    <?= $data->sku?>
                </div>
                <div class="product-title">
                    <?= $data->shortText($data->name,60)?>

                </div>
                <button
                 class="posrel but-add-cart<?= $data->getIsProductCart()>0 ? ' added' : ''?>" id="add-product-to-cart-<?= $data->id?>"
                 data-id="<?= $data->id; ?>"
                 data-url="<?= Yii::app()->createUrl('/cart/cart/add');?>"
                 >
                    <span>
                        <?= $data->getIsProductCart()>0 ? 'В корзине' : 'В корзине'?>
                    </span>
                </button>
            </div>
        </form>
    </div>
