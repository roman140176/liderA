<div class="catalog-filter">
    <?php $form = $this->beginWidget(
        'bootstrap.widgets.TbActiveForm',
        [
            'action' => ['/store/product/search'],
            'method' => 'GET',
            'htmlOptions' => [
                'class' => 'd-flex posrel serch-product'
                ]
        ]
    ) ?>
        <?= CHtml::textField(
            AttributeFilter::MAIN_SEARCH_QUERY_NAME,
            CHtml::encode(Yii::app()->getRequest()->getQuery(AttributeFilter::MAIN_SEARCH_QUERY_NAME)),
            ['class' => 'form-control','placeholder' => 'Что ищем...']
        ); ?>
            <button type="submit" class="btn-search abs">

                    <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M25.137 23.6742L19.155 17.6922C20.6378 15.8844 21.5316 13.5688 21.5316 11.0449C21.5316 5.25586 16.8343 0.558594 11.0452 0.558594C5.25109 0.558594 0.558899 5.25586 0.558899 11.0449C0.558899 16.834 5.25109 21.5312 11.0452 21.5312C13.5691 21.5312 15.8796 20.6426 17.6874 19.1598L23.6694 25.1367C24.0757 25.543 24.7308 25.543 25.137 25.1367C25.5433 24.7355 25.5433 24.0754 25.137 23.6742ZM11.0452 19.4441C6.4089 19.4441 2.64093 15.6762 2.64093 11.0449C2.64093 6.41367 6.4089 2.64062 11.0452 2.64062C15.6765 2.64062 19.4495 6.41367 19.4495 11.0449C19.4495 15.6762 15.6765 19.4441 11.0452 19.4441Z" fill="white"/>
                    </svg>

            </button>

    <?php $this->endWidget(); ?>
    <a href="#" class="mobile-search d-flex" data-bs-target="#searchProductModal" data-bs-toggle="modal"></a>
</div>
