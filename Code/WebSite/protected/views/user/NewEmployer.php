<?php
/* @var $this UserController */

$this->breadcrumbs=array('User',);

?>

<?php 
    // Check if registration was done by admin.
    if(isset($byAdmin))
    { ?>
        <div id="adminMSG">
            <?php
                echo '<div class="alert alert-success" style="text-align: center;" role="alert">  <h3> Employer, ' . $byAdmin . ', was registered successfully. </h3>   </div>'; 
            ?>
        </div>
    <?php } 
    
    // Check if registration was done by employer.
    else if(isset($byEmployer))
    { ?>
        <div id="userMsg">
            <?php 
                echo '<div class="alert alert-success" style="text-align: center;" role="alert">  <h3> Thank you, ' . $byEmployer . ', for registering with Virtual Job Fair </h3> </div>'; 
                echo '<div class="" style="text-align: center;"> Soon you will receive an email when your account has been verified and activated. </div>';
            ?>
        </div>   
<?php } ?>