<?php
/**
 * @var $dataProvider CArrayDataProvider
 */

$this->title = Yii::t("StoreModule.store", "Каталог продукции");
$this->breadcrumbs = [Yii::t("StoreModule.store", "Каталог продукции")];
?>
<?php $Assets = Yii::app()->getTheme()->getAssetsUrl();?>
<div class="container">
<?php $this->widget('application.components.MyTbBreadcrumbs', [
            'links' => $this->breadcrumbs,
        ]); ?>
</div>
<div class="container d-flex container-list w991">
    <div class="catalogpage-head">
         <h1 class="page-title" id="catalog-title">Каталог продукции</h1>
        <div class="contact__item">
            <?php $file = ContentBlock::model()->findByPk(1) ?>
            <div class="catalog-file d-flex">
                <a href="<?= $file->getFileUrl()?>" class="pdf-link" target="_blank">
                    Скачать каталог
                </a>
            </div>
        </div>
    </div>
    <div class="catalog-home grid-box" id="index-catalog">
        <?php foreach ($categories as $key => $data): ?>
            <div class="catalog-home__item catalogmain posrel">
                <a class="link-header db" href="<?= $data->getCategoryUrl()?>">
                    <?php $ex = explode('<br>', $data->title);$newEx=[];?>
                    <?php foreach ($ex as $i => $e): ?>
                        <?php $e =  ' <div><span>'.$e.'</span></div>'?>
                        <?php $newEx[] = $e ?>
                    <?php endforeach ?>

                    <?= implode($newEx)?>
                </a>
                <div class="catalog-home__img abs">
                    <img
                    src="<?= $Assets. '/images/elements/citem.gif' ?>"
                    data-src="<?= $data->getImageUrl(345,227,true)?>"
                    alt="<?= $data->name?>"
                    class="slide-image"
                    >
                    <div class="spinner-border text-success abs" role="status" id="spinner">
                     <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <?php if(!empty($data->children)):?>
                    <div class="catalogbox-children abs">
                        <div class="childbox-title">
                            <?= $data->title ? : $data->name?>
                        </div>
                        <div class="childbox-list">
                            <?php foreach($data->children(['order' => 'sort ASC']) as $key => $child): ?>
                                <a href="<?= $child->getCategoryUrl()?>" class="db childbox-link">
                                    <?= $child->title ? : $child->name?>
                                </a>
                            <?php endforeach ?>
                        </div>
                    </div>
                <?php endif ;?>
            </div>
        <?php endforeach ?>
    </div>
</div>
<section class="call-section-category">
    <div class="container cp-flex-container d-flex">
        <div class="page-title cp-title">
            Есть вопросы? <br>Задайте их нам
        </div>
        <div class="cp-flex-image">
            <img
            src="<?= $Assets. '/images/elements/mgz.gif' ?>"
            data-src="<?= $Assets. '/images/elements/mgz.jpg' ?>"
            alt="Контактная форма"
            >
            <div class="spinner-border text-success abs" role="status" id="spinner">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
        <div class="cp-flex-description">
            Заполните форму обратной связи
             <br>и наши специалисты свяжутся
             <br>с вами в ближайшее время
        </div>
        <a href="#" class="cp-dtn js-button" data-bs-target="#CallbackFormEmail" data-bs-toggle="modal"><span>Задать вопрос</span></a>
    </div>
</section>
