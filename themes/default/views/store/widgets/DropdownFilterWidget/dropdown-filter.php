<?php $filter = Yii::app()->getComponent('attributesFilter');?>
<?php if (count($attribute->getOptionsList($category)) > 0): ?>
<div class="filter-block filter-div">
    <div class="filter-block__header">
        <span class="cat-name"><?= $attribute->title?></span>
    </div>

        <?php $count = 1; ?>
          <div class="filter-items-wrap">
            <?php foreach ($attribute->getOptionsList($category) as $option): ?>
                <?php $count++; ?>
                <div class="filter-block__item filter-checkbox filter-list">
                    <?= CHtml::checkBox($filter->getDropdownOptionName($option), $filter->getIsDropdownOptionChecked($option, $option->id), [
                        'value' => $option->id,
                        'id' => $attribute->name."_".$option->id,
                        'class' => 'filter-input',
                        'data-title' => $attribute->title
                    ]) ?>

                    <?= CHtml::label($option->value, $attribute->name."_".$option->id);?>
                </div>
            <?php endforeach; ?>

            </div>

</div>
<?php endif ?>