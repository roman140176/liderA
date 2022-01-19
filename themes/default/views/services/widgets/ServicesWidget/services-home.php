<?php if ($dataProvider->itemCount): ?>
	<div class="services-home-box fl fl-wr-w">
		<?php foreach ($dataProvider->getData() as $data): ?>
			<div class="services-home-box__item">
				<div class="services-home-box__img">
					<?= $data->svg_icon; ?>
				</div>
				<div class="services-home-box__info fl fl-di-c fl-ju-co-sp-b">
					<div class="services-home-box__name">
						<?= $data->name_short; ?>
					</div>
					<div class="services-home-box__but">
						<a  class="services-home-box__link but-link" href="<?= Yii::app()->createUrl('/services/services/view', ['slug' => $data->slug]); ?>">Подробнее</a>
					</div>
				</div>
			</div>
		<?php endforeach; ?>
	</div>
<?php endif; ?>
