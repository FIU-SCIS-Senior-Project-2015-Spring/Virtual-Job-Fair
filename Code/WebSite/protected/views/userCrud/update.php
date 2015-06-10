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



<h2>Edit User</h2>

<?php
    $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id' => 'user-form',
        'enableAjaxValidation' => false,
        'htmlOptions' => array('class' => 'well'),
    ));
?>



<fieldset>

    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary($model); ?>

    <?php echo $form->textFieldRow($model, 'username', array('maxlength' => 45, 'class' => 'span3')); ?>

    <?php echo $form->textFieldRow($model, 'first_name', array('maxlength' => 45, 'class' => 'span3')); ?>

    <?php echo $form->textFieldRow($model, 'last_name', array('maxlength' => 45, 'class' => 'span3')); ?>

    <?php echo $form->textFieldRow($model, 'email', array('maxlength' => 45, 'class' => 'span3')); ?>
    
    <?php echo $form->textFieldRow($model, 'activated', array('maxlength' => 45, 'class' => 'span3')); ?>
    
    <?php
      /*  echo '<div /div>';
        echo '<div style="float: left;">Activate User:</div>';
        echo '<div style="margin-left: 130px;" class="onoffswitch">';
        echo '<input type="checkbox" name="ActivateSwitch" class="onoffswitch-checkbox" value="' . $model->activated . '" id="activateUserSwitch" checked onclick="toggleActivateUserSwitch()">';
        echo '<label class="onoffswitch-label" for="activateUserSwitch">';
        echo '<span class="onoffswitch-inner"></span>';
        echo '<span class="onoffswitch-switch"></span>';
        echo '</label>';
        echo '</div>';

        // Set the initial state of the button. Works!
        if($model->activated == 0)
            echo '<script> setActivate(false); </script>';*/

    ?>


   




</fieldset>


<div class="form-actions">
    <?php $this->widget('bootstrap.widgets.TbButton', array('type' => 'primary', 'buttonType' => 'submit', 'label' => 'Save')); ?>
    <?php
        $this->widget('bootstrap.widgets.TbButton', array('label' => 'Cancel',
            'htmlOptions' => array(
                'onclick' => 'js:document.location.href="' . Yii::app()->createAbsoluteUrl("userCrud/admin") . '"'
            ),
            )
        );
    ?>
</div>


    <?php $this->endWidget(); ?>
