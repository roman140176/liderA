let simple = datepicker('#simple',{
    customMonths: [
     'Январь',
     'Февраль',
     'Март',
     'Апрель',
     'Май',
     'Июнь',
     'Июль',
     'Август',
     'Сентябрь',
     'Октябрь',
     'Ноябрь',
     'Декабрь'
     ],
    customDays:[
    'Вс.',
    'Пн.',
    'Вт.',
    'Ср.',
    'Чт.',
    'Пт.',
    'Сб.',
    ],
    overlayPlaceholder:'укажите 4-значный год',
    overlayButton:'Выбрать',
    formatter: (input, date, instance) => {
    const value = date.toLocaleDateString()
    input.value = value.split('/').join('.')
  }
});