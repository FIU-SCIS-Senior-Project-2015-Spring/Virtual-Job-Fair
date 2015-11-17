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
                                $home = '/home/adminhome';

                            // Check if user is employer.
                            else if (User::isCurrentUserEmployer(Yii::app()->user->name) || User::isCurrentUserGuestEmployer())
                            {
                                $home = '/home/employerhome';

                                $profile = '/profile/viewEmployer';

                                if (!Yii::app()->user->isGuest)
                                {
                                    $search = '<form class="navbar-search pull-left" method="post" action="/JobFair/index.php/home/employersearch" >'
                                        . $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                                            'name' => 'skillkeyword',
                                            'source' => Skillset::getNames(),
                                            'htmlOptions' => array('class' => 'search-query span2', 'placeholder' => 'Search Students by Skill'
                                            ),
                                            ), true
                                        ) .
                                        '<button type="submit" style="background-color:transparent ; border:0"  >
                                    <img src="/JobFair/images/ico/Search-icon.png"  height="25" width="25" style="margin:1px 0 0 5px"></button>
                                    </form>';
                                }
                            }

                            // Check if user is a student.
                            else if(User::isCurrentUserStudent(Yii::app()->user->name) || User::isCurrentUserGuestStudent())
                            {
                                $profile = '/profile/view';

                                $home = '/home/studenthome';

                                if(!Yii::app()->user->isGuest)
                                {
                                    $search = '<form class="navbar-search pull-left" method="get" action="/JobFair/index.php/job/search">'
                                        . $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                                            'name' => 'keyword',
                                            'id' => 'keyword',
                                            'value' => $_GET['keyword'],
                                            'htmlOptions' => array('class' => 'search-query span2',
                                                'style' => 'width: 250px',
                                                'placeholder' => 'Search by Position, Skills, Company, Type'
                                            ),
                                            ), true
                                        ) .
                                        '<button type="submit" style="background-color:transparent ; border:0" >
                                    <img src="/JobFair/images/ico/Search-icon.png"  height="25" width="25" style="margin:1px 0 0 5px"></button>
                                    </form>';
                                }
                            }
                            else
                                $home = '/site/index';

                            $messagePageUrl = '/message';

                            // Edit some of the redirects for the guest account.
                            if (User::isCurrentUserGuestStudent())
                            {
                                $registerUrl = '/user/register?msg=Please register before ';

                                $messagePageUrl = $registerUrl . 'sending messages';
                                $profile = $registerUrl . 'editing your profile';
                            }


                            $this->widget('bootstrap.widgets.TbNavbar', array(
                                'type' => 'primary',
                                'htmlOptions' => array('role' => 'navigation'),
                                'items' => array(
                                    array(
                                        'class' => 'bootstrap.widgets.TbMenu',
                                        'items' => array('',
                                            array('label' => 'Home', 'url' => array($home), 'visible' => !Yii::app()->user->isGuest),
                                            array('label' => 'Register', 'url' => array('/user/register'), 'visible' => Yii::app()->user->isGuest || User::isCurrentUserGuestEmployer() || User::isCurrentUserGuestStudent()),
                                            array('label' => 'Jobs', 'url' => array("/job/home"), 'visible' => !Yii::app()->user->isGuest && !User::isCurrentUserAdmin() && !User::isCurrentUserEmployer()),
                                            array('label' => 'Message', 'url' => array($messagePageUrl), 'visible' => !Yii::app()->user->isGuest),
                                            array('label' => 'Advanced Student Search', 'url' => array("/job/emphome"), 'visible' => User::isCurrentUserEmployer()),
                                            array('label' => 'Senior Project Tools Portal', 'url' => array('combinedLogin/login'), 'visible' => true),
                                        ),
                                    ), $search,
                                    
                                    array(
                                        'class' => 'bootstrap.widgets.TbMenu',
                                        'htmlOptions' => array('class' => 'pull-right'),
                                        
                                        // Multiple login options drop down menu.
                                        'items' => array('',
                                            array('label' => 'Other Login Options', 'url' => '#', 'visible' => Yii::app()->user->isGuest, 
                                                'items' => array(
                                                    array('label' => 'Guest Login', 'url' => array('user/GuestAuth'), 'visible' => Yii::app()->user->isGuest),
                                                    array('label' => 'Google Login', 'url' => array('profile/googleAuth'), 'visible' => Yii::app()->user->isGuest), 
                                                    array('label' => 'FIU Login', 'url' => array('profile/fiuAuth'), 'visible' => Yii::app()->user->isGuest), 
                                                    array('label' => 'FIU CS Login', 'url' => array('profile/fiuCsSeniorAuth'), 'visible' => Yii::app()->user->isGuest), 
                                                    array('label' => 'LinkedIn Login', 'url' => array( 'user/auth1'), 'visible' => Yii::app()->user->isGuest),
                                                    array('label' => 'Senior Project Tools Portal', 'url' => array('combinedLogin/login'), 'visible' => true),
                                                    )
                                                ),
                                            
                                            
                                            array('label' => '(' . Yii::app()->user->name . ')', 'url' => '#', 'visible' => !Yii::app()->user->isGuest, 'items' => array(
                                                    array('label' => 'My Profile', 'url' => array($profile), 'visible' => !Yii::app()->user->isGuest & !User::isCurrentUserAdmin(Yii::app()->user->name)),
                                                    array('label' => 'Merge Accounts', 'visible' => (User::isCurrentUserStudent(Yii::app()->user->name)), 'url' => '/JobFair/index.php/user/MergeAccounts'),
                                                    array('label' => 'Change Password', 'visible' => !Yii::app()->user->isGuest && !User::isCurrentUserGuestEmployer() && !User::isCurrentUserGuestStudent(), 'url' => '/JobFair/index.php/user/ChangePassword'),
                                                    array('label' => 'Senior Project Tools Portal', 'url' => array('combinedLogin/login'), 'visible' => true),
                                                    '----',
                                                    array('label' => 'Logout (' . Yii::app()->user->name . ')', 'url' => array('/site/logout'), 'visible' => !Yii::app()->user->isGuest),
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
                                        array('label' => 'Users', 'icon' => 'user', 'url' => $this->createUrl('UserCrud/admin'), 'active' => in_array($actionid, array('userCrud/admin', 'userCrud/update', 'userCrud/index'))),
                                        array('label' => 'Add Admin', 'icon' => 'plus', 'url' => $this->createUrl('user/createAdmin'), 'active' => in_array($actionid, array('user/createAdmin'))),
                                        array('label' => 'Add Student', 'icon' => 'plus', 'url' => $this->createUrl('user/create'), 'active' => in_array($actionid, array('user/create'))),
                                        array('label' => 'Add Employer', 'icon' => 'plus', 'url' => $this->createUrl('user/CreateEmployer'), 'active' => in_array($actionid, array('user/CreateEmployer'))),
                                        array('label' => 'Website Statistics', 'icon' => 'globe', 'url' => $this->createUrl('userCrud/DashboardCreate'), 'active' => in_array($actionid, array('site/DashboardCreate'))),
                                        array('label' => 'Skills', 'icon' => 'pencil', 'url' => $this->createUrl('Skillset/admin'), 'active' => in_array($actionid, array('skillset/admin', 'skillset/consolidate', 'skillset/create', 'skillset/update', 'skillset/index'))),
                                        array('label' => 'Postings', 'icon' => 'list', 'url' => $this->createUrl('PostingsAdmin/admin'), 'active' => in_array($actionid, array('postingsAdmin/admin', 'postingsAdmin/index'))),
                                        array('label' => 'CAREEPATH API'),
                                        array('label' => 'Authentication', 'icon' => 'lock', 'url' => $this->createUrl('ApiAuth/index'), 'active' => in_array($actionid, array('apiAuth/index', 'apiAuth/home', 'apiAuth/create', 'apiAuth/update'))),
                                        array('label' => 'Import Jobs', 'icon' => 'briefcase', 'url' => $this->createUrl('ApiConfig/home'), 'active' => in_array($actionid, array('apiConfig/home', 'apiConfig/index'))),
                                        array('label' => 'NOTIFICATIONS'),
                                        array('label' => 'Settings', 'icon' => 'cog', 'url' => $this->createUrl('home/notificationAdmin'), 'active' => in_array($actionid, array('home/notificationAdmin'))),
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

                        <a target="_blank" href="http://fiu.edu">Florida International University</a> | Virtual Job Fair - Senior Project - Summer 2015
                    </div>

                    </html>

                            <?php
                                if (isset($_GET["notificationRead"]))
                                    Notification::markHasBeenRead($_GET["notificationRead"]);
                            ?>

