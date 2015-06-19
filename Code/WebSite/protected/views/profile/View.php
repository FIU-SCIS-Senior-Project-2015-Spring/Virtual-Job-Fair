<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<?php
    /* this ProfileController */

    require_once Yii::app()->basePath . '/youtube_subsystem/YouTubeManager.php';

    $this->breadcrumbs = array('Profile' => array('/profile'),'View',);
    

?>



<!--
<head>
<link rel="stylesheet" type="text/css" href="/css/ProgressBar.css">
</head> -->


<div class="form">
    <script src="/JobFair/themes/bootstrap/js/jquery.bpopup-0.8.0.min.js"></script>
    <script type="text/javascript">
        //for the video tutorials
        $(function() {
            $('div.one')
                    .css("cursor", "pointer")
                    .click(function() {
                        $(this).siblings('.child-' + this.id).toggle('slow');
                    });
            $('div[class^=child-]').hide();
        });

    </script>

    <script type="text/javascript">
        function Checkfiles()
        {
            var fup = document.getElementById('Resume_resume');
            var fileName = fup.value;
            var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

            //        var resume = document.getElementById("Resume_resume");
            //        
            //        if(/^\w+$/.test(resume)){
            //            alert('Document name must ONLY contains letters, numbers and spaces.\n Please rename your resume and upload again!');
            //            return false;
            //        }
            if(ext == "pdf" || ext == "PDF")
            {
                return true;
            }
            else
            {
                alert("Upload PDF files only");
                return false;
            }

        }
    </script>


    <script>
        //    
        $(document).ready(function() {
            var i = 1;

            //Validates Email is a regular expression in the form xxxx@xxxxx.xxxx as per Regex below
            function validateEmail(sEmail) {
                var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/; //Regular Expression
                if(filter.test(sEmail)) {
                    return true;
                }
                else {
                    return false;
                }
            }

            //Enables the Form fields for editing
            function enableBasicInfo() {
                $("#BasicInfo_about_me").attr("disabled", false);
                $("#User_email").attr("disabled", false);
                $("#BasicInfo_phone").attr("disabled", false);
                $("#BasicInfo_city").attr("disabled", false);
                $("#BasicInfo_state").attr("disabled", false);
                $("#BasicInfo_zip_code").attr("disabled", false);
                $("#edit").attr("name", "yt0");
                $("#edit img").attr("src", "/JobFair/images/ico/done.gif");
                $("#edit").attr("onclick", "$(this).closest('form').submit(); return false;");
            }

            $("#saveSkills").hide();
            // $("#saveInterest").hide();
            $("#edit").click(function(e) {
                if($("#BasicInfo_about_me").is(":disabled") && $("#User_email").is(":disabled")
                        && $("#BasicInfo_phone").is(":disabled") && $("#BasicInfo_city").is(":disabled")
                        && $("#BasicInfo_state").is(":disabled") && $("#BasicInfo_zip_code").is(":disabled")) {
                    $("#BasicInfo_about_me").attr("disabled", false);
                    $("#User_email").attr("disabled", false);
                    $("#BasicInfo_phone").attr("disabled", false);
                    $("#BasicInfo_city").attr("disabled", false);
                    $("#BasicInfo_state").attr("disabled", false);
                    $("#BasicInfo_zip_code").attr("disabled", false);
                    $("#edit").attr("name", "yt0");
                    $("#edit img").attr("src", "/JobFair/images/ico/done.gif");
                    $("#edit").attr("onclick", "$(this).closest('form').submit(); return false;");
                } 
                else {
                    //Fixes Bug on card #359 (Allowing a blank email address for the user profile)
                    var sEmail = $('#User_email').val();
                    if($.trim(sEmail).length == 0) { //Email can't be left blank
                        alert('The email field is mandatory.');
                        e.preventDefault();
                    }
                    else {
                        if(validateEmail(sEmail)) {//Validate email against Regex
                            $(this).closest('form').submit();
                        }
                        else {
                            alert('Invalid email format.');
                            e.preventDefault();
                        }
                    }

                    enableBasicInfo();
                    //$(this).closest('form').submit();
                }
            });

            $("#sortable").sortable({
                change: function() {
                    $("#saveSkills").show();
                }
            });

            $("#saveSkills").click(function(e) {
                $(this).closest('form').submit();
            });

            $("#saveInterest").click(function(e) {
                $(this).closest('form').submit();
            });

            $("#editEducation").click(function(e) {

                if($('#Education_name').val() == "") {
                    alert("School Name Cannot be blank");
                    return;
                }
                $(this).closest('form').submit();

            });

            $("#editExperience").click(function(e) {
                $(this).closest('form').submit();
            });

            $("#addskill").click(function(e) {
                if($('#addskillname').val() == "") {
                    alert("Skill was left empty");
                    return;
                }
                
                $.get("/JobFair/index.php/profile/getskill?name=" + encodeURIComponent($('#addskillname').val()), function(data, status) {
                    
                    $("#skills ul").append('<li id="newskill' + i + '"><span class="skilldrag">' + $('#addskillname').val() +
                            "<input type='hidden' name='Skill[]' value='" + data + "' /></span>" +
                            '<a class="deletenewskill" id="newskill' + i + '"><img src="/JobFair/images/ico/del.gif"/></a></li>');
                    $("#addskillname").val("");
                    i++;
                    $("#ui-id-1").hide();
                });
                $("#saveSkills").show();

            });
            $(document).delegate('.deleteskill', 'click', function() {
                $("#" + this.id).remove();
                $("#saveSkills").show();
            });

            $('#addskillname').bind("enterKey", function(e) {
                $("#addskill").click();
            });
            $('#addskillname').keydown(function(e) {
                if(e.keyCode == 13)
                {
                    e.preventDefault();
                }
            });
            $('#addskillname').keyup(function(e) {
                if(e.keyCode == 13)
                {
                    e.preventDefault();
                    $(this).trigger("enterKey");
                }
            });
        });

        $(document).delegate('.deletenewskill', 'click', function() {
            $("#" + this.id).remove();

        });

        // Helper function to get the image extension.
        function endWith(str, suffix) 
        {
            return str.indexOf(suffix, str.length - suffix.length) !== -1;
        }

        // Code for profile image upload.
        function uploadpic() 
        {
            document.getElementById("User_image_url").click();
            document.getElementById("User_image_url").onchange = function() 
            {
                var imageExt = document.getElementById("User_image_url").value;
                
                if(endWith(imageExt, 'JPG') || endWith(imageExt, 'jpg') || endWith(imageExt, 'PNG') || endWith(imageExt, 'png'))
                    document.getElementById("user-uploadPicture-form").submit();
               
                else
                    alert('Image must be in JPG or PNG format');
            }
        }

       
        function uploadresume() 
        {

            document.getElementById("Resume_resume").click();
            document.getElementById("Resume_resume").onchange = function() 
            {
                if(endWith(document.getElementById("Resume_resume").value, 'pdf')) 
                {
                    document.getElementById("user-uploadResume-form").submit();
                }
                else
                {
                    alert('Document must be in PDF format');
                }
            }
        }

        /*
         Rene: This function has been deprecated with version v6.
         
         function uploadvideo(){
         document.getElementById("VideoResume_videoresume").click();
         document.getElementById("VideoResume_videoresume").onchange = function() {
         if (endWith(document.getElementById("VideoResume_videoresume").value, 'MP4') 
         || endWith(document.getElementById("VideoResume_videoresume").value, 'MOV') 				
         || endWith(document.getElementById("VideoResume_videoresume").value, 'mp4')
         || endWith(document.getElementById("VideoResume_videoresume").value, 'mov')){
         document.getElementById("user-uploadVideo-form").submit();
         } else {
         alert('Video Resume must be in mov or mp4 format');
         }	
         }
         }*/

        function toggleJobMatching() 
        {
            var val = $('#myonoffswitch').val();
            if(val == '1')
            {
                $('#myonoffswitch').val('0');
            }
            else
            {
                $('#myonoffswitch').val('1');
            }
            $.get("/JobFair/index.php/user/toggleEmailMatch", {"value": val}, function(data) {
                data = JSON.parse(data);
                if(data["status"] == '0')
                {
                    $("#myonoffswitch").prop('checked', false);
                }
                else
                {
                    $("#myonoffswitch").prop('checked', true);
                }
                $("#user_lastmodified").html(data["username"]);
                $("#user_lastmodifieddate").html(data["last_modified"]);
                $("#myonoffswitch").val(data["status"]);
            });
        }

        function toggleLookingForJob() {
            var val = $('#myonoffswitch_1').val();
            if(val == '1')
            {
                var jm = $('#myonoffswitch').val();
                if(jm == '1')
                {
                    toggleJobMatching();
                }
                $('#myonoffswitch_1').val('0');
            }
            else
            {
                $('#myonoffswitch_1').val('1');
            }
            $.get("/JobFair/index.php/user/toggleLookingForJob", {"value": val}, function(data) {
                data = JSON.parse(data);
                if(data["status"] == '0')
                {
                    $("#myonoffswitch_1").prop('checked', false);
                }
                else
                {
                    $("#myonoffswitch_1").prop('checked', true);
                }
                $("#myonoffswitch_1").val(data["status"]);
            });
        }

        /*
         * Handle the tuggle button for the publication of the video.
         */
        function toggleVideoPublishing()
        {
            var val = $('#publishVideoSwitch').val();

            if(val == '1')
                $('#publishVideoSwitch').val('0');

            else
                $('#publishVideoSwitch').val('1');

            $.get("/JobFair/index.php/user/togglePublishedVideo", {"value": val}, function(data)
            {
                data = JSON.parse(data);
                if(data["status"] == '0')
                    setPublish(false);

                else
                    setPublish(true);

                $("#publishVideoSwitch").val(data["status"]);
            });
        }

        // Helper method that sets the toggle button.
        function setPublish(setter)
        {
            $("#publishVideoSwitch").prop('checked', setter);
        }


    </script>




    <div id="fullcontent">
        <div id="basicInfo" style="float: left">
            <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'user-uploadPicture-form', 'action' => '/JobFair/index.php/Profile/uploadImage',
                    'enableAjaxValidation' => false,
                    'htmlOptions' => array('enctype' => 'multipart/form-data',),
                ));
            ?>
            
            <?php
                $hasCompletedSkill = 84;
                $hasCompletedBooks = 15;
                $maximumPoints = 100;
                $percentage = ($hasCompletedSkill + $hasCompletedBooks) * $maximumPoints / 100;

                /* echo "
                  <div style='width:100px; background-color:white; height:30px; border:1px solid #000;'>
                  <div style='width:".$percentage."px; background-color:green; height:30px;'></div>
                  </div>"; */
            ?>



            <div style="clear:both"></div>

            <div  id="profileImage" style="overflow-style: auto; float: left">
                <div id="upload">
                    <img style="width:200px; height:215px; float: left" src="<?php echo $user->image_url ?>" />
                </div>
                <a id="uploadlink" href="#" onclick="uploadpic()"><img style="margin-top: 5px;" src='/JobFair/images/ico/add.gif' />Upload Image</a>

                <?php echo CHtml::activeFileField($user, 'image_url', array('style' => 'display: none;')); ?>  
            
                <br>
                <br>
                <?php 
                    // Rene: Profile Completion Progress bar graph.
                    echo '<div>Profile Completion Graph</div>';
                    echo '<div id="box" span class="progress progress-success progress-striped active"> <div class="bar" style="width:' . $profileCompStatus . '%' . '"> <span class="sr-only">' . $profileCompStatus . '%' . '</span>  </div> </div>';
                    $pending = explode(",", $incompleteComponents);                    
                    
                    echo '<div id="incomplete-box"><ul>';
                    
                    foreach ($pending as $key=>$value)             
                        echo '<li>'.$value.'<i class="fa fa-exclamation-circle pull-right"></i></li>';                        
                   
                    echo '</ul></div>';

                    ?> 
            </div>
            
            <script>
                // Toggle for the pending notice of the profile completion graph.
                $("#box").hover(function()
                {
                    $("#incomplete-box:contains('Profile Completed!')").css("color","#14BA14").css("background", "white");                    
                    $("#incomplete-box").toggle();
                });

            </script>
                
                
            <?php $this->endWidget(); ?>
            
            <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'user-EditStudent-form', 'action' => '/JobFair/index.php/Profile/EditBasicInfo',
                    'enableAjaxValidation' => false,
                    'htmlOptions' => array('enctype' => 'multipart/form-data'),
                ));
            ?>

            <div id="insidebasicinfo" style="float: right">
                <name style="float:left; width:auto"><?php echo $user->first_name . " " . $user->last_name ?></name>

                <aboutme>
                    <?php echo $form->textArea($user->basicInfo, 'about_me', array('rows' => 3, 'cols' => 75, 'border' => 0, 'class' => 'ta', 'disabled' => 'true')); ?>
                </aboutme>
                <br>
                <?php $userEmail = $user->email; ?>
                <lab>EMAIL:</lab> <?php echo $form->textField($user, 'email', array('class' => 'tb5', 'disabled' => 'true')); ?>
                <lab>PHONE:</lab> <?php echo $form->textField($user->basicInfo, 'phone', array('class' => 'tb5', 'disabled' => 'true')); ?>
                <lab>LOCATION:</lab> <?php echo $form->textField($user->basicInfo, 'city', array('class' => 'tb5', 'disabled' => 'true')); ?>
                <lab>STATE:</lab> <?php echo $form->textField($user->basicInfo, 'state', array('class' => 'tb5', 'disabled' => 'true')); ?>
                <lab>ZIP CODE:</lab> <?php echo $form->textField($user->basicInfo, 'zip_code', array('class' => 'tb5', 'disabled' => 'true')); ?>

            </div>
            <div style="clear:both"></div>

            <p><a style="float: left; margin-left:230px; width:80px" href="#" id="edit" class="editbox"><img src='/JobFair/images/ico/editButton.gif'/> Edit Info.</a></p>

        </div> <!--  END BASIC INFO -->

        <div style="clear:both"></div>
        <?php $this->endWidget(); ?>
        <hr>

        <div id="leftside">

            <div style="clear:both"></div>

            <div id="menutools">
                <div class="titlebox">SETTINGS</div><br><br>
                <?php
                    $checked = $checked_lfj = '';
                    $job_notif = null;
                    $looking_for_job = null;
                    if (isset($user['looking_for_job']))
                    {
                        $looking_for_job = $user->looking_for_job;
                        if ($user->looking_for_job == '1')
                        {
                            $checked_lfj = 'checked';
                        }
                    }
                    if (isset($user['job_notification']))
                    {
                        $job_notif = $user->job_notification;
                        if ($user->job_notification == '1')
                        {
                            $checked = 'checked';
                        }
                    }
                ?>
                <div style="overflow: hidden;">
                    <div style="float: left;">Email Jobs Notifications:</div>
                    <div style="margin-left: 130px;" class="onoffswitch">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" value='<?php echo $job_notif; ?>' id="myonoffswitch" <?php echo $checked; ?> onclick="toggleJobMatching()">
                        <label class="onoffswitch-label" for="myonoffswitch">
                            <span class="onoffswitch-inner"></span>
                            <span class="onoffswitch-switch"></span>
                        </label>
                    </div>
                </div>
                <div style="overflow: hidden;">
                    <div style="float: left;">Looking For Jobs:</div>
                    <div style="margin-left: 130px;" class="onoffswitch">
                        <input type="checkbox" name="myonoffswitch_1" class="onoffswitch-checkbox" value='<?php echo $looking_for_job; ?>' id="myonoffswitch_1" <?php echo $checked_lfj; ?> onclick="toggleLookingForJob()">
                        <label class="onoffswitch-label" for="myonoffswitch_1">
                            <span class="onoffswitch-inner"></span>
                            <span class="onoffswitch-switch"></span>
                        </label>
                    </div>
                </div>
                <hr>

                <!-- Saved Query Profile Search-->
                <h5> Queries Preferences</h5>
                <form method="GET" id="interestForm" action="/JobFair/index.php/profile/saveinterest">
                    <div style= "text-align:left; clear:both" >
                        <p>Select queries to search for jobs</p>

                        <div style= "text-align:left;">
                            <?php
                                foreach ($saveQ as $query)
                                {
                                    ?>         
                                    <?php
                                    if ($query['active'] == '1')
                                    {
                                        ?>
                                        <div class="checkbox">
                                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1" checked>
                                            <strong> <?php echo ($query['query_tag']) . ":"; ?></strong> <?php echo ($query['query']); ?>
                                            <del><a href="/JobFair/index.php/profile/deleteinterest?id=<?php echo $query->id ?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                                        </div>
                                    <?php
                                    }
                                    else
                                    {
                                        ?>
                                        <div class="checkbox">
                                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1">
                                            <strong> <?php echo ($query['query_tag']) . ":"; ?></strong> <?php echo ($query['query']); ?>
                                            <del><a href="/JobFair/index.php/profile/deleteinterest?id=<?php echo $query->id ?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                                        </div>
                                    <?php } ?>
    <?php } ?>
                        </div>
                        <hr>
                        <p>Select email frequency</p>
                        <?php
                            $date = $user->job_int_date;

                            $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                                'name' => 'day',
                                'id' => 'day',
                                'value' => $date,
                                'htmlOptions' => array('value' => $date, 'placeholder' => 'put number ',
                                    'style' => 'width: 150px;'),));
                        ?>

                    </div>
                    <?php
                        $this->widget('bootstrap.widgets.TbButton', array(
                            'label' => 'Save',
                            'type' => 'primary',
                            'htmlOptions' => array(
                                'data-toggle' => 'modal',
                                'data-target' => '#myModal',
                                'id' => "saveInterest",
                                'style' => "margin-top: 5px; margin-bottom: 5px;width: 120px;",
                            ),
                        ));
                    ?>
                </form>

            </div>

            <div id="menutools">
                <div class="titlebox">DOCUMENTS</div><br><br>
                <p><a href="#" id="editResume" class="editbox"><img src='/JobFair/images/ico/add.gif' onclick="uploadresume()"/></a></p>


                <?php
                    $form = $this->beginWidget('CActiveForm', array(
                        'id' => 'user-uploadResume-form', 'action' => '/JobFair/index.php/Profile/uploadResume',
                        'enableAjaxValidation' => false,
                        'htmlOptions' => array('enctype' => 'multipart/form-data', 'onchange' => 'return Checkfiles();',),
                    ));

                    echo CHtml::activeFileField($resume, 'resume', array('style' => 'display:none;'));
                    if (isset($resume->resume))
                    {
                        $resumeURL = $resume->resume; // This address the bug in card #354 giving the url for the resume file
                        echo CHtml::link(CHtml::encode('Resume'), $resumeURL/* $resume->resume */, array('target' => '_blank', 'style' => 'float:left'));
                    }
                    else
                        echo 'Upload a PDF resume!';

                    $this->endWidget();
                ?> 

                <br>
                <hr>

                <?php ?>
                </php>

                <?php
                    // YouTube Code.

                    $uploadButtonText = "Upload Video Resume";

                    // Check if the Video Resume path exists. 
                    if (isset($videoresume->video_path) || !empty($videoresume->video_path))
                    {
                        // Change the button text.
                        $uploadButtonText = "Upload New Video Resume";

                        // Rene: New static iframe: Show an iframe of the video.
                        echo YouTubeHandler::getVideoFrameV2($videoresume->video_path, '100%', '100%');

                        // Div for Video Resume toggle button.
                        echo '<div style="margin-left: 130px;" class="onoffswitch">';
                        echo '<input type="checkbox" name="Videoonoffswitch" class="onoffswitch-checkbox" value="' . $videoresume->publish_video . '" id="publishVideoSwitch" checked onclick="toggleVideoPublishing()">';
                        echo '<label class="onoffswitch-label" for="publishVideoSwitch">';
                        echo '<span class="onoffswitch-inner"></span>';
                        echo '<span class="onoffswitch-switch"></span>';
                        echo '</label>';
                        echo '</div>';

                        // Set the initial state of the button if there needs to be a change.
                        if ($videoresume->publish_video == 0)
                        {
                            echo '<script> setPublish(false); </script>';
                        }
                    }

                    // else // Display the upload button.
                    {
                        ?>  
                        <!-- YouTube video upload. -->

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#submitVideoResume-Modal">
                            <?php echo $uploadButtonText; ?>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="submitVideoResume-Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Upload Video Resume</h4>
                                    </div>
                                    <div class="modal-body">  
                                        <div>

                                            <!--
                                            Video upload form.
                                            Rene
                                            -->
                                            <form action="<?php echo $response ?>?nexturl=<?php echo $nexturl ?>"
                                                  method="post" enctype="multipart/form-data" onsubmit="return checkForFile();">
                                                <input id = "file" name="file" type="file" style="border:none;"/>

                                                <div id="errMsg" style="display:none;color:red">
                                                    You need to specify a valid file.
                                                </div>

                                                <input name="token" type="hidden" value="<?php echo $token ?>"/>

                                                <?php
                                                // Parse the URL after the video has been submitted to YouTube.
                                                $actual_link = 'http' . (isset($_SERVER['HTTPS']) ? 's' : '') . "://$_SERVER[HTTP_HOST]/$_SERVER[REQUEST_URI]";
                                                $url = $actual_link;
                                                parse_str($url, $videoID);


                                                // Check if the parsing worked, ie, we have the videoID.
                                                if (!empty($videoID['id']))
                                                {
                                                    // Check if there is a previous video resume that needs to be removed.
                                                    if (isset($videoresume->video_path))
                                                    {
                                                        $yHandler = new YouTubeHandler();
                                                        $yHandler->deleteVideo($videoresume);
                                                    }

                                                    // Save the video to the model VideoResume
                                                    $videoresume->id = $user->id;
                                                    $videoresume->video_path = $videoID['id'];
                                                    $videoresume->save(true);

                                                    $this->redirect('/JobFair/index.php/profile/view');
                                                }
                                                ?>
                                        </div>
                                    </div>              
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="submit" name="video_uploaded" class="btn btn-primary" value="Upload Video File">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>

                    <?php } // end of else. ?>


                <?php
                    /*
                      Rene: This code has been depricated as of version v6.

                      $form = $this->beginWidget('CActiveForm', array(
                      'id'=>'user-uploadVideo-form', 'action'=> '/JobFair/index.php/Profile/uploadVideo',
                      'enableAjaxValidation'=>false,
                      'htmlOptions' => array('enctype' => 'multipart/form-data',),
                      ));

                      echo CHtml::activeFileField($videoresume, 'videoresume', array('style'=>'display:none;'));
                      if (isset($videoresume->video_path)){
                      $videoURL = $videoresume->video_path; */
                    //echo CHtml::link(CHtml::encode('VideoResume'), $videoURL /*$videoresume->video_path*/, array('target'=>'_blank', 'style' =>'float:left'));
                    /* } else {
                      echo 'Upload a video resume! MP4 or MOV format';
                      }

                      $this->endWidget();

                     */
                ?> 
            </div>
        </div> <!--  END LEFT SIDE -->


        <div id="subcontent">
            <div style=clear:both></div>

            <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'user-EditStudent-form', 'action' => '/JobFair/index.php/Profile/addEducation',
                    'enableAjaxValidation' => false,
                    'htmlOptions' => array('enctype' => 'multipart/form-data',),
                ));
            ?>

            <div id="education">
                <div class="titlebox">EDUCATION</div>	

                <div style=clear:both></div>
                <?php foreach ($user->educations as $education)
                    {
                        ?>
                        <?php
                        //$list = CHtml::listData($records, 'id', 'name');
                        // echo CHtml::dropDownList('names', null, $list, array('empty' => '(Select a name)'));
                        ?>

                        <div>
        <?php echo $form->textField($education->fKSchool, 'name', array('class' => 'schoolName', 'disabled' => 'true')); ?>
                            <del><a href="/JobFair/index.php/Profile/deleteEducation?id=<?php echo $education->id ?>"><img src='/JobFair/images/ico/del.gif'/></a></del>
                            <aboutme>
        <?php echo $form->textArea($education, 'additional_info', array('rows' => 3, 'cols' => 75, 'border' => 0, 'class' => 'ta', 'disabled' => 'true')); ?>
                            </aboutme><br>

                            <lab> Graduation:</lab><p style="margin-left: 88px;
                                                      font-size: 14px;"><?php echo formatDate($education->graduation_date); ?> </p>
                            <lab> Degree:</lab><?php echo $form->textField($education, 'degree', array('class' => 'school', 'disabled' => 'true')); ?>
                            <lab> Major:</lab><?php echo $form->textField($education, 'major', array('class' => 'school', 'disabled' => 'true')); ?>

                        </div>
                        <div style="clear:both;">
                            <hr>
                        </div>


                        <?php
                    }
                    $education = new Education;
                ?>



                <div class="one" id="div1">
                    <p><a href="javascript:void(0);" id="addEducation">+ Add Education</a></p>
                </div>
                <div class="child-div1">

                    <lab2>School</lab2>
                    <?php
                        $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                            'id' => 'Education_name',
                            'name' => 'Education[name]',
                            'source' => $allSchools,
                            // additional javascript options for the autocomplete plugin
                            'options' => array(
                                'minLength' => '2',
                            ),
                            'htmlOptions' => array(
                                'class' => 'school'
                            ),
                        ));
                    ?>
                    <lab2> Graduation Date:</lab2><br/>
                    <?php //echo $form->textField($education,'graduation_date', array('class'=>'school'));   ?>
                    <?php
                        $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                            'name' => 'Education[graduation_date]',
                            'options' => array(
                                'showAnim' => 'fold',
                                'dateFormat' => 'yy-mm-dd',
                            ),
                            'htmlOptions' => array(
                                'class' => 'school'
                            ),
                        ));
                    ?>


                    <lab2> Degree Obtained:</lab2><?php echo $form->textField($education, 'degree', array('class' => 'school')); ?>
                    <lab2> Mayor:</lab2><?php echo $form->textField($education, 'major', array('class' => 'school')); ?>
                    <lab2> Additional Comments:</lab2><?php echo $form->textField($education, 'additional_info', array('class' => 'school')); ?>
                    <p><a href="#" id="editEducation" class="editbox"><img src='/JobFair/images/ico/add.gif'/></a></p>
                </div>
            </div> <!--  END EDUCATION -->
<?php $this->endWidget(); ?>

            <div style="clear:both"></div>


            <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'user-EditStudent-form', 'action' => '/JobFair/index.php/Profile/addExperience',
                    'enableAjaxValidation' => false,
                    'htmlOptions' => array('enctype' => 'multipart/form-data',),
                ));
            ?>

            <div id="experience">

                <div class="titlebox">EXPERIENCE</div>	

                <div style=clear:both></div>
                <?php foreach ($user->experiences as $experience)
                    {
                        ?>
                        <div>


                            <?php echo $form->textField($experience, 'job_title', array('class' => 'schoolName', 'disabled' => 'true')); ?>
                            <del><a href="/JobFair/index.php/Profile/deleteExperience?id=<?php echo $experience->id ?>"><img src='/JobFair/images/ico/del.gif'/></a></del>
                                                <?php echo $form->textArea($experience, 'job_description', array('class' => 'ta', 'disabled' => 'true')); ?>
                            <lab>Start:</lab><p style="margin-left: 88px;
                                                font-size: 14px;"><?php echo formatDate($experience->startdate); ?></p>
        <?php if ($experience->enddate == '0000-00-00 00:00:00')
        {
            ?>
                                <lab>End:</lab><p style="margin-left: 88px;
                                                  font-size: 14px;"><?php echo "Present" ?></p>
        <?php
        }
        else
        {
            ?>
                                <lab>End:</lab><p style="margin-left: 88px;
                                                  font-size: 14px;"><?php echo formatDate($experience->enddate); ?></p>
        <?php } ?>
                            <lab>Employer:</lab><?php echo $form->textField($experience, 'company_name', array('class' => 'school', 'disabled' => 'true')); ?>
                        </div>
                        <div style="clear:both;">
                            <hr>
                        </div>


        <?php
    }
    $experience = new Experience;
?>



                <div class="one" id="div1">
                    <p><a href="javascript:void(0);" id="addExperience">+ Add Experience</a></p>
                </div>
                <div class="child-div1">

                    <lab2> Position:</lab2><?php echo $form->textField($experience, 'job_title', array('class' => 'school')); ?>
                    <lab2> Employer:</lab2><?php echo $form->textField($experience, 'company_name', array('class' => 'school')); ?>
                    <lab2> Job Description:</lab2><?php echo $form->textField($experience, 'job_description', array('class' => 'school')); ?>

                    <lab2> Start Date:</lab2>
                    <?php
                        $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                            'name' => 'Experience[startdate]',
                            'options' => array(
                                'showAnim' => 'fold',
                                'dateFormat' => 'yy-mm-dd',
                            ),
                            'htmlOptions' => array(
                                'class' => 'school'
                            )
                        ));
                    ?>
                    <?php echo $form->error($experience, 'startdate'); ?>


                    <lab2> End Date: (Leave blank if present)</lab2> 
                    <?php
                        $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                            'name' => 'Experience[enddate]',
                            'options' => array(
                                'showAnim' => 'fold',
                                'dateFormat' => 'yy-mm-dd',
                            ),
                            'htmlOptions' => array(
                                'class' => 'school'
                            )
                        ));
                    ?>
<?php echo $form->error($experience, 'enddate'); ?>

                    <lab2> City:</lab2><?php echo $form->textField($experience, 'city', array('class' => 'school')); ?>
                    <lab2> State:</lab2><?php echo $form->textField($experience, 'state', array('class' => 'school')); ?>
                    <p><a href="#" id="editExperience" class="editbox"><img src='/JobFair/images/ico/add.gif'/></a></p>
                </div>

            </div> <!--  END EXPERIENCE -->
            <?php $this->endWidget(); ?>


            <?php

                function formatDate($mysqldate)
                {
                    $time = strtotime($mysqldate);
                    return date("F Y", $time);
                }
            ?>

        </div> <!--  END COTENT -->

        <div id="rightside">

            <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'user-saveSkills-form', 'action' => '/JobFair/index.php/Profile/saveSkills',
                    'htmlOptions' => array('enctype' => 'multipart/form-data'),
                ));
            ?>
            
            <div id="skills">
                <div class="titlebox">SKILLS</div>

                <div style=clear:both></div>
<?php $i = 0; ?>
                <ul id="sortable">

                    <script>
                        $(document).ready(function() {
                            $(function() {
                                $("#sortable").sortable();
                                $("#sortable").disableSelection();
                            });
                        });
                    </script>

<?php foreach ($user->studentSkillMaps as $skill)
    {
        ?>
                                    <?php $i++; ?>

                            <li id="skill<?php echo $i; ?>">


                                <span class="skilldrag" id="skill<?php echo $i; ?>">
        <?php echo $skill->skill->name; ?>
                                    <input type="hidden" name="Skill[]" value="<?php echo $skill->skill->id; ?>" />
                                </span>
                                <a class="deleteskill" id="skill<?php echo $i; ?>">
                                    <img src='/JobFair/images/ico/del.gif'/>
                                </a>
                                <br/>

                            </li>

                    <?php } ?>

                </ul>
                <?php $this->endWidget(); ?>
                <hr>
                 
                <?php
                    // Create autocomplete
                    $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                        'name' => 'addskillname',
                        'id' => 'addskillname',
                        'source' => Skillset::getNames(),
                        'htmlOptions' => array(),));
                ?>

                <?php
                    // Style Add Skill button
                    $this->widget('bootstrap.widgets.TbButton', array(
                        'label' => 'Add Skill',
                        'type' => 'primary',
                        'htmlOptions' => array(
                            'data-toggle' => 'modal',
                            'data-target' => '#myModal',
                            'style' => 'width: 120px',
                            'id' => "addskill",
                            'onclick' => 'return false;',
                            'style' => "margin-top: 5px; margin-bottom: 5px;width: 120px;",
                        ),
                    ));
                ?>
                <?php
                    // Style Save Skill button
                    $this->widget('bootstrap.widgets.TbButton', array(
                        'label' => 'Save Skills',
                        'type' => 'primary',
                        'htmlOptions' => array(
                            'data-toggle' => 'modal',
                            'data-target' => '#myModal',
                            'style' => 'width: 120px',
                            'id' => "saveSkills",
                            'style' => "margin-top: 5px; margin-bottom: 5px;width: 120px;",
                        ),
                    ));
                ?>

            </div>
            <!-- End SKILLS -->

            <div id="rightside">
                <div id="menutools">
                    <div id="studentlinks">
                        <!--Author Manuel
                        making the links dynamic so if the base Url changed the program won not be affected
                        -->
                        <h5>Link Accounts:</h5>
                        <?php
                            $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/linkedIn_login.png', '', array('width' => 160, 'height' => 100));
                            echo CHtml::link($image, array('profile/auth'));

                            $currentUser = User::getCurrentUser();
                            if (($currentUser != null) && ($currentUser->linkedinid != null))
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/checkmark.ico', '', array('width' => 30, 'height' => 30));
                            else
                            {
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/exclamation5.ico', '', array('width' => 30, 'height' => 30));
                            }
                        ?><br><br>


                        <?php
                            $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/google_login.png', '', array('width' => 160, 'height' => 100));
                            echo CHtml::link($image, array('profile/googleAuth'));

                            $currentUser = User::getCurrentUser();
                            if (($currentUser != null) && ($currentUser->googleid != null))
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/checkmark.ico', '', array('width' => 30, 'height' => 30));
                            else
                            {
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/exclamation5.ico', '', array('width' => 30, 'height' => 30));
                            }
                        ?><br><br>


                        <?php
                            $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/fiu_cs_login.png', '', array('width' => 160, 'height' => 100));
                            echo CHtml::link($image, array('profile/fiuCsSeniorAuth'));

                            $currentUser = User::getCurrentUser();
                            if (($currentUser != null) && ($currentUser->fiucsid != null))
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/checkmark.ico', '', array('width' => 30, 'height' => 30));
                            else
                            {
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/exclamation5.ico', '', array('width' => 30, 'height' => 30));
                            }
                        ?><br><br>

                        <?php
                            $image = CHtml::image(Yii::app()->baseUrl . '/images/imgs/fiu_login.png', '', array('width' => 160, 'height' => 100));
                            echo CHtml::link($image, array('profile/fiuAuth'));

                            $currentUser = User::getCurrentUser();
                            if (($currentUser != null) && ($currentUser->fiu_account_id != null))
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/checkmark.ico', '', array('width' => 30, 'height' => 30));
                            else
                            {
                                echo CHtml::image(Yii::app()->baseUrl . '/images/ico/exclamation5.ico', '', array('width' => 30, 'height' => 30));
                            }
                        ?><br><br>

                        <hr/>
                        <a href="/JobFair/index.php/user/ChangePassword">Change Password</a>
                    </div>

                </div>

            </div><!-- End Link Accounts -->

        </div>

        <!-- Check for first time viewing for students, prompt for LinkedIn Connect -->
<?php
    if (User::isCurrentUserStudent() && !$user->has_viewed_profile)
    {
        $user->has_viewed_profile = 1;
        $user->save(false);
        ?>
                <div id="linkedinbox" style="display:none;">
                    <a class="bClose">x</a>
                    <br><br>
                    <h3 class="mostwantedskills">Consider using LinkedIn to create your profile.</h3>
                    <div id="studentlinks">
                        <a  //edit by Manuel making the link dynamic, using Yii
        <?php
        $image = CHtml::image(Yii::app()->baseUrl . '/images/ico/linkedinlogo.png');
        echo CHtml::link($image, array('/profile/auth'));
        ?>

                            <br>LinkedIn Connect</a>
                    </div>
                </div>
                <script>
                    (function($) {
                        $(function() {
                            $('#linkedinbox').bPopup();
                            $('#linkedinbox').show();
                        });
                    })(jQuery);
                </script>
        <?php
    }
?>
