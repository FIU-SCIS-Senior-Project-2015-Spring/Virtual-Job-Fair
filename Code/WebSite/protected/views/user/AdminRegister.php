<?php
    /* @var $this UserController */
    /* @var $model User */
    /* @var $form CActiveForm */
?>
<br/><br/>
<script>
    (function($) {
        $.fn.characterCounter = function(limit, ptag) {
            return this.filter("textarea, input:text").each(function() {
                var $this = $(this),
                        checkCharacters = function(event) {
                            if((limit - $this.val().length) >= 0) {
                                ptag.text((limit - $this.val().length) + " characters left");
                            } else {
                                ptag.text("0 characters left");
                            }
                            if($this.val().length > limit) {

                                // Trim the string as paste would allow you to make it more than the limit.
                                $this.val($this.val().substring(0, limit))
                                // Cancel the original event
                                event.preventDefault();
                                event.stopPropagation();

                            }
                        };

                $this.keyup(function(event) 
                {
                    // Keys "enumeration"
                    var keys = {
                        BACKSPACE: 8,
                        TAB: 9,
                        LEFT: 37,
                        UP: 38,
                        RIGHT: 39,
                        DOWN: 40
                    };

                    // which normalizes keycode and charcode.
                    switch(event.which) 
                    {
                        case keys.UP:
                        case keys.DOWN:
                        case keys.LEFT:
                        case keys.RIGHT:
                        case keys.TAB:
                            break;
                        default:
                            checkCharacters(event);
                            break;
                    }
                });

                // Handle cut/paste.
                $this.bind("paste cut", function(event) {
                    // Delay so that paste value is captured.
                    setTimeout(function() {
                        checkCharacters(event);
                        event = null;
                    }, 150);
                });
            });
        };
    }(jQuery));


</script>


<h2>Admin Register</h2>
<div class="form">

    <?php
        $form = $this->beginWidget('CActiveForm', array(
            'id' => 'user-AdminRegister-form',
            'enableAjaxValidation' => false,
        ));
    ?>

    <?php
        $model->basicInfo = BasicInfo::model();
    ?>
    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <p style="color:red" id="errors"></p>

    <h4>Personal Info.</h4>
    <div id="regbox">
        <?php echo $form->labelEx($model, 'username'); ?>
        <?php echo $form->textField($model, 'username'); ?>

        <?php echo $form->labelEx($model, 'first_name'); ?>
        <?php echo $form->textField($model, 'first_name'); ?>

        <?php echo $form->labelEx($model, 'last_name'); ?>
        <?php echo $form->textField($model, 'last_name'); ?>

        <?php echo $form->labelEx($model, 'password'); ?>
        <?php echo $form->passwordField($model, 'password', array('maxlength' => 72)); ?>


        <?php
            echo $form->labelEx($model, 'password_repeat');
            echo $form->passwordField($model, 'password_repeat', array('maxlength' => 72));
        ?>	

        <?php 
            echo $form->labelEx($model, 'email'); 
            echo $form->textField($model, 'email'); 
        ?>

        <br/>
        <?php
            echo $form->labelEx($model, 'hide_email', array('style' => 'display:inline-block;!important'));
            echo $form->checkBox($model, 'hide_email');
        ?>

        <?php echo $form->labelEx($model->basicInfo, 'phone'); ?>
        <?php echo $form->textField($model->basicInfo, 'phone'); ?>

        <br/>
        <?php
            $form->labelEx($model->basicInfo, 'hide_phone', array('style' => 'display:inline-block;!important'));

            $model->basicInfo->hide_phone = 1;
            $form->checkBox($model->basicInfo, 'hide_phone');
        ?>

        <br/>

    </div>


</div>
<div style="clear:both"></div>
<br>
<div style="float:left">
    <?php echo CHtml::submitButton('Submit', array("class" => "btn btn-primary")); ?>
</div>

<?php $this->endWidget(); ?>

<script>
    $.MyNamespace = {
        submit: "true"
    };

    $(document).ready(function()
    {
        $("#user-AdminRegister-form").submit(function(e)
        {
            form = e;
            $.ajaxSetup({async: false});

            var response = $.post("/JobFair/index.php/User/verifyAdminRegistration", $("#user-AdminRegister-form").serialize());

            response.done(function(data)
            {
                if(data != "")
                {
                    $("html, body").animate({scrollTop: 0}, "fast");
                    $("#errors").html(data);
                    $.MyNamespace.submit = 'false';
                }
                else
                    $.MyNamespace.submit = 'true';

            });
            if($.MyNamespace.submit == 'false')
                e.preventDefault();

        });
        return;
    });
</script>

</div><!-- form -->