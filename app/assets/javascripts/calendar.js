$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        contentHeight: 550,
        aspectRatio: 2.4,
        lang: 'ru',
        firstDay: 1,
        header: {
            left: 'prev,next today myCustomButton',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },

        events: '/calendar.json',
        eventAfterRender: function(event, element, view) {
            $(element).css('height','20px');
        },
        displayEventTime: false,

        scrollTime: '15:00:00',

        dayClick: function(date, jsEvent, view) {
            $("#period_commence_datetime_1i").val(date.year());
            $("#period_commence_datetime_2i").val(date.month()+1);
            $("#period_commence_datetime_3i").val(date.date());
            $("#period_commence_datetime_4i").val(moment().hour(19).format("HH"));
            $("#period_commence_datetime_5i").val(moment().minute(0).format("mm"));
            $("#myModal").modal();
        }
    })

});