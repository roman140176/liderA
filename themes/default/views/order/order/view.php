<?php
/* @var $model Order */
$mainAssets = Yii::app()->getTheme()->getAssetsUrl();
// Yii::app()->getClientScript()->registerCssFile($mainAssets . '/css/order-frontend.css');

$this->title = Yii::t('OrderModule.order', 'Order #{n}', [$model->id]);
?>
<?php $array = Yii::app()->user->getFlashes(); ?>
            <?php if(!empty($array)) : ?>
                <script>
                document.addEventListener('DOMContentLoaded',()=>{
                    setTimeout(() => {
                    document.querySelector('.orb').click()
                    }, 1000);
                    setTimeout(() => {
                    document.getElementById('ordersuccessModal').style.display='none'
                    document.querySelector('.modal-backdrop').style.display='none'
                    document.body.classList.remove('modal-open')
                    document.body.removeAttribute('style')
                    }, 5000);
                })
                </script>
            <?php endif; ?>
<div class="pay-content pay">

    <div class="container">
        <?php $this->widget('application.components.MyTbBreadcrumbs', [
                'links' => $this->breadcrumbs,
        ]); ?>
        <!-- = Yii::app()->user->getFlash('callback-success') -->
        <div class="">
            <h1 class="title"><?= Yii::t("OrderModule.order", "Order #"); ?><?= $model->id; ?>
                <small>[<?= CHtml::encode($model->getStatusTitle()); ?>]</small>
            </h1>

            <div class="orser-status-massege">
                Копия заказа выслана на указанный вами e-mail. <br>
                В ближайшее время наши менеджеры свяжутся с вами для уточнения деталей
                заказа.
            </div>
            <div class="pay-details">
                <div class="pay-details__items">
                    <div class="pay-details__left">
                        <?= CHtml::activeLabel($model, 'date'); ?>
                    </div>
                    <div class="pay-details__right">
                        <?= $model->date; ?>
                    </div>
                </div>
                <div class="pay-details__items">
                    <div class="pay-details__left">
                        <?= CHtml::activeLabel($model, 'delivery_id'); ?>
                    </div>
                    <div class="pay-details__right">
                        <?php if (!empty($model->delivery)) : ?>
                            <?= CHtml::encode($model->delivery->name); ?>
                            <?php if ($model->delivery->id == 2): ?>
                                <div class="payment__description small">
                                       Оплачивается индивидуально
                                    </div>
                            <?php endif ?>
                        <?php endif; ?>
                    </div>
                </div>
                     <?php if ($model->isPaymentMethodSelected()) : ?>
                        <div class="pay-details__items">
                            <div class="pay-details__left">
                                <?= CHtml::activeLabel($model, 'payment_method_id'); ?>
                            </div>
                            <div class="pay-details__right">
                                <?= CHtml::encode($model->payment->name) ?>
                                <?php if ($model->payment_method_id == 2): ?>
                                    <div class="payment__description small">
                                        Прием платежей в офисе ООО «ЛИДЕР А» по адресу:<br>
                                        Москва, ул. Киевская д. 19, 2 этаж, ком. 34
                                    </div>
                                <?php endif ?>
                            </div>
                        </div>
                    <?php endif; ?>
                <div class="pay-details__items">
                    <div class="pay-details__left">
                        <?= CHtml::activeLabel($model, 'name'); ?>
                    </div>
                    <div class="pay-details__right">
                        <?= CHtml::encode($model->name); ?>
                    </div>
                </div>
                <div class="pay-details__items">
                    <div class="pay-details__left">
                        <?= CHtml::activeLabel($model, 'phone'); ?>
                    </div>
                    <div class="pay-details__right">
                        <?= CHtml::encode($model->phone); ?>
                    </div>
                </div>
                <div class="pay-details__items">
                    <div class="pay-details__left">
                        <?= CHtml::activeLabel($model, 'email'); ?>
                    </div>
                    <div class="pay-details__right">
                        <?= CHtml::encode($model->email); ?>
                    </div>
                </div>
                <?php if ($model->house) : ?>
                    <div class="pay-details__items">
                        <div class="pay-details__left">
                            <label><?= Yii::t("OrderModule.order", "Address"); ?></label>
                        </div>
                        <div class="pay-details__right">
                            <?php //= CHtml::encode($model->getAddress()); ?>
                            <?= $model->house; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
            <div class="pay-box">
                <div class="pay-box__header">
                    <?= Yii::t("OrderModule.order", "Order details"); ?>
                </div>
                <?php foreach ((array)$model->products as $key => $position) : ?>
                    <div class="pay-box__items">
                        <div class="pay-box__name">
                            <div class="media">
                                <?php $productUrl = ProductHelper::getUrl($position->product); ?>
                                <a class="img-thumbnail pull-left" href="<?= $productUrl; ?>">
                                    <img class="media-object" src="<?= $position->product->getImageUrl(90, 90,true); ?>">
                                </a>
                                <div class="media-body">
                                    <div class="media-heading">
                                        <a href="<?= $productUrl; ?>" class="db"><?= CHtml::encode($position->product->name); ?></a>
                                        <small>кол-во: <?= $position->quantity?> шт.</small>
                                    </div>
                                    <?php foreach ($position->variantsArray as $variant) : ?>
                                        <h6><strong><?= $variant['attribute_title']; ?>:</strong> <?= explode('/',$variant['optionValue'])[0]; ?></h6>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                        <div class="pay-box__price">
                            <strong>
                                <span class=""><?= $position->price; ?></span>
                                <?= Yii::t("OrderModule.order", Yii::app()->getModule('store')->currency); ?>
                                ×
                                <?= $position->quantity; ?> <?= Yii::t("OrderModule.order", "PCs"); ?>
                            </strong>
                        </div>
                        <div class="pay-box__totalPrice">
                            <strong>
                                <span><?= $position->getTotalPrice(); ?></span> <?= Yii::t("OrderModule.order", Yii::app()->getModule('store')->currency); ?>
                            </strong>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="pay-bottom">
                <div class="pay-bottom__items">
                    <div class="pay-bottom__left">
                        <label><?= Yii::t("OrderModule.order", "Total"); ?> :</label>
                    </div>
                    <div class="pay-bottom__right">
                        <?= $model->getTotalPrice(); ?><span class="ruble"> <?= Yii::t("OrderModule.order", Yii::app()->getModule('store')->currency); ?></span>
                    </div>
                </div>
                <div class="pay-bottom__items">
                    <div class="pay-bottom__left">
                        <?= CHtml::activeLabel($model, 'delivery_id'); ?>
                    </div>
                    <div class="pay-bottom__right">
                        <?= CHtml::encode($model->delivery->name); ?>
                    </div>
                </div>
                <?php if ($model->isPaymentMethodSelected()) : ?>
                    <div class="pay-bottom__items">
                        <div class="pay-bottom__left">
                            <?= CHtml::activeLabel($model, 'payment_method_id'); ?>
                        </div>
                        <div class="pay-bottom__right">
                            <?= CHtml::encode($model->payment->name) ?>
                            <?php if ($model->payment_method_id == 2): ?>
                                    <div class="payment__description__res small">
                                        Прием платежей в офисе ООО «СТРОМ ТРЕЙД» по адресу:
                                        Москва, ул. Киевская д. 19, 2 этаж, ком. 34
                                    </div>
                            <?php endif ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<div id="ordersuccessModal" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header box-style">
                <div data-dismiss="modal" class="modal-close"><div></div></div>

                    <div class="modal-body">
                        <div class="osm__massege d-flex">
                        <div class="osm__img">
                            <?= CHtml::image($this->mainAssets . '/images/logo.png') ?>
                        </div>
                        <span>Ваш заказ успешно размещён!</span>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
<a href="#" class="hidden orb" data-bs-target="#ordersuccessModal" data-bs-toggle="modal"></a>