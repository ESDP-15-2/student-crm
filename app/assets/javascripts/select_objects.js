$(function () {
    function fetchGroups (groupId) {
        var url = '/select_objects/select_group/' + groupId;
        var $groups = $('#select-group-id');

        $groups.html('');
        $groups.html('<option value="">Выберите группу</option>');
        if (groupId) {
            $.getJSON(url)
                .done(function (groups) {
                    $.each(groups, function (i, group) {
                        $groups.append('<option value="' + group.id + '">' + group.name + '</option>');
                    });
                })
            ;
        }
    }

    function fetchStudents (studentId) {
        var url = '/select_objects/select_students/' + studentId;
        var defaultEl = '<li>Нет данных для отображения</li>';
        $.getJSON(url)
            .done(function (students) {
                var $students = $('#student-list');

                $students.html('');
                if (students.length > 0) {
                    $.each(students, function (i, student) {
                        $students.append('<li><input type="checkbox" name="contact_list[student_ids][]" value="' + student.id + '" /> ' + student.name + '</li>');
                    });
                } else {
                    $students.html(defaultEl);
                }
            })
            .error(function (err) {
                $('#student-list').html(defaultEl);
            })
        ;
    }

    $('#select-course-id').change(function () {
        var $this = $(this);
        fetchGroups($this.val());
        $('#select-group-id').change();
    });

    $('#select-group-id').change(function () {
        var $this = $(this);
        fetchStudents($this.val());
    });

});