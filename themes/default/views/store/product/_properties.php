<div class="properties">
	<?php foreach ($product->getAttributeGroups() as $groupName => $items): ?>
		<?php foreach ($items as $attribute): ?>
			<?php if ($attribute->is_visible): ?>
				<?php if (AttributeRender::renderValue($attribute, $product->attribute($attribute)) !=null): ?>
					<div class="props__wrap d-flex">
						<div class="key">
							<span><?= $attribute->title; ?>:</span>
						</div>
						<div class="value">
							<span><?= AttributeRender::renderValue($attribute, $product->attribute($attribute)); ?></span>
						</div>
					</div>
				<?php endif ?>
			<?php endif ?>
		<?php endforeach ?>
	<?php endforeach ?>
					<div class="props__wrap d-flex">
						<div class="key">
							<span>Высота мм:</span>
						</div>
						<div class="value">
							<span><?= !empty($product->height) ? (int)$product->height : 'не задано'?></span>
						</div>
					</div>
</div>