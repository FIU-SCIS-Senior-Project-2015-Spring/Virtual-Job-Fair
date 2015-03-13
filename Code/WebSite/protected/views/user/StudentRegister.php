<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>
<script>
    
    //Instead of validating a phone number format, we will just validate the digits
    //in the form NXXNXXXXXX where N is a digit 2-9 and X is a digit 0-9
    function isValidNumbers(phoneNumber) {
        var phoneRegex = /^[2-9]\d{2}[2-9]\d{2}\d{4}$/; //Regular Expression for validaating format
        var re = /\D+/g;
        var digits = phoneNumber.replace(re, "");    //Strip out all but the numbers
        return (digits.match(phoneRegex) !== null);
    }
    
    function isValidLength(phoneNumber) {
        var re = /\D+/g;
        var result = phoneNumber.replace(re, "");
        return (result.length === 10);
    }
    
    function isValidName(name){
        var nameRegex = /^[a-zA-Z ]{2,30}$/;
        return (name.match(nameRegex) !== null);
    }
    
    //This functions address bug on card #336 (Registration form not validating names and phone numbers) 
    //from story card #334 (Bug - Student Registration)
    function validateRegistrationForm(){//This function is from v5.0 and will only validate Name, Last Name & phone
        
            var fName = document.getElementById("User_first_name").value;
            var lName = document.getElementById("User_last_name").value;
            var phone = document.getElementById("BasicInfo_phone").value;
            
            if(!isValidLength(phone)){
                alert('The length of the entered phone number must be 10 characters.');
                return false;
            }
            if(!isValidNumbers(phone)){
                alert('The entered phone number is not a valid.');
                return false;
            }                
            if(!isValidName(fName)){
                alert('The name entered must contains a maximum of 30 a-z characters and spaces only.');
                return false;
            }
            if(!isValidName(lName)){
                alert('The last name entered must contains a maximum of 30 a-z characters and spaces only.');
                return false;
            }
            return true;  
    }
</script>
<br/><br/>
<h2>Student Register</h2>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-StudentRegister-form',
	'enableAjaxValidation'=>false//,
        //'htmlOptions' => array('onsubmit' => 'return validateRegistrationForm();'),
        
)); ?>

	<?php if ($error != '') {?>
		
	<p style="color:red;"> <?php echo $error?></p>
	<?php }?>
	
	<?php if (isset($_GET['error'])){
		$error = $_GET['error'];	?>
		<p style="color:red;"> <?php echo $error?></p><?php 
	}?>

	
	<?php $model->basicInfo = BasicInfo::model();//needed to store phone number?>
	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<p style="color:red" id="errors"></p>
	

	
	<div id="regbox">
	

		<?php echo $form->labelEx($model,'first_name'); ?>
		<?php echo $form->textField($model,'first_name',array( 'style'=>'width: 200px')); ?>

		<?php echo $form->labelEx($model,'last_name'); ?>
		<?php echo $form->textField($model,'last_name',array( 'style'=>'width: 200px'));?>
	
	
	
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->textField($model,'username',array( 'style'=>'width: 200px')); ?>


		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password', array('maxlength'=>72, 'style'=>'width: 200px')); ?>

	

		<?php echo $form->labelEx($model, 'password_repeat'); ?>
		<?php echo $form->passwordField($model, 'password_repeat', 
				array('maxlength'=>72,  'style'=>'width: 200px')); ?>	
	

	
		<?php echo $form->labelEx($model,'email'); ?>
		<?php echo $form->textField($model,'email',array( 'style'=>'width: 200px')); ?>
		
		<?php echo $form->labelEx($model->basicInfo,'phone'); ?>
		<?php echo $form->textField($model->basicInfo,'phone'); ?>
		
		<br/><?php echo $form->labelEx($model->basicInfo,'allowSMS', array('style'=>'display:inline-block;!important')); ?>
		<?php echo $form->checkBox($model->basicInfo,'allowSMS'); ?>
		
			<div>
		<?php echo CHtml::submitButton('Submit', array("class"=>"btn btn-primary", "onclick"=>"return validateRegistrationForm();")); ?>
	</div>

<?php $this->endWidget(); ?>
	
	</div>
	

	
<p class="note" style="margin-top:248px; margin-left:300px;">Register with:</p>
<div id="regbox" style="margin-left: 40px; width:220px!important">

    <!--Author Manuel
making the links dynamic so if the base Url changed the program won not be affected
-->
    <?php
    $image =CHtml::image(Yii::app()->baseUrl. '/images/imgs/fiu_login.png');
    echo CHtml::link($image, array('profile/fiuAuth'));
    ?><br><br>

    <?php
    $image =CHtml::image(Yii::app()->baseUrl. '/images/imgs/linkedIn_login.png');
    echo CHtml::link($image, array('user/auth1'));
    ?><br><br>

    <?php
    $image =CHtml::image(Yii::app()->baseUrl. '/images/imgs/google_login.png');
    echo CHtml::link($image, array('profile/googleAuth'));
    ?><br><br>

	<div style="clear:both"></div>
	<br>
	


<script>
$.MyNamespace={
		submit : "true"
};
$(document).ready(function() {
    $("#user-StudentRegister-form").submit(function(e) {
        form = e;
        $.ajaxSetup({async:false});
        
        var response = $.post("/JobFair/index.php/User/verifyStudentRegistration", $("#user-StudentRegister-form").serialize());

        response.done(function(data) {
        	if (data != ""){
        		$("html, body").animate({ scrollTop: 0 }, "fast");
        		$("#errors").html(data);
        		$.MyNamespace.submit = 'false';
        	} else {
        		$.MyNamespace.submit = 'true';
        	}
        });
		if ($.MyNamespace.submit == 'false'){
			e.preventDefault();
		}
    });
    return;
});
</script>


</div><!-- form -->
