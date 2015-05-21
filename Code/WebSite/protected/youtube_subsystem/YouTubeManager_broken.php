<?php
/**
 * This class manages the process of uploading videos to YouTube. It allows the
 * end-user to upload the video directly; user is technically unaware of where
 * the video is going to. 
 */

// Credentials for the Gmail account related to the YouTube account.
$youtube_email = "vjfuploads@gmail.com"; 
$youtube_password = "virtualjobfair"; 
 
// CURL to access YouTube servers and login.
$postdata = "Email=".$youtube_email."&Passwd=".$youtube_password."&service=youtube&source=Example";
$curl = curl_init("https://www.google.com/youtube/accounts/ClientLogin");
curl_setopt($curl, CURLOPT_HEADER, "Content-Type:application/x-www-form-urlencoded");
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); 
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2); // 1
$response = curl_exec($curl);
curl_close($curl);
 
// Get the access token. Gets the YouTube username.
list($auth, $youtubeuser) = explode("\n", $response);
list($authlabel, $authvalue) = array_map("trim", explode("=", $auth));
list($youtubeuserlabel, $youtubeuservalue) = array_map("trim", explode("=", $youtubeuser));
 
// This is the uploading video title.
$youtube_video_title = "Senior Project 2015"; //+ rand(1, 90000);

// This is the uploading video description.
$youtube_video_description = "Senior Project Resume Example";

// This is the uploading video category.
$youtube_video_category = "Education";

// This is the uploading video keywords.
$youtube_video_keywords = "Education";

// URL to go to after upload.
$nexturl = "http://localhost/JobFair/index.php/profile/view"; 

// Settings for upload. <yt:private/> makes video private.
$data = '<?xml version="1.0"?>
            <entry xmlns="http://www.w3.org/2005/Atom"
              xmlns:media="http://search.yahoo.com/mrss/"
              xmlns:yt="http://gdata.youtube.com/schemas/2007">
              <media:group>
                <media:title type="plain">'.$youtube_video_title.'</media:title>
                <media:description type="plain">'.$youtube_video_description.'</media:description>
                <media:category
                  scheme="http://gdata.youtube.com/schemas/2007/categories.cat">'.$youtube_video_category.'</media:category>
                <media:keywords>'.$youtube_video_keywords.'</media:keywords>
                <yt:private/> 
              </media:group>
            </entry>';
 
// Developer key.
$key = "AIzaSyDyj9EhNPGF3bnj50k9MgxZdV_iuUPhQL0"; 
 
$headers = array("Authorization: GoogleLogin auth=".$authvalue,
                 "GData-Version: 2",
                 "X-GData-Key: key=".$key,
                 "Content-length: ".strlen($data),
                 "Content-Type: application/atom+xml; charset=UTF-8");
 
$curl = curl_init("http://gdata.youtube.com/action/GetUploadToken");
curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER["HTTP_USER_AGENT"]);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_TIMEOUT, 10);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
curl_setopt($curl, CURLOPT_REFERER, true);
curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($curl, CURLOPT_HEADER, 0);
 
$response = simplexml_load_string(curl_exec($curl));

curl_close($curl);

// URL to go to after upload.
$nexturl = "http://localhost/JobFair/index.php/profile/view"; 
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
            case 'mov': bool = true;
                        break;
            case 'm4v': bool = true;
                        break;
            case 'avi': bool = true;
                        break;
            case 'mpg': bool = true;
                        break;
            case 'mp4': bool = true;
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