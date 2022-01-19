<?php $Assets = Yii::app()->getTheme()->getAssetsUrl();?>
<div class="catalog-menu-container">
	<div class="container cmc-wrap d-flex">
		<div class="cmc-roots">
			<?php foreach($category as $key => $item): ?>
				<div class="cmc-roots__item <?= $key === 0 ? 'active' : ''?>" data-child="#child-<?= $item->id?>">
					<a href="<?= $item->getCategoryUrl()?>">
						<?= $item->getTitle()?>
					</a>
				</div>
			<?php endforeach ?>
		</div>
		<div class="cmc-children posrel">
			<?php foreach($category as $key => $item): ?>
				<div class="cmc-children__box <?= $key === 0 ? 'active' : ''?>" id="child-<?= $item->id?>">
					<div class="cmc-root-title">
                        <?= $item->getTitle()?>
					</div>
					<div class="cmc-children__items d-grid">
						<?php if(!empty($item->children)):?>
							<?php foreach($item->children as $k => $v): ?>
								<a href="<?= $v->getCategoryUrl()?>" class="catalog-home__item posrel">
									<header>
										<?php $ex = explode('<br>', $v->title);$newEx=[];?>
										<?php foreach ($ex as $i => $e): ?>
											<?php $e =  ' <div><span>'.$e.'</span></div>'?>
											<?php $newEx[] = $e ?>
										<?php endforeach ?>

										<?= implode($newEx)?>
									</header>
									<div class="catalog-home__img abs">
										<img
										src="<?= $Assets. '/images/elements/citem.gif' ?>"
										data-src="<?= $v->getImageUrl(345,227,true)?>"
										alt="<?= $v->getTitle()?>"
										class="slide-image"
										>
										<div class="spinner-border text-success abs" role="status" id="spinner">
										<span class="visually-hidden">Loading...</span>
										</div>
									</div>
								</a>
							<?php endforeach ?>
						<?php endif ;?>
					</div>
				</div>
			<?php endforeach ?>
		</div>
	</div>
</div>



