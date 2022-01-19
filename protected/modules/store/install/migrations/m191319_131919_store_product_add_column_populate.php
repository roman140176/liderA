<?php

class m191319_131919_store_product_add_column_populate extends yupe\components\DbMigration
{
	public function safeUp()
	{
		$this->addColumn('{{store_product}}', 'populate', "string not null default '0'");
	}

	public function safeDown()
	{
		$this->dropColumn('{{store_product}}', 'populate');
	}
}