<div class="services-box__item fl fl-di-c">
	<div class="services-box__header fl fl-wr-w fl-al-it-c">
		<a class="fl fl-wr-w fl-al-it-c" href="<?= Yii::app()->createUrl('/services/services/view', ['slug' => $data->slug]); ?>">
			<div class="services-box__img">
				<?= $data->svg_icon; ?>
			</div>
			<div class="services-box__name">
				<?= $data->name_short; ?>
			</div>
		</a>
	</div>
	<div class="services-box__info fl fl-di-c fl-ju-co-sp-b">
		<div class="services-box__desc txt-style">
			<?= $data->description_short; ?>
		</div>
	</div>
	<div class="services-box__but fl fl-wr-w fl-al-it-c">
		<a class="services-box__more but" href="<?= Yii::app()->createUrl('/services/services/view', ['slug' => $data->slug]); ?>">Подробнее</a>
		<a class="services-box__link but-link but-link-black js-make-appointment" data-modal="#makeAppointmentModal" data-service="<?= $data->name_short; ?>" href="#">Записаться на прием</a>
	</div>
</div>