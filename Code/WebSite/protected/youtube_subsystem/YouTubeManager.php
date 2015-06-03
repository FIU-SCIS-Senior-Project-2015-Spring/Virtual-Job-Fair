<?php
    
    include Yii::app()->basePath . '/youtube_subsystem/YouTubeHandler.php';
    
    /**
     * Handles the authentication and upload of videos to YouTube.
     * @author Rene Alfonso
     */
    
    $yH = new YouTubeHandler();
    $yt = $yH->getYouTubeInstance();
    
    $video = new Zend_Gdata_YouTube_VideoEntry();

    $video->setVideoTitle('SeniorProject');
    $video->setVideoDescription('Education');
    //$video->setVideoPrivate();
    
    // Set video to unlisted [START].
    //Creates an extension to Zend Framework
    $element = new Zend_Gdata_App_Extension_Element('yt:accessControl', 'yt', 'http://gdata.youtube.com/schemas/2007', '');

    //Adds the corresponding XML child/attribute
    $element->extensionAttributes = array(array('namespaceUri' => '', 'name' => 'action', 'value' => 'list'), array('namespaceUri' => '', 'name' => 'permission', 'value' => 'denied'));

    //Adds this extension to you video entry where "$myVideo" is your video to be uploaded
    $video->extensionElements = array($element);
    // Set video to unlisted [END].

    $video->setVideoCategory('Education');
    $video->SetVideoTags('education');

    $handler_url = 'http://gdata.youtube.com/action/GetUploadToken';
    $token_array = $yt->getFormUploadToken($video, $handler_url);
    $token = $token_array['token'];

    // Reponse coming from YouTube.
    $response = $token_array['url'];

    // The URL to redirect to.
    $nexturl = 'http://localhost/JobFair/index.php/profile/view';
    
    
?>

<script type="text/javascript">
    // Helper code in javascript.

    // Grab the file extension.
    function getExtension(fileName)
    {
        var parts = fileName.split('.');
        return parts[parts.length - 1];
    }

    function isVideo(fileName)
    {
        var bool = false;
        var ext = getExtension(fileName);

        switch (ext.toLowerCase())
        {
            case 'mov':
                bool = true;
                break;
            case 'm4v':
                bool = true;
                break;
            case 'avi':
                bool = true;
                break;
            case 'mpg':
                bool = true;
                break;
            case 'mp4':
                bool = true;
                break;

            default:
                bool = false;
        }

        // Else bool is already false so type not found.
        return bool;
    }

    // Check for the file.
    function checkForFile()
    {
        // Checks the file existance and the path.
        if(isVideo(document.getElementById('file').value))
            return true;

        document.getElementById('errMsg').style.display = '';

        alert("Failed to upload file.");
        return false;
    }

</script>