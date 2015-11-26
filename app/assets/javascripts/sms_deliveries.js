$(document).ready(function() {
    var messageTextField = $('#text-field');
    var count = function(text) {
        var messageInfo = SmsCounter.count(text);
        $("#char-num").text(messageInfo.length);
        $("#sms-count").text(messageInfo.messages);
    };

    var text = messageTextField.val();
    count(text);
    messageTextField.keyup(function () {
        var text = $(this).val();
        count(text);
    });
});