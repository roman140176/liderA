<?php if ($dataProvider->itemCount): ?>
	<?php  $this->widget(
        'bootstrap.widgets.TbListView',
        [
            'dataProvider' => $dataProvider,
            'id' => 'services-box',
            'itemView' => '../../services/_item',
            'template'=>'
                {items}
                {pager}
            ',
            'itemsCssClass' => "services-box services-page fl fl-wr-w",
            'htmlOptions' => [
                // 'class' => 'news-box'
            ],
            'ajaxUpdate'=>true,
            'enableHistory' => false,
            // 'ajaxUrl'=>'GET',
            'pagerCssClass' => 'pagination-box',
                'pager' => [
                'header' => '',
                'lastPageLabel' => '<i class="fa fa-angle-double-right" aria-hidden="true"></i>',
                'firstPageLabel' => '<i class="fa fa-angle-double-left" aria-hidden="true"></i>',
                // 'lastPageLabel'  => false,
                // 'firstPageLabel' => false,
                'prevPageLabel' => '<i class="fa fa-angle-left" aria-hidden="true"></i>',
                'nextPageLabel' => '<i class="fa fa-angle-right" aria-hidden="true"></i>',
                'maxButtonCount' => 5,
                'htmlOptions' => [
                    'class' => 'pagination'
                ],
            ]
        ]
    ); ?>
<?php endif; ?>