<?php
/* @var $this CombinedLoginController */

$this->breadcrumbs=array(
	'PortalLogin'
);
?>

<?php if(User::isCurrentUserAdmin())
        {
            $this->redirect('/JobFair/index.php/CombinedLogin/admin');
        }
 ?>

<style>
    div.login-box       { width: 900px; height: 500px; margin: auto; position: 
                    absolute; top: 0; left: 0; bottom: 0; right: 0; border-radius: 25px; border: 10px solid; background-color : white;}
</style>

<div class="login-box" style = "text-align: center">
        <h2>Senior Project Tools Portal</h2>
           <div id="login">

            <?php
                $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
                    'id' => 'login-form',
                    'type' => 'horizontal',
                    'enableClientValidation' => true,
                    'clientOptions' => array(
                        'validateOnSubmit' => true,
                    ),
                ));

                // Error message.
                echo $form->errorSummary($model, 'Fix the following errors:', NULL, array('class' => 'alert alert-error', 'style' => 'text-align:center; width: 100%'));
                echo '<br>';

                // Username field.
                echo $form->textField($model, 'username', array('placeholder' => 'User Name', 'style' => 'width: 105%; height: 110%; margin-left:65px;'));

                echo '<br><br>';

                // Password field.
                echo $form->passwordField($model, 'password', array('placeholder' => 'Password', 'style' => 'width: 105%; height: 110%; margin-left:65px;'));
                echo '<br><br>';

                echo $form->checkBox($model, 'rememberMe', array('style' => 'float:left; margin-left:65px',));
            ?>

            <p style="float:left; margin-left:5px">Remember Me</p>
            <br>
            <br>
            <div>
                <?php
                    $this->widget('bootstrap.widgets.TbButton', array(
                        'buttonType' => 'submit',
                        'type' => 'primary',
                        'label' => 'Login', 'htmlOptions' => array('style' => 'margin-left:65px'),
                    ));
                ?>

            </div>
        </div>
        
        <?php $this->endWidget(); ?>
            <br>
            <br>
            <br>
            <h3>Or you can also sign in with...</h3>
            <br><br>
            <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/google_login2.jpg');
        echo CHtml::link($image, array('combinedLogin/googleAuth'));
        ?>
        <br><br>
</div>






