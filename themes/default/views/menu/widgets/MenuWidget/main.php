<?php
Yii::import('application.modules.menu.components.YMenu');
$this->widget(
    'application.components.CMenu',
    [
        'items' => $this->params['items'],
        'htmlOptions' => [
            'id'=>'menu_header',
            'class' => 'list-none menu_header d-flex',
        ],
    'submenuHtmlOptions' =>[
        'class' => 'subMenu list-none'
        ]
    ]
);
