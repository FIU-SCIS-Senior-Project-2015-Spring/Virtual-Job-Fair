<?php
 
Yii::import('application.vendors.*');
require_once 'Zend/Loader.php';
Zend_Loader::loadClass('Zend_Gdata_YouTube');
Zend_Loader::loadClass('Zend_Gdata_ClientLogin');
 
     $authenticationURL = 'https://www.google.com/accounts/ClientLogin';
 
     $httpClient = Zend_Gdata_ClientLogin::getHttpClient(
                      $username          = 'vjfuploads',
                      $password           = 'virtualjobfair',
                      $service           = 'youtube',
                      $client           = null,
                      $source           = 'VirtualJobFair',
                      $loginToken           = null,
                      $loginCaptcha      = null,
                      $authenticationURL);
 
     $devkey = 'AIzaSyDyj9EhNPGF3bnj50k9MgxZdV_iuUPhQL0';
 
          $yt = new Zend_Gdata_YouTube($httpClient, '', '', $devkey);
          $video = new Zend_Gdata_YouTube_VideoEntry();
 
 
          $video->setVideoTitle('SeniorProject');
          $video->setVideoDescription('Education');
          $video->setVideoPrivate();
          $video->setVideoCategory('Education'); // see Youtube. Else you may get an error. Avoid using People & Blogs. People alone or Blogs alone is good.
          $video->SetVideoTags('apps');
          $handler_url     = 'http://gdata.youtube.com/action/GetUploadToken';
          $token_array     = $yt->getFormUploadToken($video, $handler_url);
          $token          = $token_array['token'];
          $response     = $token_array['url'];
          $nexturl      = 'http://localhost/JobFair/index.php/profile/view';
?>

<script type="text/javascript">
   // Check for the file.
    function checkForFile()
    {
        // Checks the file existance and the path.
        if(document.getElementById('token').value)
            return true;
        
       
        document.getElementById('errMsg').style.display = '';
        
        alert("Failed to upload file.");
        return false;
    }
</script>
 
<!--

<form action="<//?php echo $response ?>?nexturl=<//?php echo $nexturl ?>"
      method="post" enctype="multipart/form-data" onsubmit=" return checkForFile();">
     <input id = "file" name="file" type="file"/>
     <input name="token" type="hidden" value="<//?php echo $token ?>"/>
     <input value="Upload Video File" type="submit" />
</form>

-->


 <!--
<form action="<?//php echo($response->url); ?>
      ?nexturl=<//?php echo(urlencode($nexturl)); ?>
      " method="post" enctype="multipart/form-data" onsubmit=" return checkForFile();">
    
  <input id="file" type="file" name="file"/>
  
  <div id="errMsg" style="display:none;color:red">
    You need to specify a valid file.
  </div>
  
  <input type="hidden" name="token" value="<?//php echo($response->token); ?>"/>
  <input type="submit" value="go" />
 
</form>
</php>
-->
