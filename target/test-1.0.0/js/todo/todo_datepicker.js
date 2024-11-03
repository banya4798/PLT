$(function () {

    var datepicker = $('.input__item');

    datepicker.datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeYear: true,
        changeMonth: true,
        showOn: 'both',
        buttonImage: ('https://cdn-icons-png.flaticon.com/512/2838/2838779.png'),
        buttonImageOnly: true,
        showAnim: '',
        onSelect: function () {
            dimDisplay('none'); //hide back layer when date selected
        }
    });

    $('#datepicker').datepicker('setDate', 'today'); // set date as today

  
    // custom datepicker 
    const dateInput = document.querySelector('.input__item'),
          dateIcon = document.querySelector('.ui-datepicker-trigger'),
          calendar = document.querySelector('#ui-datepicker-div');

    // add back layer
    const dim = document.createElement('div');
    dim.classList.add('datepicker-layer');

    calendar.before(dim);


    // back layer show
    dateInput.addEventListener('focus', function () {
        if (calendar.style.display === 'block') {
            dimDisplay('block');
        }
    })
  
   dateIcon.addEventListener('click', function () {
        if (calendar.style.display == 'block') {
            dimDisplay('block');
        }
    })

    //back layer hide
    const layer = document.querySelector('.datepicker-layer');
  
    window.addEventListener('click', function (e) {
        if (calendar.style.display === 'none') {
            layer.style.display = 'none'; 
        }
    });

    // back layer display control
    function dimDisplay(display) {
        layer.style.display = display;
    }
});

