<?php

class m000001_000002_slider_add_column_category extends yupe\components\DbMigration
{
	public function safeUp()
	{
        $this->addColumn('{{slider}}', 'page_id', 'integer');
	}

	public function safeDown()
	{
        $this->dropColumn('{{slider}}', 'page_id');
	}
}