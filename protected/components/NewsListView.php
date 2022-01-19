<?php
/**
 * ## TbListView class file.
 *
 * @author Christoffer Niska <ChristofferNiska@gmail.com>
 * @copyright Copyright &copy; Christoffer Niska 2011-
 * @license [New BSD License](http://www.opensource.org/licenses/bsd-license.php)
 */

// Yii::import('zii.widgets.CListView');
Yii::import('bootstrap.widgets.TbListView');

/**
 * Bootstrap Zii list view.
 *
 * @package booster.widgets.grouping
 */
class NewsListView extends TbListView {

    /**
     * @var string the CSS class name for the pager container. Defaults to 'pagination'.
     */
    public $pagerCssClass = 'pagination';

    /**
     * @var array the configuration for the pager.
     * Defaults to <code>array('class'=>'ext.booster.widgets.TbPager')</code>.
     */
    public $pager = ['class' => 'booster.widgets.TbPager'];
    public $template="{sorter}\n{items}\n{pager}";

    /**
     * @var string the URL of the CSS file used by this detail view.
     * Defaults to false, meaning that no CSS will be included.
     */
    public $cssFile = false;

    public function registerClientScript(){
        return;
    }
    public function init() {

        parent::init();

    }
}
