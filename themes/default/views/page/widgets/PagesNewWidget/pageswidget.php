<?php foreach(array_chunk($pages, ceil(count($pages) / 3)) as $pageChank): ?>
	<div class="footer__item footer__links">
		<?php foreach($pageChank as $key => $page): ?>
			<div class="footer-item-link">
				<a href="<?= $page->getPageUrl()?>">
					<?= $page->title_short ? : $page->title?>
				</a>
			</div>
		<?php endforeach ?>
	</div>
<?php endforeach ?>
