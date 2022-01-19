<section class="container services-container">
    <div class="flex-head services-head d-flex">
       <h2 class="page-title">Услуги и сервисы</h2>
       <a href="#" class="all-services-link">
           Смотреть все
       </a>
    </div>
    <div class="services-list d-flex">
        <?php foreach ($models as $key => $model): ?>
            <a class="service__item posrel db skew__box" href="<?= $model->getUrl()?>">
                <div class="service-name abs">
                    <?= $model->name?>
                </div>
                <img
                 src="<?= Yii::app()->getTheme()->getAssetsUrl(). '/images/elements/service.gif'?>"
                 data-src="<?=$model->getImageUrl()?>"
                 alt="<?= $model->name?>"
                 >
                     <div class="service-circle abs d-flex rounded">
                        <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M7.48437 7.48528L7.48438 -3.42285e-08H9.48437L9.48438 7.48528L16.9697 7.48528L16.9697 9.48528L9.48438 9.48528L9.48437 16.9706H7.48438L7.48437 9.48528L-0.000905976 9.48528L-0.000906229 7.48528L7.48437 7.48528Z" fill="white"/>
                        </svg>
                     </div>
                <div class="spinner-border text-success abs" role="status" id="spinner">
                  <span class="visually-hidden">Loading...</span>
                </div>
            </a>
        <?php endforeach ?>
    </div>
</section>