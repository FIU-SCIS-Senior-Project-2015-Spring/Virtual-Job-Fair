<?php
    /* @var $this SiteController */
    /* @var $model LoginForm */
    /* @var $form CActiveForm  */

    $this->pageTitle = Yii::app()->name . ' - ForgotPassword';

    $this->breadcrumbs = array('Login',);
?>

<h1> <center> Password Recovery </center> </h1>
<br><br>

<?php
    // Confirmation message.
    if (!empty($confirmationMsg))
    {
        echo '<div class="alert alert-success" style="text-align:center; width:800px; margin:auto;">' . $confirmationMsg . '</div>';
        echo '<br>';
    }
    else
    {
        // First error message.
        if (!empty($errorMsg))
        {
            echo '<div class="alert alert-danger" style="text-align:center; width:800px; margin:auto;">' . $errorMsg . '</div>';
            echo '<br>';
        }
        ?>
        
        <?php 
            

            $form = $this->beginWidget('CActiveForm', array(
                'id' => 'login-form',
                'enableClientValidation' => true,
                'clientOptions' => array(
                    'validateOnSubmit' => true,
                ),
            ));
            
            // Model validation error message.
            echo $form->errorSummary($userModel,NULL,NULL,array('class'=>'alert alert-error', 'style' => 'text-align:center; width:800px; margin:auto;'));
            echo '<br>';

        ?>


        <p> <center> Please enter your email address: <center> </p>

        <div class="form">

        <div class="">
        <?php
            $form->labelEx($userModel, 'email');
            echo $form->textField($userModel, 'email');
            $form->error($userModel, 'email');
        ?>
            
        </div>

        <br>
        <div class="">
        <?php
            echo CHtml::submitButton('Send Password', array("class" => "btn btn-primary"));
        ?>
        </div>

        <?php $this->endWidget(); ?>
        </div><!-- form -->
        
<?php         
    } 
    ?>

