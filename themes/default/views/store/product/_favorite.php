
    <div class="swiper-slide product-item-glide" data-item="product-<?= $data->id?>">
        <form action="<?= Yii::app()->createUrl('cart/cart/add'); ?>" method="post" data-max-value='<?= (int)$data->quantity ?>'>
            <input type="hidden" name="Product[id]" value="<?= $data->id; ?>"/>
            <?= CHtml::hiddenField(
                Yii::app()->getRequest()->csrfTokenName,
                Yii::app()->getRequest()->csrfToken
            ); ?>
            <div id="product-<?= $data->id?>"  class="product-item posrel" >
                <?php $images = $data->images;?>
                    <header class="card-head d-flex">
                       <?php if ($data->is_new): ?>
                        <div class="isnew">Новинка</div>
                        <?php endif ?>
                        <div class="favorite-box__delete favorite-delete" data-id="<?= $data->id;?>">
                             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" fill="#56b29d"/>
                            </svg>
                         </div>
                    </header>
                <a href="<?= ProductHelper::getUrl($data); ?>" class="image-wrap posrel">
                    <div class="touch-box<?= !empty($data->images) ? ' array-touch' : ''?>">
                        <?php $spans = []?>
                        <?php if (!empty($data->images)): ?>
                            <div class="array_image prod__img abs" id="box-0">
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
                            <?php foreach ($images as $key => $image) : ?>
                            <?php $key += 1;?>
                                <div class="array_image prod__img abs" id="box-<?= $key?>">
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
                                <?php $spans[] = $key?>
                            <?php endforeach ?>
                            <?php else:?>
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
                        <?php endif ?>
                        <?php if(!empty($data->images)):?>
                                <span class="psevdo abs" data-image="box-0"></span>
                            <?php foreach($spans as  $span): ?>
                                <span class="psevdo abs" data-image="box-<?= $span?>"></span>
                            <?php endforeach ?>
                                <div class="nan-img d-flex abs">
                                    <span data-active="box-0"></span>
                                    <?php foreach($spans as  $span): ?>
                                    <span data-active="box-<?= $span?>"></span>
                                    <?php endforeach ?>
                                </div>
                        <?php endif ;?>
                    </div>
                </a>
                <div class="in_stock<?= $data->in_stock ? ' active' : ''?>">
                    <?php if ($data->in_stock): ?>
                        В наличии
                    <?php else: ?>
                        Под заказ
                    <?php endif ?>
                </div>
                <div class="produkt-sku">
                    Арт. <?= $data->sku?>
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
                        <?= $data->getIsProductCart()>0 ? 'В корзине' : 'В корзину'?>
                    </span>
                </button>
            </div>
        </form>
    </div>
