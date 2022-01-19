<?php $Assets = Yii::app()->getTheme()->getAssetsUrl();?>
<?php foreach ($model as $key => $data): ?>
        <a href="<?= $data->getUrl()?>" class="sale__item posrel" style="background: green;">
            <div class="sale__item-title">
                <?= $data->title?>
            </div>
            <div class="sale__item-desc">
                <?= $data->badge?>
            </div>
            <div class="sale__item--image abs">
                <img
                src="<?= $Assets. '/images/elements/iss.gif' ?>"
                data-src="<?= $data->getImageUrl(400,430,true)?>"
                alt="<?= $data->title?>"
                class="slide-image"
                >
                <div class="spinner-border text-success abs" role="status" id="spinner">
                   <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </a>
<?php endforeach ?>