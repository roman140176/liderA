<div class="container news-home">
    <div class="flex-head news-head d-flex">
       <h2 class="page-title">Пресс-центр</h2>
       <a href="/news" class="all-services-link">
           Все новости
       </a>
    </div>
    <div class="news-home-list d-flex">
        <?php foreach ($models as $key => $model): ?>
            <div class="news__item">
                <div class="news__item-img posrel">
                    <img
                    src="<?= Yii::app()->getTheme()->getAssetsUrl() . '/images/elements/new.gif'?>"
                    data-src="<?= $model->getImageUrl()?>"
                    alt="<?= $model->title?>"
                    >
                    <div class="spinner-border text-success abs" role="status" id="spinner">
                      <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <div class="news__item-datevisits d-flex">
                    <div class="date-box">
                        <?= $model->newsDateRusFormat()?>
                    </div>
                    <div class="view-box d-flex">
                        <div class="view__icon">
                            <svg width="18" height="12" viewBox="0 0 18 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M0.750397 6.00073C0.750397 6.00073 3.7504 0.000732422 9.0004 0.000732422C14.2504 0.000732422 17.2504 6.00073 17.2504 6.00073C17.2504 6.00073 14.2504 12.0007 9.0004 12.0007C3.7504 12.0007 0.750397 6.00073 0.750397 6.00073Z" fill="#89929C"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M9.00155 4.34717C8.08789 4.34717 7.34722 5.08784 7.34722 6.0015C7.34722 6.91515 8.08789 7.65582 9.00155 7.65582C9.91521 7.65582 10.6559 6.91515 10.6559 6.0015C10.6559 5.08784 9.91521 4.34717 9.00155 4.34717ZM5.34722 6.0015C5.34722 3.98327 6.98332 2.34717 9.00155 2.34717C11.0198 2.34717 12.6559 3.98327 12.6559 6.0015C12.6559 8.01972 11.0198 9.65582 9.00155 9.65582C6.98332 9.65582 5.34722 8.01972 5.34722 6.0015Z" fill="white"/>
                            </svg>
                        </div>
                        <div class="view__count">
                            <?= $model->count_view?>
                        </div>
                    </div>
                </div>
                <a href="<?= $model->getUrl()?>" class="news__item-link db">
                    <?= $model->title?>
                </a>
                <div class="news-text">
                    <?= $model->short_text?>
                </div>
                <div class="category-tag">
                    <a href="<?= $model->getCategoryUrl()?>">
                        #<?= $model->category->name?>
                    </a>
                </div>
            </div>
        <?php endforeach ?>
    </div>
</div>

