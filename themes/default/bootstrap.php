<?php
/**
 * Theme bootstrap file.
 */
Yii::app()->clientScript->coreScriptPosition =  CClientScript::POS_END;

Yii::app()->getComponent('bootstrap');

Yii::app()->getClientScript()->registerScript('baseUrl', "var baseUrl = '" . Yii::app()->getBaseUrl(true) . "';", CClientScript::POS_END);

// Favicon
Yii::app()->getClientScript()->registerLinkTag('shortcut icon', null, Yii::app()->getTheme()->getAssetsUrl() . '/images/favicon.ico');


Yii::import('themes.'.Yii::app()->theme->name.'.DefautThemeEvents');
Yii::app()->clientScript->scriptMap = [
        'jquery.js' => false,
        'jquery.yiilistview.js' => false,
        'jquery.ba-bbq.js' => false,
        'jquery.ui.js' => false,
        'bootstrap.min.js' => false,
        'bootstrap-noconflict.js' => false,
        'jquery.yiiactiveform.js' => false,
    ];