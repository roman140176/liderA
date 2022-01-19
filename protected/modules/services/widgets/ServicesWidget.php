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
class ServicesWidget extends yupe\widgets\YWidget
{
    public $is_home = false;
    public $is_menu = false;
    public $limit;
    public $paginationLimit = false;
    public $order = 't.position ASC';
    /**
     * @var string
     */
    public $view = 'services-widget';

    protected $dataProvider;

    public function init()
    {
        $criteria = new CDbCriteria();
        $criteria->addCondition("t.status = 1");
        $criteria->order = $this->order;

        if($this->is_home){
        	$criteria->compare("t.is_home", Services::HOME_ACTIVE);
        }
        if($this->is_menu){
        	$criteria->compare("t.is_menu", Services::MENU_ACTIVE);
        }

        if($this->limit){
            $criteria->limit = $this->limit;
        }

        if ($this->paginationLimit) {
            $this->paginationLimit = [
                'pageSize' => $this->paginationLimit,
                'pageVar' => 'page',
            ];
        }

        $this->dataProvider = new CActiveDataProvider('Services', [
            'criteria' => $criteria,
            'pagination' => $this->paginationLimit,
            'sort' => [
                'sortVar' => 'sort',
                'defaultOrder' => $this->order
            ],
        ]);

        parent::init();
    }

    /**
     * @throws CException
     */
    public function run()
    {
        
        $this->render($this->view,[
            'dataProvider' => $this->dataProvider,
        ]);
    }
}
