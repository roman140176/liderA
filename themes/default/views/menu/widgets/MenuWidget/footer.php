<?php
Yii::import('application.modules.menu.components.YMenu');
$this->widget(
    'application.components.CMenu',
    [
        'items' => $this->params['items'],
        'htmlOptions' => [
            'id'=>'menu_footer',
            'class' => 'list-none menu_footer d-flex',
        ],
    'submenuHtmlOptions' =>[
        'class' => 'hidden'
        ]
    ]
);
