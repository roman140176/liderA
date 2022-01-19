<?php use yupe\helpers\YText; ?>
<?php $filter = Yii::app()->getComponent('attributesFilter');?>
<div class="filter-block filter-div">
    <div class="filter-block__header">
        <small style="display: block;color:#989898"><?= $attribute->group['name'];?></small>
        <span class="cat-name"><?= $attribute->title ==='панель'? 'Декоративная панель' : $attribute->title?></span>
    </div>
    <div class="filter-block__body">
        <div class="filter-block__content">
            <?php $cat = [] ?>
            <div class="filter-items-wrap">
            <?php $count = 1; ?>
            <?php foreach ($attribute->getOptionsList($category, true) as $key => $option): ?>
                <?php if (!isset($cat[$option->cat])): ?>
                    <?php $cat[$option->cat] = $option->cat; ?>
                    <?php $id =  'cat-'.YText::translit($option->cat) ?>
                <?php $count++;?>
                  <div class="filter-block__item filter-checkbox filter-list<?= $count > 6 ? ' slice hidden' : ''?>">
                            <input type="checkbox" name="cat[<?= $attribute->id ?>][]" value="<?= $option->cat ?>" id="<?= $id ?>" <?= (isset($_GET['cat'], $_GET['cat'][$attribute->id]) and array_search($option->cat, $_GET['cat'][$attribute->id])!==false) ? 'checked' : '' ?>>

                    <label for="<?= $id ?>"> <?= $option->cat?></label>
                  </div>

                <?php endif ?>
            <?php endforeach; ?>
                <?php if ($count > 6): ?>
                   <div class="show-items">Показать ещё</div>
                <?php endif ?>
            </div>
            <hr>
            <div class="filter-items-wrap">
                <?php $countItem = 1; ?>
            <?php foreach ($attribute->getOptionsList($category) as $option): ?>
                <?php $countItem++; ?>
                <div class="filter-block__item filter-checkbox filter-list<?= $countItem > 6 ? ' slice hidden' : ''?>">
                    <?= CHtml::checkBox($filter->getDropdownOptionName($option), $filter->getIsDropdownOptionChecked($option, $option->id), [
                        'value' => $option->id,
                        'id' => $attribute->name."_".$option->id,
                        'data-cat' => $option->cat,
                        'class' => 'panel-input active-input'
                    ]) ?>

                    <?= CHtml::label($option->value, $attribute->name."_".$option->id);?>
                </div>
            <?php endforeach; ?>
                <?php if ($count > 6): ?>
                   <div class="show-items">Показать ещё</div>
                <?php endif ?>
            </div>
        </div>

    </div>
</div>
