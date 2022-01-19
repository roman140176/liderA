<?php
/**
 * ReviewNewWidget виджет для вывода страниц
 *
 * @author yupe team <team@yupe.ru>
 * @link http://yupe.ru
 * @copyright 2009-2013 amyLabs && Yupe! team
 * @package yupe.modules.review.widgets
 * @since 0.1
 *
 */
Yii::import('application.modules.review.models.*');

class ReviewCarouselWidget extends yupe\widgets\YWidget
{
    public $is_more = false;
    public $limit;
    public $category_id;
    public $view = 'review-carousel';

    public function run()
    {
        $criteria = new CDbCriteria();

        $criteria->addCondition("t.moderation = 1");
        $criteria->order = 't.position DESC';
        
        if($this->limit){
            $criteria->limit = $this->limit;
        }
        
        if($this->category_id){
            $criteria->addCondition("t.category_id = {$this->category_id}");
        }

        $model = Review::model()->findAll($criteria);

        $this->render($this->view, [
            'model' => $model,
            'is_more' => $is_more
        ]);
    }
}
