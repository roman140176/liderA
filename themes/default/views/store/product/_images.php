<div class="singl-product-images d-flex">
	<div class="product-thumbs posrel">
		<div class="tumb-button pt-button-prev">
			<svg width="28" height="17" viewBox="0 0 28 17" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd" d="M14.0001 0.878662L27.0608 13.9393L24.9395 16.0606L14.0001 5.1213L3.06077 16.0606L0.939453 13.9393L14.0001 0.878662Z" fill="#38434E"/>
			</svg>
		</div>
		<div class="stw__wrapp">
			<div class="sliders-thumbs">
				<div class="swiper-wrapper">
					<div class="swiper-slide product-thumb-item">
						<img data-src="<?= $product->getImageUrl()?>" class="swiper-lazy" />
					</div>
					<?php foreach($images as $key => $image): ?>
						<div class="swiper-slide product-thumb-item">
							<img
							data-src="<?= $image->getImageUrl(80,82,true)?>" class="swiper-lazy"
							 />
						</div>
					<?php endforeach ?>
				</div>
			</div>
		</div>
		<div class="tumb-button pt-button-next">
			<svg width="28" height="17" viewBox="0 0 28 17" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd" d="M13.9999 16.1213L0.939226 3.06068L3.06055 0.939358L13.9999 11.8787L24.9392 0.939358L27.0605 3.06068L13.9999 16.1213Z" fill="#38434E"/>
			</svg>
		</div>
	</div>
	<div class="product-main-img">
		<div class="sliders-product-main">
			<div class="swiper-wrapper">
				<div class="swiper-slide product-main_mage-item">
					<img data-src="<?= $product->getImageUrl()?>" class="swiper-lazy" />
				</div>
				<?php foreach($images as $key => $image): ?>
					<div class="swiper-slide product-main_mage-item">
						<img data-src="<?= $image->getImageUrl(528,542,true)?>" class="swiper-lazy" />
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</div>
</div>