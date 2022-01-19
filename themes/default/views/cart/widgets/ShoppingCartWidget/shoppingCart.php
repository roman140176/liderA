<?php
$currency = Yii::app()->getModule('store')->currency;
?>
<div class="but-cart js-cart d-flex" id="cart-widget" data-cart-widget-url="<?= Yii::app()->createUrl('/cart/cart/widget'); ?>">

        <a class="header-thumbs posrel <?= empty(Yii::app()->cart->isEmpty()) ? 'active' : 'empty'?>" href="<?= Yii::app()->createUrl('/cart/cart/index') ?>">

            <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M23.7534 21.3706C21.6907 21.3706 20.0127 23.0819 20.0127 25.1853C20.0127 27.2887 21.6908 29 23.7534 29C25.8159 29 27.494 27.2887 27.494 25.1853C27.494 23.0819 25.8159 21.3706 23.7534 21.3706ZM23.7534 26.7112C22.9282 26.7112 22.2571 26.0268 22.2571 25.1853C22.2571 24.3438 22.9282 23.6594 23.7534 23.6594C24.5786 23.6594 25.2496 24.3438 25.2496 25.1853C25.2496 26.0268 24.5786 26.7112 23.7534 26.7112Z" fill="#38434E"/>
            <path d="M29.7615 6.62706C29.5491 6.34974 29.2232 6.18798 28.878 6.18798H6.927L5.91701 1.87851C5.79619 1.36355 5.34466 1 4.82546 1H1.12219C0.502386 0.99994 0 1.51227 0 2.14435C0 2.77643 0.502386 3.28877 1.12219 3.28877H3.93969L7.58682 18.8513C7.70765 19.3667 8.15917 19.7299 8.67837 19.7299H26.1473C26.6632 19.7299 27.1128 19.3713 27.2366 18.8608L29.9673 7.60739C30.0499 7.26565 29.974 6.90438 29.7615 6.62706ZM25.2694 17.4411H9.56414L7.46337 8.47681H27.4441L25.2694 17.4411Z" fill="#38434E"/>
            <path d="M10.1746 21.3706C8.11196 21.3706 6.43394 23.0819 6.43394 25.1853C6.43394 27.2887 8.11202 29 10.1746 29C12.2372 29 13.9152 27.2887 13.9152 25.1853C13.9152 23.0819 12.2372 21.3706 10.1746 21.3706ZM10.1746 26.7112C9.34941 26.7112 8.67833 26.0268 8.67833 25.1853C8.67833 24.3438 9.34941 23.6594 10.1746 23.6594C10.9998 23.6594 11.6708 24.3438 11.6708 25.1853C11.6708 26.0268 10.9998 26.7112 10.1746 26.7112Z" fill="#38434E"/>
            </svg>
           <span class="cart-counter abs">
               <?= Yii::app()->cart->getItemsCount(); ?>
           </span>
           <div class="orders-title">
           Корзина
           </div>
        </a>

</div>

