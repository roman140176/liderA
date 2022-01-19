<?php
/**
 * Файл настроек для модуля services
 *
 * @author yupe team <team@yupe.ru>
 * @link https://yupe.ru
 * @copyright 2009-2020 amyLabs && Yupe! team
 * @package yupe.modules.services.install
 * @since 0.1
 *
 */
return [
    'module'    => [
        'class' => 'application.modules.services.ServicesModule',
    ],
    'import'    => [],
    'component' => [],
    'rules'     => [
        // '/services' => 'services/services/index',
        '/services/<slug>' => 'services/services/view',
    ],
];