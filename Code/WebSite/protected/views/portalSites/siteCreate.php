<?php
/* @var $this CombinedLoginController */
/* @var $model PortalSites */
/* @var $form CActiveForm */
?>

<?php if(!User::isCurrentUserAdmin())
        {
            $this->redirect('/JobFair/index.php/CombinedLogin/login');
        }
 ?>
<br/><br/>
<h2>Add Site</h2>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-siteCreate-form',
	'enableAjaxValidation'=>false//,
        
)); ?>
    <?php $model = PortalSites::model();?>
	
        
	<?php if (isset($_GET['error'])){
		$error = $_GET['error'];	?>
		<p style="color:red;"> <?php echo $error?></p><?php 
	}?>

	
	
	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<p style="color:red" id="errors"></p>
	

	
	<div id="regbox">
	

		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('maxlength'=>50, 'style'=>'width: 300px')); ?>

		<?php echo $form->labelEx($model,'url'); ?>
		<?php echo $form->textField($model,'url',array('maxlength'=>500,'style'=>'width: 450px'));?>
	

		<br/>
               
		
                <div>
		<?php echo CHtml::submitButton('Submit', array("class"=>"btn btn-primary", "onclick"=>"return true;")); ?>
	</div>

<?php $this->endWidget(); ?>
	
	</div>



	<div style="clear:both"></div>
	<br>
	


<script>
$.MyNamespace={
		submit : "true"
};
$(document).ready(function() {
    $("#user-siteCreate-form").submit(function(e) {
        form = e;
        $.ajaxSetup({async:false});
        
        var response = $.post("/JobFair/index.php/PortalSites/verifySiteCreate", $("#user-siteCreate-form").serialize());
        alert('Made it here!');
        response.done(function(data) {
        	if (data != ""){
        		$("html, body").animate({ scrollTop: 0 }, "fast");
        		$("#errors").html(data);
        		$.MyNamespace.submit = 'false';
                        
        	} else {
                        
        		$.MyNamespace.submit = 'true';     
        	}
                
                if ($.MyNamespace.submit == 'true'){
                    window.location.assign("/JobFair/index.php/CombinedLogin/admin");
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


