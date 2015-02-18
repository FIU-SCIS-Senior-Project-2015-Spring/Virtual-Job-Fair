<?php
/**
 * Created by PhpStorm.
 * User: analhernandez
 * Date: 7/24/14
 * Time: 6:05 PM
 */
?>

<script type="text/javascript">

$(document).ready(function()
{
    $('#saveQmodal').modal('show');
});

</script>

<div class="modal hide fade" id="saveQmodal" tabindex="-1">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Save Query Message:</h4>
        </div>
        <div class="modal-body">
            
           
                <div id="alertBig" class="alert alert-error">
                    <strong>Error!</strong> The Zip Code that you have entered does not exist!
                </div>
        
        </div>
         <?php if($user->FK_usertype = 1) { ?>
        <div class="modal-footer">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'buttonType'=>'link',
                'type'=>'primary',
                'label'=>'OK',
                'url'=>'../profile/View'
            )); ?>
        </div>
         <?php }else{ ?>
        <div class="modal-footer">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'buttonType'=>'link',
                'type'=>'primary',
                'label'=>'OK',
                'url'=>'../profile/ViewEmployer'
            )); ?>
        </div>
         <?php } ?>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->

