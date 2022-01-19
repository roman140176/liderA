<div class="singl-product-info">
	<form action="<?= Yii::app()->createUrl('cart/cart/add'); ?>" method="post" class="single-form">
	<input type="hidden" name="Product[id]" value="<?= $product->id; ?>"/>
		<?= CHtml::hiddenField(
			Yii::app()->getRequest()->csrfTokenName,
			Yii::app()->getRequest()->csrfToken
		); ?>
		<div class="sp-info-header d-flex">
			<div class="sku-box">
				Арт. <?= $product->sku?>
			</div>
			<div class="favorite-box d-flex">
				<a class="toolbar-button" href="<?= Yii::app()->createUrl('/favorite/default/index'); ?>">
					<div class="product-button__item product-favorite">
						<?php $this->widget('application.modules.favorite.widgets.FavoriteControl', [
							'product' => $product,
							'view' => "favorite-sigle"
						]);?>
					</div>
				</a>
				<div class="to-favorite">
					В избранное
				</div>
			</div>
			<div class="sharing-box d-flex">
				<script src="https://yastatic.net/share2/share.js"></script>
				<div class="ya-share2" data-curtain data-size="s" data-limit="0" data-more-button-type="short" data-services="vkontakte,facebook,odnoklassniki,telegram,viber,whatsapp"></div>
				<div class="share-text">
					Поделиться
				</div>
			</div>
		</div>
		<?php $this->renderPartial('./_variants',['product' => $product]); ?>
		<div class="about-price">
			<div class="ap__title">
				Цена товара
			</div>
			<div class="app__desc page-title">
				Стоимость расчитывается индивидуально
			</div>
		</div>
		<?php $this->renderPartial('./_price-options',['product'=>$product]); ?>
	</form>
	<div class="client-warning cw__desck">
		<p>Стоимость товаров и доставки будут сформированы в момент подтверждения заказа менеджером. <br>
		Изображение может отличаться от оригинала не влияя на характеристики товара.</p>
		<p>Производитель может изменить информацию без предварительного уведомления!</p>
		<p>Весь товар сертифицирован.</p>
	</div>
	<div class="specifications scp__desck">
		<div class="specifications-title">
			Характеристики
		</div>
		<?php $this->renderPartial('./_properties',['product' => $product]); ?>
	</div>
	<div class="product-main-description pmd__desck">
		<div class="specifications-title">
			Назначение
		</div>
		<?php $description = explode('<hr />',$product->description)?>
		<div class="visible-part">
			<?= $description[0]?>
		</div>
		<?php if(isset($description[1])):?>
		<div class="no-visible-part">
			<?= $description[1]?>
		</div>
		<div class="expand">
			Развернуть
		</div>
		<?php endif ;?>
	</div>
</div>
<div class="cm__specifications">
	<div class="client-warning cw__mob">
		<p>Стоимость товаров и доставки будут сформированы в момент подтверждения заказа менеджером. <br>
		Изображение может отличаться от оригинала не влияя на характеристики товара.</p>
		<p>Производитель может изменить информацию без предварительного уведомления!</p>
		<p>Весь товар сертифицирован.</p>
	</div>
	<div class="specifications scp__mob">
		<div class="specifications-title">
			Характеристики
		</div>
		<?php $this->renderPartial('./_properties',['product' => $product]); ?>
	</div>
	<div class="product-main-description">
		<div class="specifications-title">
			Назначение
		</div>
		<?php $description = explode('<hr />',$product->description)?>
		<div class="visible-part">
			<?= $description[0]?>
		</div>
		<?php if(isset($description[1])):?>
		<div class="no-visible-part">
			<?= $description[1]?>
		</div>
		<div class="expand">
			Развернуть
		</div>
		<?php endif ;?>
	</div>
</div>

