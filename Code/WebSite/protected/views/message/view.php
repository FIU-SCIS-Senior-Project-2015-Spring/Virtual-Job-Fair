<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<?php
$js = Yii::app()->clientScript;
$js->registerCoreScript('jquery.ui');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/js/jquery.slimscroll.js');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/jquery.slimscroll.min.js');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/js/tooltipster/js/jquery.tooltipster.min.js');
$js->registerCssFile(Yii::app()->theme->baseUrl . '/js/tooltipster/css/tooltipster.css');
?>

<?php
$this->breadcrumbs = array(
    'Message' => array('/message'),
    'View',
);
?>

<script>

    // Convert the mySQL datetime to a frindly date
    function myDateParser(rawDate) {
        var t = rawDate.split(/[- :]/);
        var d = new Date(t[0], t[1] - 1, t[2], t[3], t[4], t[5]);
        var msgDate = d.toString().split(" ");
        var friendlyDate = msgDate[0] + ", " + msgDate[1] + " " + msgDate[2] + ", " + msgDate[3] + " " + msgDate[4];
        return friendlyDate;
    }
    var monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
    $(function () {

        $(".option-selection").css("cursor", "pointer");
        $("#inbox-option").click(function () {

            $("#delete_messages_forever").hide();
            $("#recover_messages").hide();
            $("#message-content").css("background-color", "#FAFAFA");
            $("#message-content").empty();
            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
            $("#delete_messages").show()
            //$('.tooltipster').tooltipster({position: 'bottom'});

            $.getJSON("/JobFair/index.php/message/getInbox",
                    function (data) {

                        $(".img-spinner").hide();
                        for (var i = 0; i < data.length; i++)
                        {
                            var message = data[i];
                            //var theDate = new Date(Date.parse(message.date));
                            var messageDate = myDateParser(message.date);
                            //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate();
                            $("#message-content").append("<input type='checkbox' class='message_checkbox' id='c_" + message.id
                                    + "'><div class='aMessage' id='" + message.id + "'><span class='message_heading' style = 'width: 265px'>"
                                    + message.FK_sender + "</span>" + "<span class='message_subject' style='margin-left:100px'>"
                                    + message.subject + "</span><span class='messageDate'>" + messageDate + "</span></div>");
                            if (message.been_read == 0)
                            {
                                $("#" + message.id).css("font-weight", "bold");
                            }

                        }


                        $(".aMessage").click(function () {

                            $("#message-content").css("background-color", "#FFFFFF");
                            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader2.gif' alt='Loading'/>");
                            $(".aMessage").remove();
                            $("#delete_messages").hide();
                            $(".message_checkbox").remove();
                            $.getJSON("/JobFair/index.php/message/getMessage?id=" + $(this).attr("id"),
                                    function (theMessage) {

                                        $(".img-spinner").hide();
                                        //var theDate = new Date(Date.parse(theMessage.date))
                                        //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate() + ", " + theDate.getFullYear();
                                        var messageDate = myDateParser(theMessage.date);
                                        $("#message-content").append("<div class='message_Top'><span class='theSubject'>" +
                                                theMessage.subject + "</span></div><img class='userImage' src='" + theMessage.userImage + "' " +
                                                "width='45' height='60' /><a id='sender_link' href='/JobFair/index.php/profile/employer/user/" + theMessage.FK_sender
                                                + "'>" + theMessage.FK_sender + "</a><span id='message_date'>Date: " + messageDate + "</span><a href='/JobFair/index.php/message/send?reply="
                                                + theMessage.id + "' class='reply_image tooltipster' title='Reply'></a>"
                                                + "<div id='trash_" + theMessage.id + "' class='trash_image tooltipster' title='Send to Trash'></div><span id='message_receiver'>To: "
                                                + theMessage.FK_receiver + "</span><div style='clear:both'></div><pre class='messageContent'>" +
                                                theMessage.message + "</pre><div id='message_footer'></div>");
                                        $('.tooltipster').tooltipster({position: 'bottom'});
                                        $(".trash_image").click(function () {

                                            $("#message-content").css("background-color", "#FAFAFA");
                                            $("#message-content").empty();
                                            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                                            var id = [$(this).attr('id').substring(6)];
                                            $.ajax({
                                                type: "POST",
                                                url: "/JobFair/index.php/message/sentToTrash",
                                                data: {messages: id},
                                                success: function () {
                                                    $("#inbox-option").trigger("click");
                                                }
                                            });
                                        });
                                    });
                            $.ajax({url: "/JobFair/index.php/message/setAsRead?id=" + $(this).attr("id")});
                        });
                        //$("input.message_checkbox").prettyCheckable();

                    });
        });
        $("#sent-option").click(function () {

            $("#delete_messages_forever").hide();
            $("#recover_messages").hide();
            $("#message-content").css("background-color", "#FAFAFA");
            $("#message-content").empty();
            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
            $("#delete_messages").show()
            $('.tooltipster').tooltipster({position: 'bottom'});
            $.getJSON("/JobFair/index.php/message/getSent",
                    function (data) {

                        $(".img-spinner").hide();
                        for (var i = 0; i < data.length; i++)
                        {
                            var message = data[i];
                            //var theDate = new Date(Date.parse(message.date));
                            //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate();
                            var messageDate = myDateParser(message.date);
                            $("#message-content").append("<input type='checkbox' class='message_checkbox' id='s_" + message.id
                                    + "'><div class='aMessage' id='" + message.id + "'><span class='message_heading' style = 'width: 295px'>"
                                    + message.FK_receiver + "</span>" + "<span style='margin-left:70px'>"
                                    + message.subject + "</span><span class='messageDate'>" + messageDate + "</span></div>");
                            if (message.been_read == 0)
                            {
                                $("#" + message.id).css("font-weight", "bold");
                            }
                        }

                        $(".aMessage").click(function () {

                            $("#message-content").css("background-color", "#FFFFFF");
                            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader2.gif' alt='Loading'/>");
                            $(".aMessage").remove();
                            $("#delete_messages").hide();
                            $(".message_checkbox").remove();
                            $.getJSON("/JobFair/index.php/message/getMessage?id=" + $(this).attr("id"),
                                    function (theMessage) {

                                        $(".img-spinner").hide();
                                        //var theDate = new Date(Date.parse(theMessage.date))
                                        //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate() + ", " + theDate.getFullYear();
                                        var messageDate = myDateParser(theMessage.date);
                                        $("#message-content").append("<div class='message_Top'><span class='theSubject'>" +
                                                theMessage.subject + "</span></div><img class='userImage' src='" + theMessage.userImage + "' " +
                                                "width='45' height='60' /><a id='sender_link' href='/JobFair/index.php/profile/employer/user/" + theMessage.FK_sender
                                                + "'>" + theMessage.FK_sender + "</a><span id='message_date'>Date: " + messageDate + "</span><a href='/JobFair/index.php/message/send?reply="
                                                + theMessage.id + "&selfReply=1' class='reply_image tooltipster' title='Reply'></a>"
                                                + "<div id='trash_" + theMessage.id + "' class='trash_image tooltipster' title='Send to Trash'></div><span id='message_receiver'>To: " + theMessage.FK_receiver + "</span><div style='clear:both'></div><pre class='messageContent'>" +
                                                theMessage.message + "</pre><div id='message_footer'></div>");
                                        $('.tooltipster').tooltipster({position: 'bottom'});
                                        $(".trash_image").click(function () {

                                            $("#message-content").css("background-color", "#FAFAFA");
                                            $("#message-content").empty();
                                            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                                            var id = [$(this).attr('id').substring(6)];
                                            $.ajax({
                                                type: "POST",
                                                url: "/JobFair/index.php/message/sentToTrash",
                                                data: {messages: id},
                                                success: function () {
                                                    $("#sent-option").trigger("click");
                                                }
                                            });
                                        });
                                    });
                            $.ajax({url: "/JobFair/index.php/message/setAsRead?id=" + $(this).attr("id")});
                        });
                    });
        }); //end of sent option

        $("#message-content").slimScroll({
            height: 'auto',
            railVisible: true,
            alwaysVisible: true,
            size: '10px'
        });
        $("#delete_messages").click(function () {
            var selected = $("input:checked").length;
            if (selected == 0)
                alert("Please select any messages to be sent to the trash");
            else
            {
                var ids = new Array();
                $("input:checked").each(function () {
                    var id = $(this).attr("id").substring(2);
                    ids.push(id);
                });
                $("#message-content").css("background-color", "#FAFAFA");
                $("#message-content").empty();
                $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                $.ajax({
                    type: "POST",
                    url: "/JobFair/index.php/message/sentToTrash",
                    data: {messages: ids},
                    success: function () {
                        $("#inbox-option").trigger("click");
                    }
                });
            }
        });
        $("#delete_messages_forever").click(function () {

            var selected = $("input:checked").length;
            if (selected == 0)
                alert("Please select any messages to be deleted");
            else
            {
                var ids = new Array();
                $("input:checked").each(function () {
                    var id = $(this).attr("id").substring(2);
                    ids.push(id);
                });
                $("#message-content").css("background-color", "#FAFAFA");
                $("#message-content").empty();
                $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                $.ajax({
                    type: "POST",
                    url: "/JobFair/index.php/message/deleteMessages",
                    data: {messages: ids},
                    success: function () {
                        $("#trash-option").trigger("click");
                    }
                });
            }
        });
        $("#recover_messages").click(function () {

            var selected = $("input:checked").length;
            if (selected == 0)
                alert("Please select any messages to recover!");
            else
            {
                var ids = new Array();
                $("input:checked").each(function () {
                    var id = $(this).attr("id").substring(2);
                    ids.push(id);
                });
                $("#message-content").css("background-color", "#FAFAFA");
                $("#message-content").empty();
                $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                $.ajax({
                    type: "POST",
                    url: "/JobFair/index.php/message/recoverMessages",
                    data: {messages: ids},
                    success: function () {
                        $("#inbox-option").trigger("click");
                    }
                });
            }
        });
        $("#trash-option").click(function () {

            $("#message-content").css("background-color", "#FAFAFA");
            $("#message-content").empty();
            $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
            $("#delete_messages").hide();
            $("#delete_messages_forever").show();
            $("#recover_messages").show();
            $('.tooltipster').tooltipster({position: 'bottom'});
            $.getJSON("/JobFair/index.php/message/getTrash",
                    function (data) {
                        $(".img-spinner").hide();
                        var fromSender = "";
                        //Retrieve the user receiving to distinguish messages in the trash box
                        $.getJSON("/JobFair/index.php/message/getReceiver", function (userReceiver) {

                            for (var i = 0; i < data.length; i++)
                            {
                                var message = data[i];
                                //Bug fix                                                    
                                if (userReceiver.username == message.FK_sender)
                                    fromSender = "To: " + message.FK_receiver;
                                else
                                    fromSender = "From: " + message.FK_sender;
                                //End of bug fix

                                //var theDate = new Date(Date.parse(message.date));
                                //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate();
                                var messageDate = myDateParser(message.date);
                                //alert("" + messageDate);
                                $("#message-content").append("<input type='checkbox' class='message_checkbox' id='s_" + message.id
                                        + "'><div class='aMessage' id='" + message.id + "'><span class='message_heading' style = 'width: 300px'>"
                                        + fromSender + "</span>" + "<span style='margin-left:70px'>"
                                        + message.subject + "</span><span class='messageDate'>" + messageDate + "</div>");
                            }


                            $(".aMessage").click(function () {

                                $("#message-content").css("background-color", "#FFFFFF");
                                $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader2.gif' alt='Loading'/>");
                                $(".aMessage").remove();
                                $("#delete_messages_forever").hide();
                                $("#recover_messages").hide();
                                $(".message_checkbox").remove();
                                $.getJSON("/JobFair/index.php/message/getMessage?id=" + $(this).attr("id"),
                                        function (theMessage) {

                                            $(".img-spinner").hide();
                                            //var theDate = new Date(Date.parse(theMessage.date));
                                            //var messageDate = monthNames[theDate.getMonth()] + " " + theDate.getDate() + ", " + c;
                                            var messageDate = myDateParser(theMessage.date);
                                            $("#message-content").append("<div class='message_Top'><span class='theSubject'>" +
                                                    theMessage.subject + "</span></div><img class='userImage' src='" + theMessage.userImage + "' " +
                                                    "width='45' height='60' /><a id='sender_link' href='/JobFair/index.php/profile/employer/user/" + theMessage.FK_sender
                                                    + "'>" + theMessage.FK_sender + "</a><span id='message_date'>Date: " + messageDate + "</span><a href='/JobFair/index.php/message/send?reply="
                                                    + theMessage.id + "' class='reply_image tooltipster' title='Reply'></a>"
                                                    + "<div id='trash_" + theMessage.id + "' class='trash_image3 tooltipster' title='Delete Forever'></div><span id='message_receiver'>To: " + theMessage.FK_receiver + "</span><div style='clear:both'></div><pre class='messageContent'>" +
                                                    theMessage.message + "</pre><div id='message_footer'></div>");
                                            $('.tooltipster').tooltipster({position: 'bottom'});
                                            $(".trash_image3").click(function () {

                                                $("#message-content").css("background-color", "#FAFAFA");
                                                $("#message-content").empty();
                                                $("#message-content").append("<img class='img-spinner' src='/JobFair/images/ico/ajax-loader.gif' alt='Loading'/>");
                                                var id = [$(this).attr('id').substring(6)];
                                                $.ajax({
                                                    type: "POST",
                                                    url: "/JobFair/index.php/message/deleteMessage",
                                                    data: {messages: id},
                                                    success: function () {
                                                        $("#trash-option").trigger("click");
                                                    }
                                                });
                                            });
                                        });
                            });
                        });
                    });
        }); //end of trash-option



    });</script>

<?php if ($target == 'sent') { ?>
    <script>
        $(function () {
            $("#sent-option").trigger("click");
        });</script>
<?php } else if ($target == 'trash') {
    ?>
    <script>
        $(function () {
            $("#trash-option").trigger("click");
        });</script>
<?php } else {
    ?>
    <script>
        $(function () {
            $("#inbox-option").trigger("click");
        });</script>
<?php } ?>

<div class="container">
    <div class="span12">

        <div id="top-nav">
            <span id="messages">Messages</span>
            <div id='delete_messages' class='trash_image2 tooltipster' title='Send to Trash' style='float: right; display: block;'></div>
            <div id='delete_messages_forever' class='trash_image2 tooltipster' title='Delete Forever' style='width:40px; height:30px; text-align: center;'></div>	
            <div id='recover_messages' class='tooltipster' title='Recover Message' style='margin-top: 12px; float:left; display: block; margin-left: 70px'><i class="fa fa-undo fa-lg" style="margin-left: 4px;"></i></div>
        </div>
        <div id="top-nav" class="span8">
            <h4><strong>
                    <span style="margin-left: 270px">From/To</span>
                    <span style="margin-left: 330px">Subject</span>
                    <span style="margin-left: 350px">Date</span>
                </strong>
            </h4>
        </div>

        <div id="wrapper" class="span2">

            <div id="options" class="span2 pull-left">
                <ul class="nav nav-pills nav-stacked divider-vertical" role="navigation">
                    <li id="compose-box" class="active"><a href="/JobFair/index.php/message/send">Compose</a></li>
                    <li id="inbox-option" class="active"><a href="#">Inbox</a></li>
                    <li id ="sent-option" class="active"><a href="#">Sent</a></li>
                    <li id="trash-option" class="active"><a href="#">Trash</a></li>                       
                </ul>
            </div>
            <div id="message-content" class="span8">		                   
            </div>
        </div>
    </div></div>





