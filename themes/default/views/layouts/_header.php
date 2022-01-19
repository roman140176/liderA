<header class="header">
    <div class="container container-top d-flex">
        <?php $this->widget('application.modules.menu.widgets.MenuWidget',[
            'name' => 'top-menu'
            ]); ?>
        <div class="box-info">
            <div class="box-mode">
                <?= $this->yupe->wmode?>
            </div>
            <a href="<?= $this->yupe->getPhoneLink($this->yupe->main_phone)?>" class="box-link phone-box">
                <?= $this->yupe->main_phone?>
            </a>
        </div>
        <div class="box-info net">
            <div class="box-mode">
                Всегда на связи
            </div>
            <a href="mailTo:<?= $this->yupe->email?>" class="box-link email-box">
                <?= $this->yupe->email ?>
            </a>
        </div>
        <div class="socials-top d-flex">
            <?= $this->yupe->SocialWidget()?>
        </div>

        <a href="#" class="top-callback js-button" data-bs-target="#CallbackFormEmail" data-bs-toggle="modal">
            <span>Связаться снами</span>
            <span class="mobile-span"></span>
        </a>
    </div>
</header>
<div class="header-main">
    <div class="container container-top d-flex">
        <a href="/" class="site-logo d-flex">
            <div class="logo-img">
                <?= $this->yupe->getSiteLogo('png') ?>
            </div>
            <div class="logo-name">
                <div class="logo-title text-uppercase">
                   лидер
                </div>
                <div class="logo-desc text-uppercase">
                    компания
                </div>
            </div>
        </a>
        <div class="catalog-button" data-url="/store">
            <div class="burger">
                <span></span>
            </div>
            <span class="span-catalog">Каталог</span>
        </div>
        <?php $this->widget('application.modules.store.widgets.SearchProductWidget'); ?>
        <a href="/store/account" class=" header-thumbs orders desktop">
            <svg width="24" height="28" viewBox="0 0 24 28" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 28L24 21.5333V6.46672L12 0L0 6.46672V21.5333L12 28ZM13 25.1892L22 20.3391V8.68047L13 13.5305V25.1892ZM12 11.7975L20.8381 7.0347L12 2.27192L3.16193 7.0347L12 11.7975ZM2 8.68047V20.3391L11 25.1892V13.5305L2 8.68047Z" fill="#38434E"/>
            </svg>
            <div class="orders-title">
                Заказы
            </div>
        </a>
        <a href="<?= Yii::app()->createUrl('/favorite/default/index'); ?>" class=" header-thumbs header-favorite posrel" id="descktop">
            <svg width="28" height="24" viewBox="0 0 28 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.2214 1.46311C12.355 1.56269 12.4861 1.6668 12.6145 1.77536C13.1182 2.20101 13.5816 2.69503 14 3.25243C14.4185 2.69505 14.8818 2.20104 15.3856 1.7754C15.514 1.66682 15.6452 1.5627 15.7788 1.46311C17.0817 0.492299 18.5619 0 20.1782 0C22.3405 0 24.3295 0.834151 25.779 2.34871C27.2113 3.84557 28 5.89051 28 8.10709C28 10.3885 27.1177 12.4769 25.2231 14.6792C23.5283 16.6496 21.0923 18.6497 18.2721 20.9653C17.3082 21.7564 16.2159 22.6534 15.0822 23.6085C14.7829 23.8609 14.3984 24 14 24C13.6014 24 13.2171 23.8609 12.9176 23.6081C11.7864 22.6552 10.6959 21.7598 9.73373 20.9698L9.72882 20.9657C6.90793 18.6497 4.47198 16.6497 2.7771 14.6795C0.882477 12.4769 0 10.3885 0 8.10709C0 5.89051 0.78891 3.84557 2.22125 2.34871C3.67068 0.834151 5.65952 0 7.82202 0C9.43829 0 10.9185 0.492299 12.2214 1.46311ZM24.334 3.73152C25.3836 4.82845 26 6.36609 26 8.10709C26 9.79079 25.377 11.4336 23.7069 13.3749C22.1499 15.1851 19.8699 17.0656 17.0029 19.4196C16.0978 20.1625 15.0706 21.0059 14.0001 21.9053C12.9349 21.0105 11.912 20.1705 11.0104 19.4303L11.0056 19.4263L10.9979 19.42C8.13061 17.0659 5.85036 15.1852 4.29333 13.3752C2.62319 11.4336 2 9.79066 2 8.10709C2 6.36623 2.61656 4.82847 3.66627 3.73144C4.7253 2.62486 6.18597 2 7.82202 2C9.00515 2 10.0668 2.35191 11.0264 3.06686C11.5204 3.43506 11.9825 3.89616 12.4005 4.45304L13.9997 6.58361L15.5993 4.45336C16.0178 3.89598 16.4799 3.43485 16.9738 3.06686C17.9334 2.35184 18.995 2 20.1782 2C21.8141 2 23.275 2.62496 24.334 3.73152Z" fill="#38434E"/>
            </svg>
            <span class="abs favorite__count<?= (Yii::app()->favorite->count() != null) ? ' active' : ''; ?>"
                id="yupe-store-favorite-total">
                <?= Yii::app()->favorite->count();?>
            </span>
            <div class="orders-title">
                Избранное
            </div>
        </a>
        <div id="shopping-cart-widget" class="shoppingCart-widget">
            <?php $this->widget('application.modules.cart.widgets.ShoppingCartWidget'); ?>
        </div>

        <?php $this->renderPartial('//layouts/_user'); ?>
        <div class="menu-toggler">
            <span></span>
        </div>
    </div>
</div>

<?php $this->widget('application.modules.store.widgets.CatalogWidget',[
'view' => 'catalog'
]); ?>