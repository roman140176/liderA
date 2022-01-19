<?php
/**
 * Directions install migration
 * Класс миграций для модуля Directions:
 *
 **/
class m190421_153332_add_column_is_main extends yupe\components\DbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->addColumn('{{page_page}}', 'is_special', 'boolean not null default "0"');
    }

    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropColumn('{{page_page}}', 'is_special');
    }
}
