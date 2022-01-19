<?php
/**
 * Directions install migration
 * Класс миграций для модуля Directions:
 *
 **/
class m000000_000002_services_add_column_is_home extends yupe\components\DbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->addColumn('{{services}}', 'is_home', "boolean not null default '0'");
        $this->addColumn('{{services}}', 'is_menu', "boolean not null default '0'");
    }

    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropColumn('{{services}}', 'is_home');
        $this->dropColumn('{{services}}', 'is_menu');
    }
}
