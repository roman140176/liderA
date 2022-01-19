<?php

/**
 * This is the model class for table "{{services}}".
 *
 * The followings are the available columns in table '{{services}}':
 * @property integer $id
 * @property integer $create_user_id
 * @property integer $update_user_id
 * @property string $create_time
 * @property string $update_time
 * @property integer $parent_id
 * @property string $name_short
 * @property string $name
 * @property string $slug
 * @property string $name_h1
 * @property string $image
 * @property string $description_short
 * @property string $description
 * @property string $meta_title
 * @property string $meta_keywords
 * @property string $meta_description
 * @property integer $status
 * @property integer $position
  * @property string $data
 * @property string $svg_icon
 */
class Services extends yupe\models\YModel
{
    const HOME_ACTIVE = 1;
    const MENU_ACTIVE = 1;

    const STATUS_PUBLIC = 1;
    const STATUS_MODERATE = 0;

    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return '{{services}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return [
            ['create_user_id, update_user_id, create_time, update_time', 'safe'],
            ['create_user_id, update_user_id, parent_id, status, position', 'numerical', 'integerOnly'=>true],
            ['name_short, name, slug, name_h1, image, meta_title', 'length', 'max'=>255],
            ['slug', 'yupe\components\validators\YSLugValidator'],
            ['slug', 'unique'],
            ['is_home, is_menu', 'boolean'],
            ['description_short, description, meta_keywords, meta_description, data, svg_icon, is_home, is_menu', 'safe'],
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            ['id, create_user_id, update_user_id, create_time, update_time, parent_id, name_short, name, slug, name_h1, image, description_short, description, meta_title, meta_keywords, meta_description, status, position, data, svg_icon, is_home, is_menu', 'safe', 'on'=>'search'],
        ];
    }

    /**
     * @return array relational rules.
     */
    public function relations()
    {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return [
            'childServices' => [self::HAS_MANY, 'Services', 'parent_id'],
            'parentService' => [self::BELONGS_TO, 'Services', 'parent_id'],
        ];
    }

    public function behaviors()
    {
        $module = Yii::app()->getModule('services');
        return [
            'imageUpload' => [
                'class'         => 'yupe\components\behaviors\ImageUploadBehavior',
                'attributeName' => 'image',
                'minSize'       => $module->minSize,
                'maxSize'       => $module->maxSize,
                'types'         => $module->allowedExtensions,
                'uploadPath'    => $module->uploadPath,
            ],
            'sortable' => [
                'class' => 'yupe\components\behaviors\SortableBehavior',
            ],
            'customField' => [
                'class' => 'yupe\components\behaviors\CustomFieldBehavior',
                'attributeName' => 'data',
            ],
        ];
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'create_user_id' => 'Create User',
            'update_user_id' => 'Update User',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'parent_id' => 'Родитель',
            'name_short' => 'Короткое название',
            'name' => 'Название',
            'slug' => 'Alias',
            'name_h1' => 'Заголовок на странице',
            'image' => 'Изображение',
            'description_short' => 'Короткое описание',
            'description' => 'Описание',
            'meta_title' => 'Title (SEO)',
            'meta_keywords' => 'Ключевые слова SEO',
            'meta_description' => 'Описание SEO',
            'status' => 'Статус',
            'position' => 'Сортировка',
            'svg_icon' => 'SVG-иконка',
            'is_home' => 'Выводить на главной',
            'is_menu' => 'Вывести в меню',
        ];
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     *
     * Typical usecase:
     * - Initialize the model fields with values from filter form.
     * - Execute this method to get CActiveDataProvider instance which will filter
     * models according to data in model fields.
     * - Pass data provider to CGridView, CListView or any similar widget.
     *
     * @return CActiveDataProvider the data provider that can return the models
     * based on the search/filter conditions.
     */
    public function search()
    {
        // @todo Please modify the following code to remove attributes that should not be searched.

        $criteria=new CDbCriteria;

        $criteria->compare('id',$this->id);
        $criteria->compare('create_user_id',$this->create_user_id);
        $criteria->compare('update_user_id',$this->update_user_id);
        $criteria->compare('create_time',$this->create_time,true);
        $criteria->compare('update_time',$this->update_time,true);
        $criteria->compare('parent_id',$this->parent_id);
        $criteria->compare('name_short',$this->name_short,true);
        $criteria->compare('name',$this->name,true);
        $criteria->compare('slug',$this->slug,true);
        $criteria->compare('name_h1',$this->name_h1,true);
        $criteria->compare('image',$this->image,true);
        $criteria->compare('description_short',$this->description_short,true);
        $criteria->compare('description',$this->description,true);
        $criteria->compare('meta_title',$this->meta_title,true);
        $criteria->compare('meta_keywords',$this->meta_keywords,true);
        $criteria->compare('meta_description',$this->meta_description,true);
        $criteria->compare('status',$this->status);
        $criteria->compare('position',$this->position);
        $criteria->compare('svg_icon', $this->svg_icon);
        $criteria->compare('is_home', $this->is_home);
        $criteria->compare('is_menu', $this->is_menu);

        return new CActiveDataProvider($this, [
            'criteria'=>$criteria,
            'sort' => ['defaultOrder' => 't.position ASC'],
        ]);
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Services the static model class
     */
    public static function model($className=__CLASS__)
    {
        return parent::model($className);
    }

    /**
     * @return bool
     */
     public function beforeSave()
    {
        $this->update_time = new CDbExpression('NOW()');
        $this->update_user_id = Yii::app()->getUser()->getId();

        if ($this->getIsNewRecord()) {
            $this->create_time = $this->update_time;
            $this->create_user_id = Yii::app()->getUser()->getId();
        }

        return parent::beforeSave();
    }

    public function getStatusList()
    {
        return [
            self::STATUS_PUBLIC   => 'Опубликован',
            self::STATUS_MODERATE => 'На модерации',
        ];
    }

    public function getStatusName()
    {
        $data = $this->getStatusList();
        if (isset($data[$this->status])) {
            return $data[$this->status];
        }
        return null;
    }

    public function scopes()
    {
        return [
            'published' => [
                'condition' => 'status  = :status',
                'params' => [
                    ':status' => self::STATUS_PUBLIC
                ]
            ],
            'roots' => [
                'condition' => 'parent_id IS NULL',
            ],
            'ishome' => [
                'condition' => 't.is_home = :is_home',
                'params' => [':is_home' => self::HOME_ACTIVE],
            ],
            'ismenu' => [
                'condition' => 't.is_menu = :is_menu',
                'params' => [':is_menu' => self::MENU_ACTIVE],
            ],
        ];
    }

    public function getTitle()
    {
        return $this->name_h1 ? : $this->name;
    }
    public function getUrl()
    {
        return Yii::app()->createUrl('/services/services/view', ['slug'=>$this->slug]);
    }

    public function getFormattedList($parentId = null, $level = 0, $criteria = null)
    {
        if (empty($parentId)) {
            $parentId = null;
        }

        $models = $this->findAllByAttributes(['parent_id' => $parentId], $criteria);

        $list = [];

        foreach ($models as $model) {

            $model->name = str_repeat('&emsp;', $level) . $model->name;

            $list[$model->id] = $model->name;

            $list = CMap::mergeArray($list, $this->getFormattedList($model->id, $level + 1, $criteria));
        }

        return $list;
    }
}
