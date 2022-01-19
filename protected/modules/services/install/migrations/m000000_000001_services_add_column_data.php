<?php
/**
 * Directions install migration
 * Класс миграций для модуля Directions:
 *
 **/
class m000000_000001_services_add_column_data extends yupe\components\DbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->addColumn('{{services}}', 'svg_icon', 'text');
        $this->addColumn('{{services}}', 'data', 'longtext');
    }

    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropColumn('{{services}}', 'svg_icon');
        $this->dropColumn('{{services}}', 'data');
    }
}
