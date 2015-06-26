<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<?php
$js = Yii::app()->clientScript;
$js->registerCoreScript('jquery.ui');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/js/jquery.slimscroll.js');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/jquery.slimscroll.min.js');
$js->registerScriptFile(Yii::app()->theme->baseUrl . '/js/autocomplete/autocomplete.html.js');
?>

<?php

$this->breadcrumbs = array(
    'Message' => array('/message'),
    'Send',
);
?>

<script>
    
    $.getJSON("/JobFair/index.php/message/getInbox", function (data) {      
        var unreadMsg = 0;
        for (var i = 0; i < data.length; i++)
        {
            var message = data[i];
            if (message.been_read == 0)
            {
                $("#" + message.id).css("font-weight", "bold");
                unreadMsg++;                                
            }                             
        } 
        $("#inbox-badge").text(unreadMsg);
    });

    function validateForm()
    {
        var user = $("#receiver").val();

        if (!user || /^\s*$/.test(user)) {
            alert("'To' field is in the wrong format");
            return false;
        }

        var specialChar1 = 0;
        var specialChar2 = 0;
        var specialChar3 = 0
        for (var i = 0; i < user.length; i++)
        {
            var aChar = user.charAt(i)
            if (aChar == '<')
                specialChar1++;

            if (aChar == '>')
                specialChar2++;

            if (aChar == '"')
                specialChar3++;
        }

        //if (specialChar1 != specialChar2 || (specialChar2 != 0 && user.charAt(user.length - 2) != '>')) {
        // alert("'To' field is in the wrong format");
        // return false; 
        // }

        if ((specialChar3 % 2 != 0) || (specialChar3 >= 2 && specialChar1 == 0) || (specialChar3 >= 2 && user.charAt(0) != '"')) {
            alert("'To' field is in the wrong format");
            return false;
        }

        if (specialChar1 > specialChar3) {
            alert("'To' field is in the wrong format");
            return false;
        }

        return true;
    }




</script>
<?php if ($username != null) { ?>

    <?php if ($model->message == null) { ?>
        <script>
            $(function () {
                $("#theSubject").focus();
            });
        </script>
    <?php } else { ?>

        <script>
            $(function () {

                $("#theMessage").focus();

            });
        </script>


    <?php } ?>


<?php } else { ?>

    <script>
        $(function () {
            $("#receiver").focus();
        });
    </script>
<?php } ?>

    <div class="container">
        <div class="span12">
            <!-- Message Header -->
            <div class="row span12">
                <span id="messages">Messages</span>           
            </div>
           
            <div class="row span12">
                <!-- Left Message menu -->
                <div class="span2">
                    <ul class="nav nav-pills nav-stacked" role="navigation">
                        <li id="compose-box" class="message-btn2"><a href="/JobFair/index.php/message/send"><i class="fa fa-plus-square fa-lg"></i> Compose</a></li>
                        <li id="inbox-option" class="message-btn1"><a href="/JobFair/index.php/message"><i class="fa fa-inbox fa-lg"></i> Inbox <span id="inbox-badge" class="badge pull-right"></span></a></li>
                        <li id ="sent-option" class="message-btn1"><a href="/JobFair/index.php/message?target=sent"><i class="fa fa-share-square-o fa-lg"></i> Sent</a></li>
                        <li id="trash-option" class="message-btn1"><a href="/JobFair/index.php/message?target=trash"><i class="fa fa-trash-o fa-lg"></i> Trash</a></li>                       
                    </ul>                        
                </div>
                <div id="message-content" class="span9">
                    
                    <?php
                        $form = $this->beginWidget('CActiveForm', array('id' => 'Message', 'action' => '/JobFair/index.php/message/send',
                                                    'enableAjaxValidation' => false,'htmlOptions' => array('enctype' => 'multipart/form-data', 'name' => 'send_form','style' => 'margin-left:5%;',
                                                    'onsubmit' => 'return validateForm()'),));
                    ?>
                    <label>To:</label>
                    
                    <?php
                        /* if ($username != null)
                          echo $form->textField($model,'FK_receiver', array('value'=>$username));
                          else
                          echo $form->textField($model,'FK_receiver', array('id'=>'receiver')); */

                        if ($username != null)
                            $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                                'name' => 'receiver',
                                'source' => $users,
                                'value' => $username,
                                'options' => array('html' => true),
                                'htmlOptions' => array('class' => 'span8'),
                                //'select'=>'js: function(event,ui){$("#data").val(ui.item.name);return false;}',
                            ));
                        else
                            $this->widget('MultiComplete', array(
                                'name' => 'receiver',
                                'source' => $users,
                                'splitter' => ',',
                                'options' => array('html' => true),
                                'htmlOptions' => array('class' => 'span8'),
                            ));
                        ?>
                    
                        <?php echo $form->error($model, 'FK_receiver'); ?>
                     
                    <label>Subject:</label>
                    
                        <?php
                            if ($model->message != null)
                                echo $form->textField($model, 'subject', array('id' => 'theSubject',
                                    'value' => "Re: " . $model->subject, 'class' => 'span8'));
                            else
                                echo $form->textField($model, 'subject', array('id' => 'theSubject', 'class' => 'span8'));

                            echo $form->error($model, 'subject');
                        ?>
                        <?php echo $form->textArea($model, 'message', array('id' => 'theMessage', 'rows' => 15,'style'=>'margin-left:0px;','class' => 'span8')); ?>
                     <div class="span8">   
                        <input id="send_button" class="btn-primary pull-right" type="submit" name="yt0" value="Send" />
                    </div>
                        <?php //echo CHtml::submitButton('Send', array('id'=>'send_button'));  ?>
                
                        <?php $this->endWidget(); ?>        
                </div>               
            </div>
           
        </div>        
    </div>
    
