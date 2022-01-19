<footer class="main-footer">
	<div class="container footer-container d-flex">
		<div class="footer__item">
			<a href="/" class="site-logo d-flex">
				<div class="logo-img">
					<?= $this->yupe->getSiteLogo('png') ?>
				</div>
				<div class="logo-name">
					<div class="logo-title text-uppercase">
					   лидер
					</div>
					<div class="logo-desc text-uppercase">
						компания
					</div>
				</div>
        	</a>
			<div class="small-text link-pc">
				<a href="#">Политика конфиденциальности</a>
			</div>
			<div class="small-text">
				<a href="#">Карта сайта</a>
			</div>
		</div>
		<?php $this->widget('application.modules.page.widgets.PagesNewWidget'); ?>
		<div class="footer__item">
			 <a href="<?= $this->yupe->getPhoneLink($this->yupe->second_phone)?>" class="footer-phone d-block">
                <?= $this->yupe->second_phone?>
            </a>
			 <a href="<?= $this->yupe->getPhoneLink($this->yupe->thrid_phone)?>" class="footer-phone d-block">
                <?= $this->yupe->thrid_phone?>
            </a>
			<a href="mailTo:<?= $this->yupe->email?>" class="footer-mail d-block">
				<span><?= $this->yupe->email?></span>
			</a>
			<div class="footer-adress">
				<?= $this->yupe->address?>
			</div>
			<div class="show-map">
				<span>Показать на карте</span>
			</div>
			<div class="footer-social-widget d-flex">
				<?= $this->yupe->SocialWidget()?>
			</div>
		</div>
	</div>
</footer>
<section class="footer-bottom">
	<div class="container cb d-flex">
		<div class="copyright">
			<?= $this->yupe->copy?>
		</div>
		<a href="https://dcmedia.ru/" target="_blank" class="dcm d-flex">
			<span>Сделано в</span>
			<div class="dcm__img">
				<img
				data-src="<?= $this->mainAssets.'/images/icons/DCMedia.png'?>"
				src="data:image/gif;base64,R0lGODlhiQAwAIAAAP///wAAACH5BAEAAAEALAAAAACJADAAAAJajI+py+0Po5y02ouz3rz7D4biSJbmiabqyrbuC8fyTNf2jef6zvf+DwwKh8Si8YhMKpfMpvMJjUqn1Kr1is1qt9yu9wsOi8fksvmMTqvX7Lb7DY/L5/S6PVMAADs="
				alt="DCMedia">
			</div>
		</a>
	</div>
</section>