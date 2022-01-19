<?php
/**
 * Directions install migration
 * Класс миграций для модуля Directions:
 *
 **/
class m000000_000001_curses_add_column_data extends yupe\components\DbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->addColumn('{{image_image}}', 'data', 'longtext');
    }

    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropColumn('{{image_image}}', 'data');
    }
}
