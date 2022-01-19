<?php
/**
* Отображение для services/index
*
* @category YupeView
* @package  yupe
* @author   Yupe Team <team@yupe.ru>
* @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
* @link     https://yupe.ru
**/
$this->pageTitle = Yii::t('ServicesModule.services', 'services');
$this->description = Yii::t('ServicesModule.services', 'services');
$this->keywords = Yii::t('ServicesModule.services', 'services');

$this->breadcrumbs = [Yii::t('ServicesModule.services', 'services')];
?>

<h1>
    <small>
        <?php echo Yii::t('ServicesModule.services', 'services'); ?>
    </small>
</h1>