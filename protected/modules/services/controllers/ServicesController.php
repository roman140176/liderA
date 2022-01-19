<?php
/**
* ServicesController контроллер для services на публичной части сайта
*
* @author yupe team <team@yupe.ru>
* @link https://yupe.ru
* @copyright 2009-2020 amyLabs && Yupe! team
* @package yupe.modules.services.controllers
* @since 0.1
*
*/

class ServicesController extends \yupe\components\controllers\FrontController
{
    /**
     * Действие "по умолчанию"
     *
     * @return void
     */
    public function actionIndex()
    {
        $this->render('index');
    }

    public function actionView($slug)
    {
        $model = Services::model()->find(
            'slug = :slug',
            [
                ':slug' => $slug,
            ]
        );

        if (null === $model) {
            throw new CHttpException(404, Yii::t('ServicesModule.services', 'Page was not found'));
        }

        $this->render('view', [
            'model' => $model,
        ]);
    }
}