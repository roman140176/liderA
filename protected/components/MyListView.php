<?php
Yii::import('bootstrap.widgets.TbListView');
/**
 * MyListView
 */
class MyListView extends TbListView
{
    public $pager = ['class' => 'booster.widgets.TbPager'];
    public $countProduct = '';

    public $sorterDropDown = [];
    public $sorterClassUl = '';
    public $sorterClassLink = 'sort-box__link';
    public function renderControls()

    {

        echo '
            <div class="but-menu-filter hidden">
                <a class="but but-green" href="#"><i class="fa fa-filter" aria-hidden="true"></i><span>Фильтры</span>
                </a>
            </div>
            <div class="catalog-controls">
                <div class="catalog-controls__sort d-flex"> ';
                    $this->renderSorter();
                    $this->renderCountPage();
        echo '</div></div>';
        echo '<div class="selected-filters"></div>';
    }
public function renderCountValue()
    {
        echo $this->countValue();
    }

    public function countValue(){


        if((int)$this->controller->storeCountPage > (int)$this->countProduct && (int)$this->countProduct != 0){
            $countPage = $this->countProduct;
        } else {
            $countPage = $this->controller->storeCountPage;
        }

        $valueH = '<div class="catalog-controls__label-pr-count">
            1-'.$countPage.' из '.$countPage.'</strong>
        </div>';

        return $valueH;
    }
    public function renderCountPage()
    {
        echo $this->countPage();
    }

    public function countPage()
    {
        // $pageList = [24,48,72];
        $pageList = [3,18,24];
        $pageL = "<div class='countItem-box d-flex'>
            <div class='countItem-box__header'><span>Товары </span>на странице:</div>
            <div class='countItem-box__body countItem-wrapper'><span class='active-number'></span><div class='cw-list'>";

        foreach ($pageList as $key => $data) {
            $pageL .= "<div class='countItem-wrapper__link " . (($data == $this->controller->storeCountPage) ? 'active' : '') . "' data-count='{$data}'>{$data}</div>";
        }
        $pageL .= "</div></div></div>";

        return $pageL;

    }


    /**
     * Формирование структуры сортировки по названию, цене
     */
   public function renderSorter()
    {
        $id = $this->htmlOptions['id'];
        $defaultSort = Yii::app()->getModule('store')->getDefaultSort('');
        $defaultSort = trim(preg_replace('/[^a-zA-Z](DESC|ASC|)/', ' ', $defaultSort));

        echo CHtml::openTag('div', ['class'=>$this->sorterCssClass])."\n";
            echo'<svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect y="2.36401" width="2" height="16" rx="1" transform="rotate(-90 0 2.36401)" fill="#38434E"/>
                <rect y="8.18213" width="2" height="11.6364" rx="1" transform="rotate(-90 0 8.18213)" fill="#38434E"/>
                <rect y="14" width="2" height="7.27273" rx="1" transform="rotate(-90 0 14)" fill="#38434E"/>
                </svg>';
            echo $this->sorterHeader===null ? Yii::t('zii','Sort by: ') : '<span>'.$this->sorterHeader.'</span>
            <svg width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg" class="dd-svg">
            <path d="M1 1L6 6L11 1" stroke="#38434E" stroke-width="1.5"/>
            </svg>
            ';
            echo CHtml::openTag('ul', ['class' => $this->sorterClassUl])."\n";
            foreach ($this->sorterDropDown as $key => $item) {
                if($defaultSort == trim(preg_replace('/[^a-zA-Z](desc|asc|)/', ' ', $key))){
                    echo CHtml::openTag('li', ['class' => $this->sorterClassLink . ' active', 'data-href' => '?sort='.$key]);

                } else {
                    $params = $_GET;
                    if (isset($params['path'])) {
                        unset($params['path']);
                    }
                    $params['sort'] = $key;
                    echo CHtml::openTag('li', ['class' => $this->sorterClassLink, 'data-href' => '?'.http_build_query($params)]);
                }
                    echo $item;
                echo CHtml::closeTag('li');
            }
            echo CHtml::closeTag('ul');
        echo CHtml::closeTag('div');

    }

    public function renderSummary()
    {
        if(($count=$this->dataProvider->getItemCount())<=0)
            return;

        echo CHtml::openTag($this->summaryTagName, ['class'=>$this->summaryCssClass]);
        if($this->enablePagination)
        {
            $pagination=$this->dataProvider->getPagination();
            $total=$this->dataProvider->getTotalItemCount();
            $start=$pagination->currentPage*$pagination->pageSize+1;
            $end=$start+$count-1;
            if($end>$total)
            {
                $end=$total;
                $start=$end-$count+1;
            }
            if(($summaryText=$this->summaryText)===null)
                $summaryText=Yii::t('zii','Displaying {start}-{end} of 1 result.|Displaying {start}-{end} of {count} results.',$total);
            echo strtr($summaryText,[
                '{start}'=>$start,
                '{end}'=>$end,
                '{count}'=>$total,
                '{page}'=>$pagination->currentPage+1,
                '{pages}'=>$pagination->pageCount,
            ]);
        }
        else
        {
            if(($summaryText=$this->summaryText)===null)
                $summaryText=Yii::t('zii','Total 1 result.|Total {count} results.',$count);
            echo strtr($summaryText,[
                '{count}'=>$count,
                '{start}'=>1,
                '{end}'=>$count,
                '{page}'=>1,
                '{pages}'=>1,
            ]);
        }
        echo CHtml::closeTag($this->summaryTagName);
    }

    public function registerClientScript(){
        return;
    }

}
