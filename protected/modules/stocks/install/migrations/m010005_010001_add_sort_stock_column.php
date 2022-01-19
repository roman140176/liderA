<?php

class m010005_010001_add_sort_stock_column extends CDbMigration
{
    public function safeUp()
    {
        $this->addColumn('{{stocks}}', 'sort', "integer NOT NULL DEFAULT '1'");
        $result = Yii::app()->db->createCommand("select * FROM {{stocks}}")->queryAll();
        if ($result) {
            foreach ($result as $item) {
                $query = "update {{stocks}} set sort = :id where id=:id";
                $command = Yii::app()->db->createCommand($query);
                $command->execute([
                        ':id' => $item['id']
                    ]
                );
            }
        }
    }

    public function safeDown()
    {
        $this->dropColumn('{{stocks}}', 'sort');
    }
}