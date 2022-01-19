<?php

class m191225_082817_add_checkboxes_to_gallery extends yupe\components\DbMigration
{
    public function safeUp()
    {
        $this->addColumn('{{gallery_gallery}}', 'names', "boolean not null default '0'");
        $this->addColumn('{{gallery_gallery}}', 'pic_name', "boolean not null default '0'");
    }

    public function safeDown()
    {
        $this->dropColumn("{{gallery_gallery}}", 'names');
        $this->dropColumn("{{gallery_gallery}}", 'pic_name');
    }
}
