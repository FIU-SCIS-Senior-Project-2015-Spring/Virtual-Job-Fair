<?php
    /* @var $this SiteController */
    /* @var $model LoginForm */
    /* @var $form CActiveForm  */

    $this->pageTitle = Yii::app()->name . ' - Login';
    $this->breadcrumbs = array('Login',);
?>


<br>

<div class="form">

    <div style="float:left; ">
        <?php
            // The scrolling image.
            $this->widget('bootstrap.widgets.TbCarousel', array(
                'items' => array(
                    array('image' => '/JobFair/images/imgs/slider4.gif', 'label' => 'Virtual Job Fair', 'caption' => 'Virtual Job Fair is an efficient way to make a connection between employers and job seeking students. Recruiting high quality employees or finding the perfect job is no easy task; Virtual Job Fair provides a simple and efficient solution to this.'),
                    array('image' => '/JobFair/images/imgs/slider5.gif', 'label' => '-Employers-', 'caption' => 'Recruiting is difficult and expensive, especially when you need to send personnel to the universities to find students. Virtual Job Fair allows you to virtually do this. With our Live Video Interview, your personnel can interview the candidates without leaving the office. '),
                    array('image' => '/JobFair/images/imgs/slider.png', 'label' => '-Students-', 'caption' => 'Need a job and do not know where to start? Well start here. Virtual Job Fair allows you to create a profile and showcase your skills and abilities for free. We also match you with current job opening based on your skills.'),
                ),
                'htmlOptions' => array('style' => 'width:570px;'),
            ));
        ?>
    </div>

    <div style="margin-bottom:40px; margin-top: -10px; float:left;margin-left:5%">
        <h2> <img style="height:50px; " src="/JobFair/images/imgs/vjflogo.jpg"/> Virtual Job Fair </h2>
        <h3> <center> Login portal </center> </h3>

        <br><br>
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
                echo $form->textField($model, 'username', array('placeholder' => 'User Name', 'style' => 'margin-left:65px'));

                echo '<br><br>';

                // Password field.
                echo $form->passwordField($model, 'password', array('placeholder' => 'Password', 'style' => 'margin-left:65px'));
                echo '<br><br>';

                echo $form->checkBox($model, 'rememberMe', array('style' => 'float:left; margin-left:65px',));
            ?>

            <p style="float:left; margin-left:5px">Remember Me</p>
            <br>
            <br>
            <div style="float:left">
                <?php
                    $this->widget('bootstrap.widgets.TbButton', array(
                        'buttonType' => 'submit',
                        'type' => 'primary',
                        'label' => 'Login', 'htmlOptions' => array('style' => 'margin-left:65px'),
                    ));
                ?>

            </div>
            <div style="float:left; margin-left: 10px;margin-top: -5px;">
                <a style="float:left;" href= "/JobFair/index.php/site/forgotPassword" >  Forgot Password </a>	
                <div style="clear:both"></div>
                <a style="float:left;" href= "/JobFair/index.php/user/register" > Register  </a>	
            </div>
        </div>

        
    </div>


    <?php $this->endWidget(); ?>



</div>

<br><br><br><br><br>


<div id="altlogin" >
    <p>Students may login with these:</p>

    <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/fiu_cs_login.png');
        echo CHtml::link($image, array('profile/fiuCsSeniorAuth'));
    ?><br><br>

    <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/fiu_login.png');
        echo CHtml::link($image, array('profile/fiuAuth'));
    ?><br><br>

    <?php
        //$image = CHtml::image(Yii::app()->baseUrl. '/images/imgs/GuestEmployer2.png');
        //echo CHtml::link($image, array('user/GuestEmployerAuth'));
        //<br><br>
    ?>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <?php
        $guest = '<button id="guestButton" style="width:100%; height: 36px" class="btn btn-info" name="GuestButton" type="submit"> '
            . '<span> <strong style="font-size:17px"> Guest Login </strong> <i class="fa fa-user pull-left fa-lg" style="font-size:30px; vertical-align: middle;"></i> '
            . '</button>';

        echo CHtml::link($guest, array('user/GuestAuth'));
    ?><br><br>


    <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/google_login.png');
        echo CHtml::link($image, array('profile/googleAuth'));
    ?><br><br>


    <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/linkedIn_login.png');
        echo CHtml::link($image, array('user/auth1'));
    ?><br><br>


</div>