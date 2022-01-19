<?php

class m180324_105354_add_count_view_column extends yupe\components\DbMigration
{
    public function safeUp()
    {
        $this->addColumn('{{news_news}}', 'count_view', 'varchar(250) NOT NULL');

    }
}