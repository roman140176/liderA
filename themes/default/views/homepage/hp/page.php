<?php
/** @var Page $page */

if ($page->layout) {
    $this->layout = "//layouts/{$page->layout}";
}

$this->title = $page->title;
$this->breadcrumbs = [
    Yii::t('HomepageModule.homepage', 'Pages'),
    $page->title
];
$this->description = !empty($page->meta_description) ? $page->meta_description : Yii::app()->getModule('yupe')->siteDescription;
$this->keywords = !empty($page->meta_keywords) ? $page->meta_keywords : Yii::app()->getModule('yupe')->siteKeyWords;
$this->headerClass = true;
?>
<?php $this->widget('application.modules.gallery.widgets.NewGalleryWidget',['id'=>1]); ?>
<section class="container catalog-widget d-flex">
    <header class="catalog-header d-flex">
        <h1 class="page-title">Каталог продукции</h1>
        <a href="/store" class="link-catalog">
            <span>К покупкам</span>
            <svg width="14" height="12" viewBox="0 0 14 12" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M-2.74522e-07 5.25L10.6893 5.25L6.96967 1.53033L8.03033 0.469675L13.5607 6L8.03033 11.5303L6.96967 10.4697L10.6893 6.75L-2.08955e-07 6.75L-2.74522e-07 5.25Z" fill="white"/>
            </svg>
        </a>
    </header>
    <div class="home-catalog-items">
        <?php $this->widget('application.modules.store.widgets.CatalogWidget',[
        'view'=>'view',
        'limit' => 8
        ]); ?>
    </div>
    <div class="home-sales">
    <h2 class="page-title stock-widget-title">Акции</h2>
        <?php $this->widget('application.modules.stocks.widgets.StocksWidget',[
            'limit'=> 3,
            ]); ?>
    </div>
</section>
<?php $this->widget('application.modules.store.widgets.ProductTypeWidget',[
'condition'=>'populate>0',
'view' => 'populate',
'position' => 't.position DESC',
'limit' => 10
]); ?>
<section class="contact-form">
    <div class="container w1150">
        <h2 class="page-title">Контакты</h2>
    </div>
    <div class="contact-container container d-flex">
        <div class="contact__item">
            <div class="small-title">
                Московская область
            </div>
            <div class="address">
                <?= $this->yupe->address?>
            </div>
            <div class="contacts-btns d-flex">
                <a href="#" class="write-us js-button" data-bs-target="#CallbackFormEmail" data-bs-toggle="modal"><span>Написать нам</span></a>
                <a href="/kontakty" class="all-contacts"><span>Все контакты</span></a>
            </div>
        </div>
        <div class="contact__item w1150">
            <a href="<?= $this->yupe->getPhoneLink($this->yupe->main_phone)?>" class="small-title contacts__phone">
                <?= $this->yupe->main_phone?>
            </a>
            <div class="contacts__mode">
                <?= $this->yupe->wmode?>
            </div>
            <a href="mailTo:<?= $this->yupe->email?>" class="contacts__email db">
                <span><?= $this->yupe->email?></span>
            </a>
            <div class="contacts__mode">
                Всегда на связи
            </div>
            <div class="contacts__socials d-flex">
                <div class="contacts__socials--box d-flex">
                    <?= $this->yupe->SocialWidget()?>
                </div>
                <div class="contacts__mode">
                    Присоединяйтесь
                </div>
            </div>
        </div>
        <div class="contact__item">
            <?php $file = ContentBlock::model()->findByPk(1) ?>
            <div class="catalog-file d-flex">
                <div class="catalog-file-icon">
                  <svg width="35" height="45" viewBox="0 0 35 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M27.3333 43.4444H1V7.66663H19.8913L27.3333 15.1086V43.4444Z" stroke="#56B29D" stroke-width="2"/>
                    <path d="M7.55566 8.62639V1H26.5075H34.0001V8.62639V36.8889H26.5075" stroke="#56B29D" stroke-width="2"/>
                  </svg>
                </div>
                <a href="<?= $file->getFileUrl()?>" class="pdf-link" target="_blank">
                    <?= $file->name?>
                </a>
            </div>
            <div class="file-desc">
                <?= $file->description?>
            </div>
            <a href="/o-kompanii" class="about-company-link">
                <span>О компании</span>
            </a>
        </div>
    </div>
</section>
