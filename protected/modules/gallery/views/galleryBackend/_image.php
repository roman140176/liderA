<?php
$datas = '';
if ($gallery->names) {
  $datas = ' data-group="'.trim($data->image->name).'"';
}
if ($gallery->pic_name) {
    $datas = 'data-group="'.trim($data->image->name).'" data-alt="'.trim($data->image->alt).'"';
}
 ?>

<div class="image-wrapper"<?= $datas?>>
    <div class="gallery-thumbnail">
        <?php if (!$gallery->pic_name && !$gallery->names): ?>
            <div class="move-sign">
                <span class="fa fa-4x fa-arrows"></span>
            </div>
        <?php endif ?>
        <?php if ($gallery->preview_id == $data->image->id): ?>
            <div class="ribbon"><span><?= Yii::t('GalleryModule.gallery', 'Cover'); ?></span></div>
        <?php endif; ?>

        <?= CHtml::link(
            CHtml::image($data->image->getImageUrl(190, 190), $data->image->alt),
            $data->image->getImageUrl(),
            [
                'class' => 'gallery-image',
                'title' => $data->image->description,
                'rel' => $data->gallery->id
            ]
        ); ?>
        <div class="alt-box">
            <div class=""><strong><?= $data->image->name?></strong></div>
            <p><?= $data->image->alt?></p>
        </div>
    </div>
    <?php if ($data->image->canChange()): ?>
        <div class="btn-group btn-group-xs" role="group">
            <?= CHtml::link(
                '<i class="fa fa-fw fa-pencil"></i>',
                Yii::app()->createAbsoluteUrl('image/imageBackend/update', [
                    'id' => $data->image->id
                ]),
                [
                    'class' => 'btn btn-default',
                    'data-toggle' => 'tooltip',
                    'title' => Yii::t('GalleryModule.gallery', 'Edit'),
                ]
            ); ?>
            <?= CHtml::link(
                '<i class="fa fa-fw fa-thumb-tack"></i>',
                Yii::app()->createAbsoluteUrl('gallery/galleryBackend/setPreview', [
                    'galleryId' => $gallery->id,
                    'imageId' => $data->image->id,
                ]),
                [
                    'class' => 'btn ' . ($gallery->preview_id == $data->image->id ? 'btn-success' : 'btn-default'),
                    'data-toggle' => 'tooltip',
                    'title' => Yii::t('GalleryModule.gallery', 'Set as gallery preview'),
                ]
            ); ?>
            <?= CHtml::link(
                '<i class="fa fa-fw fa-times"></i>',
                Yii::app()->createAbsoluteUrl('gallery/galleryBackend/deleteImage', [
                    'id' => $data->image->id
                ]),
                [
                    'class' => 'btn btn-danger',
                    'data-toggle' => 'tooltip',
                    'title' => Yii::t('GalleryModule.gallery', 'Delete'),
                ]
            ); ?>
        </div>
    <?php endif; ?>
</div>