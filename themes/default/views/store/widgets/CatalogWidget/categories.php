<div class="categories-menu" id="cm-data">
	<div class="cm__header-warp">
		<div class="cm__header d-flex">
			<div class="params-title">Категории</div>
			<div class="cm-close">
				<svg width="9" height="9" viewBox="0 0 9 9" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M9 0.9L8.1 0L4.5 3.6L0.9 0L0 0.9L3.6 4.5L0 8.1L0.9 9L4.5 5.4L8.1 9L9 8.1L5.4 4.5L9 0.9Z" fill="#38434E"/>
				</svg>
			</div>
		</div>
	</div>
	<?php foreach($category as $key => $cat): ?>
		<div class="parent-item">
			<a href="<?= $cat->getCategoryUrl()?>" class="catparent-link<?= $cat->slug == $_GET['path'] ? ' active' : ''?>">
				<?= $cat->getTitle()?>
			</a>
			<?php if(!empty($cat->children)):?>
				<div class="categorychild-box">
					<?php foreach($cat->children as $k => $child): ?>
						<a href="<?= $child->getCategoryUrl()?>" class="d-flex c-child__item <?= $_GET['path'] == $cat->slug.'/'.$child->slug ? 'active' : ''?>">
							<?= $child->getTitle()?>
						</a>
					<?php endforeach ?>
				</div>
			<?php endif ;?>
		</div>
	<?php endforeach ?>
</div>



