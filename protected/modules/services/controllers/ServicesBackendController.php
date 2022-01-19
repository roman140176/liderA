<?php
/**
* Класс ServicesBackendController:
*
*   @category Yupe\yupe\components\controllers\BackController
*   @package  yupe
*   @author   Yupe Team <team@yupe.ru>
*   @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
*   @link     https://yupe.ru
**/
Yii::import('application.modules.menu.models.*');
class ServicesBackendController extends \yupe\components\controllers\BackController
{
    /**
     * @return array
     */
    public function accessRules()
    {
        return [
            ['allow', 'roles' => ['admin']],
            ['allow', 'actions' => ['index'], 'roles' => ['Service.ServiceBackend.Index']],
            ['allow', 'actions' => ['view'], 'roles' => ['Service.ServiceBackend.View']],
            ['allow', 'actions' => ['create'], 'roles' => ['Service.ServiceBackend.Create']],
            [
                'allow',
                'actions' => ['update', 'inline', 'sortable', 'deleteImage', 'sortablephoto'],
                'roles' => ['Service.ServiceBackend.Update'],
            ],
            ['allow', 'actions' => ['delete', 'multiaction'], 'roles' => ['Service.ServiceBackend.Delete']],
            ['deny'],
        ];
    }

    public function actions()
    {
        return [
            'inline' => [
                'class'           => 'yupe\components\actions\YInLineEditAction',
                'model'           => 'Services',
                'validAttributes' => [
                    'status', 'name'
                ]
            ],
            'sortable' => [
                'class' => 'yupe\components\actions\SortAction',
                'model' => 'Services',
            ]
        ];
    }
    /**
    * Отображает Услугу по указанному идентификатору
    *
    * @param integer $id Идинтификатор Услугу для отображения
    *
    * @return void
    */
    public function actionView($id)
    {
        $this->render('view', ['model' => $this->loadModel($id)]);
    }

    /**
    * Создает новую модель Услуги.
    * Если создание прошло успешно - перенаправляет на просмотр.
    *
    * @return void
    */
    public function actionCreate()
    {
        $model = new Services;
        $menuId = null;
        $menuParentId = 0;

        if (Yii::app()->getRequest()->getPost('Services') !== null) {
            $model->setAttributes(Yii::app()->getRequest()->getPost('Services'));

            if ($model->save()) {
                if (Yii::app()->hasModule('menu')) {
                        $menuId = (int)Yii::app()->getRequest()->getPost('menu_id');
                        $parentId = (int)Yii::app()->getRequest()->getPost('parent_id');
                        $menu = Menu::model()->findByPk($menuId);
                        if (null !== $menu) {
                            if (!$menu->addItem(
                                $model->name,
                                Yii::app()->createUrl('/services/services/view', ['slug' => $model->slug]),
                                $parentId,
                                true
                            )
                            ) {
                                throw new CDbException(
                                    Yii::t('!!!!!!...')
                                );
                            }
                        }
                    }
                Yii::app()->user->setFlash(
                    yupe\widgets\YFlashMessages::SUCCESS_MESSAGE,
                    Yii::t('ServicesModule.services', 'Запись добавлена!')
                );

                $this->redirect(
                    (array)Yii::app()->getRequest()->getPost(
                        'submit-type',
                        [
                            'update',
                            'id' => $model->id
                        ]
                    )
                );
            }
        }
        $this->render('create', [
            'model' => $model,
            'menuId' => $menuId,
             'menuParentId' => $menuParentId,
            ]);
    }

    /**
    * Редактирование Услуги.
    *
    * @param integer $id Идинтификатор Услугу для редактирования
    *
    * @return void
    */
    public function actionUpdate($id)
    {
        $model = $this->loadModel($id);
        $oldTitle = $model->name;
        $menuId = null;
        $menuParentId = 0;

        if (Yii::app()->getRequest()->getPost('Services') !== null) {
            $model->setAttributes(Yii::app()->getRequest()->getPost('Services'));

            if ($model->save()) {
                if (Yii::app()->hasModule('menu')) {

                    $menuId = (int)Yii::app()->getRequest()->getPost('menu_id');
                    $parentId = (int)Yii::app()->getRequest()->getPost('parent_id');
                    $menu = Menu::model()->findByPk($menuId);
                    if ($menu) {
                        if (!$menu->changeItem(
                            $oldTitle,
                            $model->name,
                            Yii::app()->createUrl('/services/services/view', ['slug' => $model->slug]),
                            $parentId,
                            true
                        )
                        ) {
                            throw new CDbException(
                                Yii::t('PageModule.page', 'There is an error when connecting page to menu...')
                            );
                        }
                    }
                }
                Yii::app()->user->setFlash(
                    yupe\widgets\YFlashMessages::SUCCESS_MESSAGE,
                    Yii::t('ServicesModule.services', 'Запись обновлена!')
                );

                $this->redirect(
                    (array)Yii::app()->getRequest()->getPost(
                        'submit-type',
                        [
                            'update',
                            'id' => $model->id
                        ]
                    )
                );
            }
        }
        if (Yii::app()->hasModule('menu')) {
            $menuItem = MenuItem::model()->findByAttributes(
                [
                    "title" => $oldTitle,
                ]
            );


            if ($menuItem !== null) {
                $menuId = (int)$menuItem->menu_id;
                $menuParentId = (int)$menuItem->parent_id;
            }
        }
        $this->render('update', [
            'model' => $model,
            'menuId' => $menuId,
             'menuParentId' => $menuParentId,
        ]);
    }

    /**
    * Удаляет модель Услуги из базы.
    * Если удаление прошло успешно - возвращется в index
    *
    * @param integer $id идентификатор Услуги, который нужно удалить
    *
    * @return void
    */
    public function actionDelete($id)
    {
        if (Yii::app()->getRequest()->getIsPostRequest()) {
            // поддерживаем удаление только из POST-запроса
            $this->loadModel($id)->delete();
            if (Yii::app()->hasModule('menu')) {

                $menuItem = MenuItem::model()->findByAttributes(["title" => $model->name]);

                if ($menuItem !== null) {
                    $menuItem->delete();
                }
            }

            Yii::app()->user->setFlash(
                yupe\widgets\YFlashMessages::SUCCESS_MESSAGE,
                Yii::t('ServicesModule.services', 'Запись удалена!')
            );

            // если это AJAX запрос ( кликнули удаление в админском grid view), мы не должны никуда редиректить
            if (!Yii::app()->getRequest()->getIsAjaxRequest()) {
                $this->redirect(Yii::app()->getRequest()->getPost('returnUrl', ['index']));
            }
        } else
            throw new CHttpException(400, Yii::t('ServicesModule.services', 'Неверный запрос. Пожалуйста, больше не повторяйте такие запросы'));
    }

    /**
    * Управление Услугами.
    *
    * @return void
    */
    public function actionIndex()
    {
        $model = new Services('search');
        $model->unsetAttributes(); // clear any default values
        if (Yii::app()->getRequest()->getParam('Services') !== null)
            $model->setAttributes(Yii::app()->getRequest()->getParam('Services'));
        $this->render('index', ['model' => $model]);
    }

    /**
    * Возвращает модель по указанному идентификатору
    * Если модель не будет найдена - возникнет HTTP-исключение.
    *
    * @param integer идентификатор нужной модели
    *
    * @return void
    */
    public function loadModel($id)
    {
        $model = Services::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, Yii::t('ServicesModule.services', 'Запрошенная страница не найдена.'));

        return $model;
    }
}
