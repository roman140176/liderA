<?php
$currency = Yii::t('StoreModule.store', Yii::app()->getModule('store')->currency);
?>
<html>
<head>
</head>
<body>
<h1 style="font-weight:normal;">
    Ваш заказ на сайте ЛИДЕР А
</h1>

<table cellpadding="6" cellspacing="0" style="border-collapse: collapse;">

    <?php foreach ($order->products as $orderProduct): ?>
        <?php $productUrl = ProductHelper::getUrl($orderProduct->product, true) ?>
        <tr>
            <td align="center"
                style="padding:6px; width:100px; padding:6px; background-color:#ffffff; border:1px solid #e0e0e0;">
                <?php if ($orderProduct->product): ?>
                    <a href="<?= $productUrl; ?>">
                        <?php if ($orderProduct->product->image): ?>
                            <img border="0" src="<?= $orderProduct->product->getImageUrl(
                                50,
                                50
                            ); ?>">
                        <?php endif; ?>
                    </a>
                <?php else: ?>
                    <?= CHtml::encode($orderProduct->product_name); ?>
                <?php endif; ?>
            </td>
            <td style="padding:6px; width:250px; padding:6px; background-color:#f0f0f0; border:1px solid #e0e0e0;">
                <a href="<?= $productUrl; ?>"><?= $orderProduct->product_name; ?></a>
                <?php foreach ($orderProduct->variantsArray as $variant): ?>
                    <h5><?= $variant['attribute_title']; ?>: <?= $variant['optionValue']; ?></h5>
                <?php endforeach; ?>
            </td>
            <td align=right
                style="padding:6px; text-align:right; width:150px; background-color:#ffffff; border:1px solid #e0e0e0;">
                <?= $orderProduct->quantity; ?> шт.
            </td>
        </tr>
    <?php endforeach; ?>


    <?php if ($order->hasCoupons()): ?>
        <tr>
            <td style="padding:6px; width:100px; padding:6px; background-color:#ffffff; border:1px solid #e0e0e0;"></td>
            <td style="padding:6px; background-color:#f0f0f0; border:1px solid #e0e0e0;">
                Купон <?= CHtml::encode(implode(', ', $order->getCouponsCodes())); ?>
            </td>
            <td align=right
                style="padding:6px; text-align:right; width:170px; background-color:#ffffff; border:1px solid #e0e0e0;">
                &minus;<?= $order->coupon_discount; ?>&nbsp;<?= $currency ?>
            </td>
        </tr>
    <?php endif; ?>

    <?php if ($order->delivery && !$order->separate_delivery): ?>
        <tr>
            <td style="padding:6px; width:100px; padding:6px; background-color:#ffffff; border:1px solid #e0e0e0;"></td>
            <td style="padding:6px; background-color:#f0f0f0; border:1px solid #e0e0e0;">
                <?= CHtml::encode($order->delivery->name); ?>
            </td>
            <td align="right" style="padding:6px; width:100px; padding:6px; background-color:#ffffff; border:1px solid #e0e0e0;">

            </td>
        </tr>
    <?php endif; ?>

</table>

<br/>
Вы всегда можете проверить состояние заказа по ссылке:<br>
<?= CHtml::link(
    Yii::app()->createAbsoluteUrl('/order/order/view', ['url' => $order->url]),
    Yii::app()->createAbsoluteUrl('/order/order/view', ['url' => $order->url])
); ?>
<br/>

</body>
</html>
