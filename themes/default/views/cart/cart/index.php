<?php
/* @var $this CartController */
/* @var $positions Product[] */
/* @var $order Order */
/* @var $coupons Coupon[] */

$mainAssets = Yii::app()->getTheme()->getAssetsUrl();
$this->title = Yii::t('CartModule.cart', 'Cart');
$this->breadcrumbs = [
    Yii::t("CartModule.cart", 'Cart')
];

?>

<script type="text/javascript">
    var yupeCartDeleteProductUrl = '<?= Yii::app()->createUrl('/cart/cart/delete/')?>';
    var yupeCartUpdateUrl = '<?= Yii::app()->createUrl('/cart/cart/update/')?>';
    var yupeCartWidgetUrl = '<?= Yii::app()->createUrl('/cart/cart/widget/')?>';
    var yupeCartEmptyMessage = '<h1><?= Yii::t("CartModule.cart", "Cart is empty"); ?></h1><?= Yii::t("CartModule.cart", "There are no products in cart"); ?>';
</script>

<div class="cart-content w991">
    <div class="container">
        <?php $this->widget('application.components.MyTbBreadcrumbs', [
            'links' => $this->breadcrumbs,
        ]); ?>
        <div class="main__title">
        <h1 class="page-title cart-title"><?= Yii::t("CartModule.cart", "Cart"); ?></h1>
        </div>
        <?php if (Yii::app()->cart->isEmpty()): ?>
            <?= Yii::t("CartModule.cart", "There are no products in cart"); ?>
        <?php else: ?>

            <?php $form = $this->beginWidget(
                'bootstrap.widgets.TbActiveForm',
                [
                    'action' => ['/order/order/create'],
                    'id' => 'order-form',
                    'enableAjaxValidation' => false,
                    'enableClientValidation' => false,
                    'htmlOptions' => [
                        'hideErrorMessage' => false,
                        'class' => 'order-form',
                    ]
                ]
            );
            ?>
            <div class="cart-block">
                <div class="order-box js-cart">
                    <div class="order-box__header order-box__header_black">
                        <div class="cart-list-header">
                            <div class="cart-list__column cart-list__column_info">Товар</div>
                            <div class="cart-list__column cart-list__column_quantity"><?= Yii::t("CartModule.cart", "Amount"); ?></div>
                            <div class="cart-list__column cart-list__column_remove">Удалить</div>
                        </div>
                    </div>


                    <div class="cart-list">
                        <?php foreach ($positions as $position): ?>
                            <div class="cart-list__item">
                                <?php $positionId = $position->getId(); ?>
                                <?php $productUrl = ProductHelper::getUrl($position->getProductModel()); ?>
                                <?= CHtml::hiddenField('OrderProduct['.$positionId.'][product_id]', $position->id); ?>
                                <input type="hidden" class="position-id" value="<?= $positionId; ?>"/>
                                <input type="hidden" class="position-quantity" value="<?= $position->getQuantity(); ?>"/>
                                <div class="cart-item d-flex js-cart__item">
                                    <div class="cart-item__info d-flex" data-text='Товар'>
                                        <div class="cart-item__thumbnail">
                                            <img src="<?= $position->getProductModel()->getImageUrl(90, 90, false); ?>"
                                                 class="cart-item__img"/>
                                        </div>
                                         <div class="cart-item__content grid-module-4">
                                            <?php if ($position->getProductModel()->getCategoryId()): ?>
                                                <div class="cart-item__category"><?= $position->getProductModel(
                                                    )->category->name ?></div>
                                            <?php endif; ?>
                                            <div class="cart-item__title">
                                                <a href="<?= $productUrl; ?>" class="cart-item__link"><?= CHtml::encode(
                                                        $position->name
                                                    ); ?></a>
                                            </div>
                                            <?php foreach ($position->selectedVariants as $variant): ?>
                                                <h6><?= $variant->attribute->title; ?>: <?= explode('/',$variant->getOptionValue())[0] ?></h6>
                                                <?= CHtml::hiddenField('OrderProduct[' . $positionId . '][variant_ids][]', $variant->id); ?>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                    <div class="cart-item__quantity" data-text='<?= Yii::t("CartModule.cart", "Amount"); ?>'>

                                            <span data-min-value='1' data-max-value='99' class="spinput d-flex js-spinput cart_spinput">
                                                <span class="spinput__minus js-spinput__minus cart-quantity-decrease"
                                                      data-target="#cart_<?= $positionId; ?>">
                                                          <?= file_get_contents('.'. Yii::app()->getTheme()->getAssetsUrl() . '/images/svg/minus.svg'); ?>
                                                      </span>
                                                <?= CHtml::textField(
                                                    'OrderProduct['.$positionId.'][quantity]',
                                                    $position->getQuantity(),
                                                    ['id' => 'cart_'.$positionId, 'class' => 'spinput__value position-count']
                                                ); ?>
                                                <span class="spinput__plus js-spinput__plus cart-quantity-increase"
                                                      data-target="#cart_<?= $positionId; ?>">
                                                          <?= file_get_contents('.'. Yii::app()->getTheme()->getAssetsUrl() . '/images/svg/plus.svg'); ?>
                                                      </span>
                                            </span>

                                    </div>
                                    <div class="cart-item__summ" data-text='Удалить'>

                                            <a class="js-cart__delete cart-delete-product"
                                               data-position="<?= $positionId; ?>">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" fill="#56b29d"/>
                                                </svg>
                                            </a>

                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php if (!empty($deliveryTypes)): ?>
                    <div class="order-box-wrapp d-flex">
                        <div class="order-box">
                            <h3 class="order-title"><?= Yii::t(
                                    "CartModule.cart",
                                    "Delivery method"
                                ); ?></h3>
                            <div class="order-box__body">
                                <div class="order-box-delivery">
                                    <div class="order-box-delivery__type">
                                        <?php foreach ($deliveryTypes as $key => $delivery): ?>
                                            <div class="rich-radio payment-method__list">
                                                <input type="radio" name="Order[delivery_id]"
                                                       id="delivery-<?= $delivery->id; ?>"
                                                       class="rich-radio__input"
                                                       value="<?= $delivery->id; ?>"
                                                       data-price="<?= $delivery->price; ?>"
                                                       data-free-from="<?= $delivery->free_from; ?>"
                                                       data-available-from="<?= $delivery->available_from; ?>"
                                                       data-separate-payment="<?= $delivery->separate_payment; ?>"
                                                       <?= $key===0 ? 'checked' : ''?>
                                                       >
                                                <label for="delivery-<?= $delivery->id; ?>" class="rich-radio__label">
                                                    <?= $delivery->name; ?>
                                                </label>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>

                                </div>
                            </div>
                        </div>
                            <div class="order-box">
                                <h3 class="order-title">Выберите способ оплаты</h3>
                                <?php $payment = Payment::model()->findAll(); ?>
                                <?php if ($payment) : ?>
                                    <div class="payment-method">
                                        <ul class="payment-method__lists list-none" id="payment-methods">
                                            <?php foreach ($payment as $k => $payment) : ?>
                                                <li class="payment-method__list">
                                                    <input class="payment-method-radio"
                                                           type="radio"
                                                           name="Order[payment_method_id]"
                                                           value="<?= $payment->id; ?>"
                                                           <?= $k===0 ? 'checked' : ''?>
                                                           id="payment-<?= $payment->id; ?>">
                                                    <label for="payment-<?= $payment->id; ?>">
                                                        <?php if ($payment->id == 3): ?>
                                                            <div><?= CHtml::encode($payment->name); ?></div>
                                                            <small style="list-style: 1;opacity: .5;">на ваш email будет отправлен счёт на оплату</small>
                                                        <?php else: ?>
                                                            <?= CHtml::encode($payment->name); ?>
                                                        <?php endif ?>
                                                    </label>
                                                </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                            </div>
                        </div>
                                <?php endif; ?>
                        <div class="order-box-delivery__address">
                                        <h3 class="client-head order-title">Заполните форму для оформления заказа</h3>

                                        <div class="order-form__body">
                                            <div class="order-form__inputs">
                                               <div class="form-group">
                                                    <label for="Order_name" class="required">
                                                        <?= $order->getAttributeLabel('name')?>
                                                        <span>*</span>
                                                    </label>
                                                    <input type="text"
                                                    id="Order_name"
                                                    autocomplete="off"
                                                    name="Order[name]"
                                                    class="form_field form-control"
                                                    placeholder="Клиент"
                                                    data-name="Клиент">
                                                    <div class="status"></div>
                                                 </div>
                                                <div class="form-group">
                                                    <label class="control-label required" for="Order_phone">
                                                        <?= $order->getAttributeLabel('phone')?>
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input class="form_field tel form-control"
                                                    id="Order_phone"
                                                    placeholder="+7 (xxx) xxx xxxx"
                                                    autocomplete="off"
                                                    name="Order[phone]"
                                                    type="tel"
                                                    data-name="Телефон">
                                                    <div class="status"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="Order_email">
                                                        <?= $order->getAttributeLabel('email')?>
                                                        <span></span>
                                                    </label>
                                                    <input type="text"
                                                    id="Order_email"
                                                    autocomplete="off"
                                                    name="Order[email]"
                                                    class="form_field form-control"
                                                    placeholder="Email"
                                                    data-name="Email">
                                                    <div class="status"></div>
                                                </div>
                                                <div class="form-group" id="field-strit">
                                                    <label class="control-label" for="Order_street">
                                                    Адрес доставки
                                                    </label>
                                                    <input class="form_field form-control"
                                                    placeholder="Адрес доставки"
                                                    name="Order[street]"
                                                    type="text"
                                                    data-name="Адрес доставки"
                                                    maxlength="255">
                                                    <div class="status"></div>
                                                </div>
                                            </div>
                                            <div class="order-form__comment">
                                                <?= $form->textAreaGroup($order, 'comment'); ?>
                                            </div>
                                        </div>
                                    </div>
                    <?php else: ?>
                        <div class="alert alert-danger">
                            <?= Yii::t("CartModule.cart", "Delivery method aren't selected! The ordering is impossible!") ?>
                        </div>
                    <?php endif; ?>
                        <div class="cart-box__order-button d-flex">
                            <div class="agreement d-flex">
                                <input type="checkbox" id="check-agreement" checked>
                                <label for="check-agreement">
                                </label>
                                <div class="agreement-text">
                                Я прочитал <a href="/usloviya-soglasheniya" target="_blank"> "Условия
                                соглашения" </a> и согласен с условиями
                                </div>
                            </div>
                            <button type="submit" class="but but-order-submit"><span>Оформить заказ</span></button>
                        </div>
                </div>
            </div>
            <?php $this->endWidget(); ?>
        <?php endif; ?>
    </div>
</div>

