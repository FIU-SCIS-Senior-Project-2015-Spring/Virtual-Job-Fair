<?php
    /* @var $this Controller */
    date_default_timezone_set('America/New_York');
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="language" content="en" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/jquery.jgrowl.css" />
        <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">

            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


                <script src="http://vjs.zencdn.net/c/video.js"></script>

                <title><?php echo CHtml::encode($this->pageTitle); ?></title>

                <?php Yii::app()->bootstrap->register(); ?>

                <style type="text/css">
                    body {
                        padding-top: 60px;
                        padding-bottom: 40px;
                        /*background-image: url("/JobFair/images/imgs/congruent_outline.png");*/
                        background-color: white;
                    }
                    .sidebar-nav {
                        padding: 9px 0;
                        width: 260px;
                    }
                </style>

                <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.jgrowl.js"></script>
                <link rel="shortcut icon" href="/JobFair/images/ico/icon.ico">
                    </head>

                    <body>

                        <?php
                            if (!isset($_GET['keyword']))
                                $_GET['keyword'] = '';

                            $search = '';
                            $profile = '';
                            $home = '';

                            // Check if user is admin.
                            if (User::isCurrentUserAdmin(Yii::app()->user->name))
                                $home = '/combinedLogin/admin';                        

                            // Check if user is a student.
                            else if(User::isCurrentUserStudent(Yii::app()->user->name) || User::isCurrentUserGuestStudent())
                            {
                                $profile = '/profile/view';

                                $home = '/combinedLogin/login';
                                
                            }
                            else
                                $home = '/combinedLogin/login';


                            $this->widget('bootstrap.widgets.TbNavbar', array(
                                'type' => 'primary',
                                'brand' => 'Senior Project Tools Portal',
                                'brandUrl' => '/JobFair/index.php' . $home,
                                'htmlOptions' => array('role' => 'navigation'),
                                'items' => array(
                                    array(
                                        'class' => 'bootstrap.widgets.TbMenu',
                                        'items' => array('',
                                            array('label' => 'Home', 'url' => array('CombinedLogin/login'), 'visible' => !Yii::app()->user->isGuest),                                          
                                        ),
                                    ), $search,
                                    
                                    array(
                                        'class' => 'bootstrap.widgets.TbMenu',
                                        'htmlOptions' => array('class' => 'pull-right'),
                                        
                                        // Multiple login options drop down menu.
                                        'items' => array('',
                                            array('label' => 'Other Login Options', 'url' => '#', 'visible' => Yii::app()->user->isGuest, 
                                                'items' => array(
                                                    array('label' => 'Google Login', 'url' => array('profile/googleAuth'), 'visible' => Yii::app()->user->isGuest),
                                                    )
                                                ),
                                            
                                            
                                            array('label' => '(' . Yii::app()->user->name . ')', 'url' => '#', 'visible' => !Yii::app()->user->isGuest, 'items' => array(
                                                    array('label' => 'Home', 'url' => array('CombinedLogin/login'), 'visible' => !Yii::app()->user->isGuest & !User::isCurrentUserAdmin(Yii::app()->user->name)),
                                                    array('label' => 'Logout (' . Yii::app()->user->name . ')', 'url' => array('/combinedLogin/logout'), 'visible' => !Yii::app()->user->isGuest),
                                                    array('label' => 'Login', 'url' => array('/site/login'), 'visible' => false),
                                                )
                                            ),
                                        ),
                                    ),
                                ),
                            ));
                        ?>

                    <div class="container-fluid" id="page">

                        <?php
                            if (User::isCurrentUserAdmin(Yii::app()->user->name))
                            {
                                echo "<div class=\"row-fluid\"><div class=\"span3\">";
                                echo "<div class=\"well sidebar-nav affix\">";
                                $actionid = $this->getUniqueId() . '/' . $this->getAction()->getId();
                                $this->widget('bootstrap.widgets.TbMenu', array(
                                    'type' => 'list',
                                    'items' => array(
                                        array('label' => 'ADMINISTRATION'),
                                        //   array('label' => 'Home', 'icon' => 'home', 'url' => $this->createUrl('Skillset/admin'), 'active' => in_array($actionid, array('home/adminhome', 'site/error'))),
                                        array('label' => 'Sites', 'icon' => 'globe', 'url' => $this->createUrl('CombinedLogin/admin'), 'active' => in_array($actionid, array('combinedLogin/admin', 'combinedLogin/update', 'combinedLogin/admin'))),
                                        array('label' => 'Add Site', 'icon' => 'plus', 'url' => $this->createUrl('portalSites/addSite'), 'active' => in_array($actionid, array('portalSites/addSite'))),
                                    ),
                                ));
                                echo "</div></div>";

                                echo "<div class=\"span9\">";
                                //  echo $this->getUniqueId() . '<br>';
                                //  echo $this->getAction()->getId();
                                echo $content;
                                echo "</div>";

                                echo "</div>";
                            }
                            else
                                echo $content;
                        ?>

                    </div>    

                    </body>
                    <div style="height: 50px"></div>
                    <div style="position:fixed; text-align:center; width:100%; height:20px; background-color:white;border-top: 1px solid rgb(206, 206, 206); padding:5px; bottom:0px; ">

                        <a target="_blank" href="http://fiu.edu">Florida International University</a> | Virtual Job Fair - Senior Project - Fall 2015
                    </div>

                    </html>

                            <?php
                                if (isset($_GET["notificationRead"]))
                                    Notification::markHasBeenRead($_GET["notificationRead"]);
                            ?>
