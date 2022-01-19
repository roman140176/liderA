<?php

class m201225_082817_add_ids_to_gallery extends yupe\components\DbMigration
{
   public function safeUp()
    {
        $this->addColumn("{{gallery_gallery}}", 'self_id', 'integer');
    }

    public function safeDown()
    {
        $this->dropColumn("{{gallery_gallery}}", 'self_id');
    }
}
