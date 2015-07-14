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
        var user1 = $("#receiver").val();
        var user2 = $("#toField").val();
        var user = "";        
        if(!user1){                            
            user = user2;        
        }
        if(!user2){                            
            user = user1;        
        } 
        if(!user){ 
            alert("Recipient field cannot be empty. Error Msg0.");
            return false;
        }       
        if(user.charAt(user.length-1) != ','){
            if(user.charAt(user.length-2) != ','){
                alert("The last recipient must end with comma. Error Msg1");
                return false;
            }    
        }        
        var tokens = user.split(",");         
        // Loop thru the To field string
        for (var i = 0; i < tokens.length-1; i++)
        {   
            var q2pos = 0;                  // position of the second quote
            var ltpos = 0;                  // position of the first '<'
            var gtpos = 0;                  // position of the first '>'
            var prevCh = "";
            var qcount = 1;                 // number of quotes
            var ltcount = 0;                // number of '<'
            var gtcount = 0;                // number of '>' 
            
            // Clean the token string for the validation
            tokens[i] = tokens[i].trim();
            //console.log(tokens[i]);
            
            if(tokens[i].charAt(0) != '"'){
                alert("Error Msg2: Each recipient id must start with quote.");
            return false;
            }
            if(tokens[i].charAt(tokens[i].length-1) != '>'){
                alert("Error Msg3: Each recipient alias must end with '>'.");
            return false;
            }
            // Loop thru each recipient string
            for (var j = 0; j < tokens[i].length; j++)
            {  
               //console.log(tokens[i].charAt(j));                
               if(tokens[i].charAt(j) == '"' && j > 0 ){
                    qcount++;
                    if(j>1 && prevCh != " "){
                       q2pos = j; 
                    } else {
                       //console.log("Mmsg3 Q:" + qcount);
                       alert("Msg4: Invalid string format! Check string quotes!");                        
                       return false;
                    }  
                }
                if(qcount > 2){
                    alert("Msg5: Invalid string format! Check recipient quotes."); 
                    return false;
                }
                if(tokens[i].charAt(j) == '<'){
                    if(ltcount <= 1){
                       ltpos = j;
                    }                    
                    ltcount++;
                }
                if(tokens[i].charAt(j) == '>'){
                    if(gtcount <= 1){
                       gtpos = j; 
                    }
                    gtcount++;
                }
                // Check the only one '<' and one '>' exist in the string
                if(ltcount > 1 || gtcount > 1){
                    //console.log("Msg6" + "Quotes" + qcount + ">" + gtcount + "<" + ltcount);
                    alert("Msg6: Invalid string format! Check recipient angle brakets."); 
                    return false;
                }
                // Check the order "__" <__> is valid
                if((q2pos > ltpos || q2pos > gtpos || ltpos > gtpos) && (ltpos != 0 && gtpos != 0)){
                    //console.log("Msg7:" + q2pos + " " + ltpos + " " + gtpos); 
                    alert("Msg7: Invalid string format!"); 
                    return false;
                }               
                prevCh = tokens[i].charAt(j);                      
            }
            // The correct position of for the characters " < 
            if(tokens[i].charAt(q2pos+1) != ' ' || tokens[i].charAt(q2pos+2) != '<' || tokens[i].charAt(q2pos-1) == ' '){
                alert("Msg8: Invalid string format! Check spaces between username and alias.\r Ex.\"username\" <alias>.");
                return false;
            }    
            if(tokens[i].charAt(ltpos-1) != ' ' || tokens[i].charAt(ltpos+1) == ' '){
                 alert("Msg9: Invalid string format! Check spaces between username and alias.\r Ex.\"username\" <alias>.");
                 return false;
            }
            // Check No blank spaces before last '>'
            if(tokens[i].charAt(tokens[i].length-1) == ' ' || tokens[i].charAt(tokens[1]) == ' '){
                 alert("Msg10: No blank spaces before last '>' is allowed.");
                 return false;
            }
            // Check the the recipient does not start with blank space after the first quote
            if(tokens[i].charAt(tokens[1]) == ' '){
                 alert("Msg11: No blank spaces after the first quote is allowed.");
                 return false;
            }
            // Check the number of special character " < > in the strings 
            if (qcount != 2 || ltcount != 1 || gtcount != 1){
                alert("Msg12: Invalid string format! Uneven number of quotes or angle brakets.");
                return false;
            }
            // console.log("Msg10: Invalid string format! Uneven number of quotes or angle brakets." + qcount + ltcount + gtcount);
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
            <div id="top-nav">
                <span id="messages" style="margin-bottom: 9px;" >Messages</span>
            </div>
            
            <div id="top-nav" class="span8" style="margin-bottom: 15px;">
            <h4> <strong>
                    <span style="margin-left: 330px"></span>
                    <span style="margin-left: -70px"> Compose Message: </span>
                    <span style="margin-left: 350px"></span>
                </strong>
            </h4>
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

                       /* if ($username != null)
                            $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                                'name' => 'receiver',
                                'source' => $users,
                                'value' => $username,
                                'options' => array('html' => true),
                                'htmlOptions' => array('class' => 'span8'),
                                //'select'=>'js: function(event,ui){$("#data").val(ui.item.name);return false;}',
                            ));
                        else */
                            
                        if($username != NULL){
                            $this->widget('MultiComplete', array(
                                'id' => 'toField',
                                'name' => 'receiver',
                                'source' => $users,
                                'splitter' => ',',
                                'options' => array('html' => true),
                                'htmlOptions' => array('class' => 'span8'),
                            ));
                            echo '<input id="recipientOne" type="hidden" value="'.htmlentities($username).'">';
                        } else {                           
                            $this->widget('MultiComplete', array(
                                'name' => 'receiver',
                                'source' => $users,
                                'splitter' => ',',
                                'options' => array('html' => true),
                                'htmlOptions' => array('class' => 'span8'),
                            ));
                        }
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
  
<script>
    
    // Set the first recipient if it comes from a request
    function setFirstRecipient() {
        var recip = document.getElementById('toField');
        var recip1 = document.getElementById('recipientOne');
        recip.value = recip1.value;
    };
    
    $(document).ready(function () {
        if(document.getElementById('toField') != null){
            setFirstRecipient();
        }
        
    });
</script>
