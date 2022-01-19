<?php
/**
 * Services install migration
 * Класс миграций для модуля Services:
 *
 * @category YupeMigration
 * @package  yupe.modules.services.install.migrations
 * @author   YupeTeam <team@yupe.ru>
 * @license  BSD https://raw.github.com/yupe/yupe/master/LICENSE
 * @link     https://yupe.ru
 **/
class m000000_000000_services_base extends yupe\components\DbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->createTable(
            '{{services}}',
            [
                'id'             => 'pk',
                //для удобства добавлены некоторые базовые поля, которые могут пригодиться.
                'create_user_id' => "integer NOT NULL",
                'update_user_id' => "integer NOT NULL",
                'create_time'    => 'datetime NOT NULL',
                'update_time'    => 'datetime NOT NULL',
                'parent_id'         => 'integer COMMENT "Родитель"',
                'name_short'        => 'string COMMENT "Короткое название"',
                'name'              => 'string COMMENT "Название"',
                'slug'              => 'string COMMENT "Alias"',
                'name_h1'           => 'string COMMENT "Заголовок на странице"',
                'image'             => 'string COMMENT "Изображение"',
                'description_short' => 'text COMMENT "Короткое описание"',
                'description'       => 'text COMMENT "Описание"',
                'meta_title'        => 'string COMMENT "Title (SEO)"',
                'meta_keywords'     => 'text COMMENT "Ключевые слова SEO"',
                'meta_description'  => 'text COMMENT "Описание SEO"',
                'status'            => 'integer COMMENT "Статус"',
                'position'          => 'integer COMMENT "Сортировка"',
            ],
            $this->getOptions()
        );
    }

    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropTableWithForeignKeys('{{services}}');
    }
}
