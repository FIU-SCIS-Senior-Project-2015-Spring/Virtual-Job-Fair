<?php
    /* @var $this UserController */

    $this->breadcrumbs = array('User',);

    // Check if registration was done by admin.
    if (!empty($_GET['byAdmin']))
    {
        ?>
        <div id="adminMSG">
            <?php
            echo '<div class="alert alert-success" style="text-align: center;" role="alert">  <h3> Admin ' . $_GET['byAdmin'] . ' was registered successfully. </h3>   </div>';
            ?>
        </div>
        <?php
    } 
    
