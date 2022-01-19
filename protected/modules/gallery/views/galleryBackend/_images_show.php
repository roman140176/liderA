<?php
/**
 * Отображение для Default/_show_images:
 *
 * @category YupeView
 * @package  yupe
 * @author   Yupe Team <team@yupe.ru>
 * @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
 * @link     https://yupe.ru
 **/
$mainAssets = Yii::app()->assetManager->publish(Yii::getPathOfAlias('gallery.views.assets'));
Yii::app()->getClientScript()->registerCssFile($mainAssets . '/css/gallery.css');
Yii::app()->getClientScript()->registerScriptFile($mainAssets . '/js/gallery-sortable.js', CClientScript::POS_END);

$this->widget('gallery.extensions.colorbox.ColorBox', [
    'target' => '.gallery-image',
    'config' => [ // тут конфиги плагина, подробнее http://www.jacklmoore.com/colorbox
    ],
]);
$keys = [];
?>


<div id="gallery-wrapper">
    <div class="row gallery-thumbnails thumbnails<?= (!$model->names && !$model->pic_name) ? ' sort-imgs': ''?>">
        <?php
            foreach($dataProvider as $data) {
                $keys[] = sprintf('<span data-order="%d">%d</span>', $data->position, $data->id);
                $this->renderPartial('_image', [
                    'gallery' => $model,
                    'data' => $data,
                ]);
            }
        ?>
    </div>
</div>

<div class="sortOrder hidden"
    data-token-name="<?= Yii::app()->getRequest()->csrfTokenName; ?>"
    data-token="<?= Yii::app()->getRequest()->getCsrfToken(); ?>"
    data-action="<?= Yii::app()->createUrl('/gallery/galleryBackend/sortable') ?>"
    >
    <?= implode('', $keys) ?>
</div>
<?php if ($model->names && !$model->pic_name): ?>
    <script>
    var groups = [];
    var alts = [];
    $('.image-wrapper').each(function(){
        var group = $(this).data('group')
        var alt = $(this).data('alt')
        groups.push(group);
        alts.push(alt);
    })
    groups = groups.filter(function(i,e,groups){
        return groups.indexOf(i) === e
    })

    for(i=0;i<groups.length;i++){
    var div = $('<div>',{
        class:'group-wrapper grop' + groups[i]
    })
    $('[data-group="'+groups[i]+'"]').wrapAll(div)
}

$('.group-wrapper').each(function(i,e){
    $(this).prepend('<div class="groupTitle"> <span>Группа - '+groups[i]+'</span></div>');
})

    </script>
<?php endif ?>
<?php if (!$model->names && $model->pic_name): ?>
<script>
    var groups = [];
    var alts = [];
    $('.image-wrapper').each(function(){
        var group = $(this).data('group')
        var alt = $(this).data('alt')
        groups.push(group);
        alts.push(alt);
    })
    groups = groups.filter(function(i,e,groups){
        return groups.indexOf(i) === e
    })
    alts = alts.filter(function(i,e,alts){
        return alts.indexOf(i) === e
    })

    for(i=0;i<groups.length;i++){
    var div = $('<div>',{
        class:'group-wrapper grop' + groups[i]
    })
    $('[data-group="'+groups[i]+'"]').wrapAll(div)
}

$('.group-wrapper').each(function(i,e){
    $(this).prepend('<div class="groupTitle"> <span>Группа - '+groups[i]+'</span></div>')
     for(i=0;i<alts.length;i++){
            var div = $('<div>',{
                class:'alt-wrapper grop-' + alts[i],
                rel:alts[i]
            })
           $(this).find('[data-alt="'+alts[i]+'"]').wrapAll(div)
        }
})
$('.alt-wrapper').each(function(i,e){
    $(this).prepend('<div class="altTitle"> <span>подгруппа - '+$(this).attr('rel')+'</span></div>')
})

</script>

<?php endif ?>
<style>
    .group-wrapper{
        overflow: hidden;
        border: 1px solid #000;
        width: calc(100% - 30px);
        margin-left: 15px;
        margin-bottom: 15px;
    }
    .groupTitle{
        padding: 15px;
        display: flex;
        display: flex;
        justify-content: center;
        background: #5BC0DE;
        margin-bottom: 10px;
        color:#fff;
        font-weight: 600;
    }
    .alt-wrapper{
        overflow: hidden;
        /*padding: 10px;*/
        background: #f8f8f8;
        margin-bottom: 20px;
        margin-right: 10px;
        margin-left: 10px;
        border: 1px solid #5BC0DE;
    }
    .alt-wrapper::last-child,.group-wrapper::last-child{
        margin-bottom: 0;
    }
    .altTitle{
        padding: 10px 10px 10px 30px;
        font-weight: 600;
    }
</style>