<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>
<?php $user = User::getCurrentUser(); ?>
<br/><br/>

<div id="error">
    <?php if ($error != '') {?>
	<p style="color:red; margin-left: auto; margin-right: auto; width: 40%;"> <?php echo $error?></p>
	<?php }?>    
</div>
<br/>
<!--Auto margin for the div bellow fixes bug on card #402 (change password fields hidden under the left margin of the page)-->
<div class="form" style="margin-left: auto; margin-right: auto; width: 30%;"> 

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-changePassword-form',
	'enableAjaxValidation'=>false,
)); ?>
	
	
        <div class="row">
		<?php echo $form->labelEx($user,'Old Password'); ?>
		<?php echo CHtml::passwordField('User[password]', ''); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'New Password'); ?>
		<?php echo CHtml::passwordField('User[password1]', ''); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'Retype New Password'); ?>
		<?php echo CHtml::passwordField('User[password2]', ''); ?>
	</div>	
<br/><br/>
        <div class="row buttons">
		<?php echo CHtml::submitButton('Submit', array("class"=>"btn btn-primary")); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->