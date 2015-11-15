<?php
/* @var $this CombinedLoginController */

$this->breadcrumbs=array(
	'PortalLogin'
);
?>

<style>
    body { background-color: #74AFAD; }
    div.login-box       { width: 900px; height: 500px; margin: auto; position: 
                    absolute; top: 0; left: 0; bottom: 0; right: 0; border-radius: 25px; border: 10px solid;}
div.login-box div   { width: 450px; height: 500px; float: left; background-color: white}
</style>

<div class="login-box">
    <div style = "text-align: center">
        <h2>Senior Project Tools Portal</h2>
        <form>
            <strong>Email Address:</strong><br>
            <input type="text" name="email" style="width: 80%; height: 8%" placeholder="Email">
            <br>
            <strong>Password:</strong><br>
            <input type="password" name="password" placeholder="Password" style="width: 80%; height: 8%">
            <br><br>
            <?php
                    $this->widget('bootstrap.widgets.TbButton', array(
                        'buttonType' => 'submit',
                        'type' => 'primary',
                        'label' => 'Login', 'htmlOptions' => array('style' => 'text-align: center'),
                    ));
            ?>
            <h2>or</h2>
            <br><br>
            <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/google_login2.jpg');
        echo CHtml::link($image, array('combinedLogin/googleAuth'));
        ?>
        <br><br>
        </form>
    </div>
    <div></div>
</div>






