<div class="variants">
	<?php if (count($product->getVariantsGroup())>0): ?>
		<div class="products-item_inp">
			<?php
				$id = 0;
				?>

			<?php $arr = $product->getVariantsGroupName(); ?>
			<?php foreach ($product->getVariantsGroup() as $title => $variantsGroup): { ?>
				<?php $id++;?>
				<div class="variant-names">
				<div class="variant-name">
					<?php
					$curr = current($arr);
					echo "<div><span class='v-title'>$curr:</span><span class='v-name'></span></div>";
					next($arr);
						?>

				</div>
				<div class="products-inp_row-wrap">
					<div class="products-inp_row d-flex id-<?= $product->id ?>">
						<?php
						$listData = CHtml::listData($variantsGroup, 'id', 'optionValue');

						echo MyHtml::radioButtonList(
							"ProductVariant[]-{$id}-{$product->id}",
							current(array_keys($listData)),
							$listData,
							[
								'itemOptions' => $product->getVariantsOptions(),
								'labelOptions' => ['style'=>'background:'.$listData[$id]],
								'itemLableOptions' => array_combine(array_keys($listData), array_map(function($i) {
									$ie = explode('/',$i);
									return ['style'=>'background:'.$ie[1],'data-color'=>$ie[0],'data-colorname'=>$ie[1]]; }, $listData)),
								'container' => '',
								'separator' => '',
								'template' => "
									<div class=\"products-inp_col idcol-{$product->id}\">
										{input}
										{label}
									</div>
								"
							]
						); ?>
					</div>
				</div>
			</div>
		<?php } endforeach; ?>
	</div>
	<?php endif ?>
</div>