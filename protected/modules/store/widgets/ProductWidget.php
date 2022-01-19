<?php

Yii::import('application.modules.store.models.*');

class ProductWidget extends yupe\widgets\YWidget
{
    /**
     * @var
     */
    public $category_id;
    public $linkedCategory;
    public $title = '';
    public $is_new = false;
    public $is_home = false;
    public $is_special = false;

    /**
     * @var bool
     */
    public $limit = false;
    /**
     * @var string
     */
    public $view = 'default';

    /**
     * @return bool
     * @throws CException
     */
    public function run()
    {
        $criteria = new CDbCriteria();

        if($this->limit){
            $criteria->limit = $this->limit;
        }

        $criteria->order = 't.position ASC';

        if($this->category_id){
            $criteria->addCondition("t.category_id={$this->category_id}");
        }

        if($this->is_new){
            $criteria->addCondition("t.is_new={$this->is_new}");
        }
        if($this->is_special){
            $criteria->addCondition("t.is_special={$this->is_special}");
        }

        if($this->is_home){
            $criteria->addCondition("t.is_home={$this->is_home}");
        }


        $products = Product::model()->published()->findAll($criteria);

        $this->render(
            $this->view,
            [
                'products' => $products,
            ]
        );
    }
}