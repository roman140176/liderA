<div class="price-options">
	<?php
		$minQuantity = 1;
		$maxQuantity = Yii::app()->getModule('store')->controlStockBalances ? $data->getAvailableQuantity() : 99;
		$productCart = isset($positions["product_".$product->id."_"]) ? $positions["product_".$product->id."_"] : null;
		$quantity = $productCart ? $productCart->getQuantity() : 1;
	?>
	<div class="ap__title">Количество</div>
	<div class="quantity-box d-flex">
			<div data-min-value='<?= $minQuantity; ?>' data-max-value='<?= $maxQuantity; ?>'
					class="spinput js-spinput d-flex">
				<span class="spinput__minus js-spinput__minus product-quantity-decrease">
					<?= file_get_contents('.'. Yii::app()->getTheme()->getAssetsUrl() . '/images/svg/minus.svg'); ?>
				</span>
				<input name="Product[quantity]" value="<?= $quantity ?>" class="spinput__value product-quantity-input"
						id="product-quantity-input"/>
				<span class="spinput__plus js-spinput__plus product-quantity-increase">
					<?= file_get_contents('.'. Yii::app()->getTheme()->getAssetsUrl() . '/images/svg/plus.svg'); ?>
				</span>
			</div>
			<button
				class="posrel but-add-cart<?php //$product->getIsProductCart()>0 ? ' added' : ''?>" id="add-product-to-cart-<?= $product->id?>"
				data-id="<?= $product->id; ?>"
				data-url="<?= Yii::app()->createUrl('/cart/cart/add');?>"
				>
					<?= file_get_contents('.'. Yii::app()->getTheme()->getAssetsUrl() . '/images/svg/cart.svg'); ?>
				<span>
					<?= $product->getIsProductCart()>0 ? 'В корзине' : 'В корзину'?>
				</span>
			</button>
	</div>

</div>