<?php
    /* @var $this UserController */
    /* @var $model User */
    /* @var $form CActiveForm */
?>
<?php $user = User::getCurrentUser(); ?>
<br/><br/>

<div id="error">
    <?php if ($error != '')
        { ?>
           <div class="alert alert-danger" style='text-align: center;' role="alert"> <strong> <p><?php echo $error ?> </p> </strong></div> 
 
    <?php } ?>    
</div>


<div id="confirmation">
    <?php if(isset($confirmation))
        { ?>
            <div class="alert alert-success" style='text-align: center;' role="alert"> <strong> <p><?php echo $confirmation ?> </p> </strong></div> 
            
  <?php } ?>
</div>

<br/>
<!--Auto margin for the div bellow fixes bug on card #402 (change password fields hidden under the left margin of the page)-->
<div class="form" style="margin-left: auto; margin-right: auto; width: 30%;"> 

    <?php
        $form = $this->beginWidget('CActiveForm', array(
            'id' => 'user-changePassword-form',
            'enableAjaxValidation' => false,
        ));
    ?>

    <div class="row">
        <?php
            if(!isset($confirmation))
            {
                echo $form->labelEx($user, 'Old Password');
                echo CHtml::passwordField('User[password]', '');
                echo $form->error($model, 'username');
            }
        ?>
    </div>

    <div class="row">
        <?php
            if(!isset($confirmation))
            {
                echo $form->labelEx($model, 'New Password');
                echo CHtml::passwordField('User[password1]', '');
            }
        ?>
    </div>

    <div class="row">
        <?php
            if(!isset($confirmation))
            {
                echo $form->labelEx($model, 'Retype New Password');
                echo CHtml::passwordField('User[password2]', '');
            }
        ?>
    </div>	
    <br/><br/>
    <div class="row buttons">
        <?php
            if(!isset($confirmation))
                echo CHtml::submitButton('Submit', array("class" => "btn btn-primary"));
        ?>
    </div>

<?php $this->endWidget(); ?>

</div><!-- form -->