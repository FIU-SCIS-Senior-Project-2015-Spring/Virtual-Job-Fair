<script>
    $(document).ready(function()
    {
        $('#buttonStateful').click(function()
        {
            var btn = $(this);
            btn.button('loading'); // call the loading function
            setTimeout(function()
            {
                btn.button('reset'); // call the reset function
            }, 3000);
        });
    })

    // Toggle button.
    /*function toggleActivateUserSwitch()
     {
     var val = $('#activateUserSwitch').val();
     
     if (val == '1')
     $('#activateUserSwitch').val('0');
     
     
     
     $.post("/JobFair/index.php/UserCrud/toggleActivateButton", {"value": val}, function (data) 
     {
     data = JSON.parse(data);
     if (data["status"] == '0')
     setActivate(false);
     
     else
     setActivate(true);
     
     $("#activateUserSwitch").val(data["status"]);
     });
     }
     
     // Helper method that sets the toggle button.
     function setActivate(setter)
     {            
     $("#activateUserSwitch").prop('checked', setter);   
     }*/



</script>


<div id="confirmation">
    <?php if($confirmation != '')
          {
    ?>
             <div class="alert alert-success" style='text-align: center;' role="alert"> <strong> <p><?php echo $confirmation ?> </p> </strong></div> 
    <?php } ?>
</div>

<?php
    if($confirmation == '')
    {
?>   
        <h2>Edit User</h2>
    <?php
    }
    ?>

<?php
    if ($confirmation == '')
    {
        $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
            'id' => 'user-form', 'enableAjaxValidation' => false,
            'htmlOptions' => array('class' => 'well'), ));
    }
?>


<?php
    if($confirmation == '')
    {
?>
        <fieldset>

            <p class="note">Fields with <span class="required">*</span> are required.</p>

            <?php
                echo $form->errorSummary($model);
                echo $form->textFieldRow($model, 'username', array('maxlength' => 45, 'class' => 'span3'));
                echo $form->textFieldRow($model, 'first_name', array('maxlength' => 45, 'class' => 'span3'));
                echo $form->textFieldRow($model, 'last_name', array('maxlength' => 45, 'class' => 'span3'));
                echo $form->textFieldRow($model, 'email', array('maxlength' => 45, 'class' => 'span3'));
                echo $form->textFieldRow($model, 'activated', array('maxlength' => 1, 'class' => 'span3'));
            ?>

        </fieldset>
        <?php
    }
?>

<?php
    if($confirmation == '')
    {
?>
        <div class="form-actions">
            <?php 
                $this->widget('bootstrap.widgets.TbButton', array('type' => 'primary', 'buttonType' => 'submit', 'label' => 'Save')); 
            
                $this->widget('bootstrap.widgets.TbButton', array('label' => 'Cancel',
                            'htmlOptions' => array(
                                'onclick' => 'js:document.location.href="' . Yii::app()->createAbsoluteUrl("userCrud/admin") . '"'
                                ),
                            )
                );
            ?>
        </div>

<?php
    }
?>
        
<?php
    if($confirmation == '')
        $this->endWidget();
?>
