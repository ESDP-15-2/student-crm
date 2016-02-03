$(document).ready(function() {

    $('#calendar').fullCalendar({
        contentHeight: 550,
        aspectRatio: 2.4,
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
        },
        editable: true,
        eventDrop: function(event, delta, revertFunc) {

            alert(event.title + " was dropped on " + event.start.format());

            if (!confirm("Are you sure about this change?")) {
                revertFunc();
            }

        }
    });

    var groups = $('#period_group_id').html();

       $('#period_course_id').change(function() {
        //var value = $(this).val();
        //if (value !== "") {
        //    $("#group-form-block").removeClass("hidden")
        //}
        //else {
        //    $("#group-form-block").addClass("hidden")
        //}
        var course, options;
        course = $("#period_course_id :selected").text();
        options = $(groups).filter("optgroup[label = '" + course + "']").html();
        if (options) {
            $('#period_group_id').html(options);
        } else {
            $('#period_group_id').empty();
        }


           var course_id = $(this).val();
           $.ajax({
               url: "/calendar/subjects_by_course",
               data: {
                   course_id: course_id
               },
               success: function(data) {
                   var result_options = "";
                   for(var i = 0; i<data.length; i++) {
                       result_options += "<option value='" + data[i].id + "'>"+ data[i].theme + "</option>"
                   }
                   $('#period_course_elements_id').html(result_options);
               }

           });

    });

});