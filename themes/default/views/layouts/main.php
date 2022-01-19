<!DOCTYPE html>
<html lang="<?= Yii::app()->language; ?>">
<head>
    <?php \yupe\components\TemplateEvent::fire(DefautThemeEvents::HEAD_START);?>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Language" content="ru-RU" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $this->title;?></title>
    <meta name="description" content="<?= $this->description;?>" />
    <meta name="keywords" content="<?= $this->keywords;?>" />
    <meta name="robots" content="noindex,nofollow" />
    <?php if ($this->canonical) : ?>
        <link rel="canonical" href="<?= $this->canonical ?>" />
    <?php endif; ?>

    <?php

    Yii::app()->getClientScript()->registerCssFile($this->mainAssets . '/build/bootstrap.css');
    Yii::app()->getClientScript()->registerCssFile($this->mainAssets . '/build/app.css');
    Yii::app()->getClientScript()->registerScriptFile($this->mainAssets . '/build/dependencies.js',CClientScript::POS_END);
    Yii::app()->getClientScript()->registerScriptFile($this->mainAssets . '/build/bootstrap.js',CClientScript::POS_END);
    Yii::app()->getClientScript()->registerScriptFile($this->mainAssets . '/build/components.js',CClientScript::POS_END);
    Yii::app()->getClientScript()->registerScriptFile($this->mainAssets . '/build/app.js',CClientScript::POS_END);

    ?>
    <script type="text/javascript">
        var yupeTokenName = '<?= Yii::app()->getRequest()->csrfTokenName;?>';
        var yupeToken = '<?= Yii::app()->getRequest()->getCsrfToken();?>';
    </script>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- <link rel="stylesheet" href="http://yandex.st/highlightjs/8.2/styles/github.min.css">
    <script src="http://yastatic.net/highlightjs/8.2/highlight.min.js"></script> -->
    <?php \yupe\components\TemplateEvent::fire(DefautThemeEvents::HEAD_END);?>
</head>

<body>

<?php \yupe\components\TemplateEvent::fire(DefautThemeEvents::BODY_START);?>

<div class='wrapper' id="wrapper">
    <?php $this->renderPartial('//layouts/_header'); ?>

    <!-- flashMessages -->
    <?php //$this->widget('yupe\widgets\YFlashMessages'); ?>

    <div class="content">
        <?= $this->decodeWidgets($content); ?>
    </div>
    <!-- footer -->
    <?php $this->renderPartial('//layouts/_footer'); ?>
    <!-- footer end -->
</div>
<?php $this->widget('application.modules.mail.widgets.CallbackFormEmailWidget');?>
<?php \yupe\components\TemplateEvent::fire(DefautThemeEvents::BODY_END);?>
<!-- Уведомление -->
<div id="messmodal" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

            </div>
            <div class="modal-body">
                <div class="success-title">
                    Спасибо! <br>
                    Ваша заявка успешно отправлена.
                </div>
            </div>
        </div>
    </div>
</div>
<div id="searchProductModal" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div>
    </div>
</div>
<?php $this->renderPartial('//layouts/_panel'); ?>
<div class="fix-mobile-menu"></div>
<div class="fix-mobile-filters"></div>
<script>
function CaptchaCallback() {
        document.querySelectorAll(('.g-recaptcha')).forEach(el => {
                let widgetId = grecaptcha.render(el, { 'sitekey': el.dataset.sitekey });
                el.setAttribute('data-widget-id',widgetId)
        })
    }
    function recaptcha_callback(){
      document.querySelectorAll('.capcha-error').forEach((i)=>{
        i.textContent = ''
      })
    }
</script>
</body>
</html>
