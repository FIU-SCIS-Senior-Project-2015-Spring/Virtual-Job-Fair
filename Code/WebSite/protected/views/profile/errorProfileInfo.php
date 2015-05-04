<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
            <h4 class="modal-title">Email Error Message:</h4>
        </div>
        <div class="modal-body">
            
           <?phpif(isset($_POST['User']['email'])) {?>
                <div id="alertBig" class="alert alert-error">
                    <strong>Error!</strong> The Email that you have entered is already in the system!
                </div>
            <?php}?>
        
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


