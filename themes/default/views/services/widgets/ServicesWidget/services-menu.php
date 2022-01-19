<?php if ($dataProvider->itemCount): ?>
	<ul class="menu-footer">
		<?php foreach ($dataProvider->getData() as $data): ?>
			<li>
				<a href="<?= Yii::app()->createUrl('/services/services/view', ['slug' => $data->slug]); ?>"><?= $data->name_short; ?></a>
			</li>
		<?php endforeach; ?>
	</ul>
<?php endif; ?>
