<?php

/**
 * GalleryWidget виджет отрисовки галереи изображений
 *
 */

Yii::import('application.modules.gallery.models.*');

class NewGalleryWidget extends yupe\widgets\YWidget
{
    // сколько изображений выводить на одной странице
    public $limit = 1000;

    // ID-галереи
    public $id;
    public $self_id;
    public $category_id;
    public $lists;
    public $name;

    public $view = 'gallery-widget';

    /**
     * Запускаем отрисовку виджета
     *
     * @return void
     */
    public function run()
    {
        $criteria = new CDbCriteria();
        if ($this->limit) {
                $criteria->limit = (int)$this->limit;
            }

        if($this->id){
           $model = Gallery::model()->findByPk($this->id);
       }

       if($this->self_id){
           $model = Gallery::model()->findByAttributes(['self_id' => $this->self_id]);
       }

        $this->category_id = (int)$this->category_id;
        if ($this->category_id) {
                $criteria->addCondition("category_id = {$this->category_id}");
            }
       $this->lists = Gallery::model()->findAll($criteria);

        $this->render(
            $this->view,
            [
                'model' => $model,
                'lists' => $this->lists,
                'limit' => $this->limit,
            ]
        );
    }
}
