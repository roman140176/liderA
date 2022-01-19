<?php

Yii::import('application.modules.store.models.*');

class CatalogWidget extends yupe\widgets\YWidget
{
    public $id;
    public $ids;
    public $category_id = null;
    public $limit;



    public $view = 'view';
    protected $category;

    public function run()
    {
        $criteria = new CDbCriteria();

        if($this->limit){
            $criteria->limit = $this->limit;
        }

        $criteria->order = 't.sort ASC';

        if($this->id){
            $this->category = StoreCategory::model()->published()->findByPk($this->id);
        } else if($this->ids){
            $this->ids = explode(',', $this->ids);
            $this->category = StoreCategory::model()->findAllByPk($this->ids);
        }else if($this->category_id){
            $criteria->compare('parent_id', $this->category_id);
            $this->category = StoreCategory::model()->published()->findAll($criteria);
        }else{
            $this->category = StoreCategory::model()->published()->roots()->findAll($criteria);
        }


        $this->render($this->view, [
            'category' => $this->category
        ]);
    }
}