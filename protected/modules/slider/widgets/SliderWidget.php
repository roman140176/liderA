<?php

Yii::import('application.modules.slider.models.Slider');

class SliderWidget extends yupe\widgets\YWidget
{
    public $page_id;
    public $category_id;
    public $limit = 6;
    /**
     * @var string
     */
    public $view = 'slider-widget';
    protected $models;

    public function init()
    {
        $criteria = new CDbCriteria();
        $criteria->limit = $this->limit;
        $criteria->order = 't.position ASC';

        $criteria->compare("t.page_id", $this->page_id);
        
        $this->models = Slider::model()->findAll($criteria);

        parent::init();
    }

    public function run()
    {
        $this->render($this->view, [
            'models' => $this->models
        ]);
    }
}
