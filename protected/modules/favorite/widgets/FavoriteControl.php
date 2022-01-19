<?php

/**
 * Class FavoriteControl
 */
class FavoriteControl extends \yupe\widgets\YWidget
{
    /**
     * @var
     */
    public $product;

    /**
     * @var
     */
    public $favorite;

    /**
     * @var string
     */
    public $view = 'favorite';

    /**
     *
     */
    public function init()
    {


        $this->favorite = Yii::app()->getComponent('favorite');

        parent::init();
    }

    /**
     * @throws CException
     */
    public function run()
    {
        $this->render($this->view, ['product' => $this->product, 'favorite' => $this->favorite]);
    }
}