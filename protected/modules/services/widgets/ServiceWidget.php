<?php
/**
 * ServicesWidget виджет для вывода услуг
 *
 * @author yupe team <team@yupe.ru>
 * @link http://yupe.ru
 * @copyright 2009-2013 amyLabs && Yupe! team
 * @package yupe.modules.page.widgets
 * @since 0.1
 *
 */
Yii::import('application.modules.services.models.*');

/**
 * Class ServicesWidget - Собираем услуги
 */
class ServiceWidget extends yupe\widgets\YWidget
{
    public $limit = 1000;
    public $class = '';
    public $parent_id;
    public $id = false;
    public $order = 't.position ASC';
    public $topLevelOnly = false;
    /**
     * @var string
     */
    public $view = 'service-widget';
    protected $models;

    /**
     * @throws CException
     */
    public function run()
    {
        $criteria = new CDbCriteria();
        $criteria->addCondition("t.status = 1");
        $criteria->order = $this->order;

        if($this->limit){
            $criteria->limit = $this->limit;
        }
        if($this->parent_id){
            $criteria->addCondition("parent_id = {$this->parent_id}");
        }

        if ($this->topLevelOnly) {
                $criteria->addCondition("parent_id is null or parent_id = 0");
            }

        $this->render(
                $this->view,
                [
                    'models' => Services::model()->findAll($criteria),
                    'class' => $this->class
                ]
            );
    }

}
