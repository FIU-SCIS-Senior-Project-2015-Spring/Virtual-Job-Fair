<?php
$youtube_email = "vjfuploads@gmail.com"; // Change this to your youtube sign in email.
$youtube_password = "virtualjobfair"; // Change this to your youtube sign in password.
 
$postdata = "Email=".$youtube_email."&Passwd=".$youtube_password."&service=youtube&source=Example";
$curl = curl_init("https://www.google.com/youtube/accounts/ClientLogin");
curl_setopt($curl, CURLOPT_HEADER, "Content-Type:application/x-www-form-urlencoded");
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);
$response = curl_exec($curl);
curl_close($curl);
 
list($auth, $youtubeuser) = explode("\n", $response);
list($authlabel, $authvalue) = array_map("trim", explode("=", $auth));
list($youtubeuserlabel, $youtubeuservalue) = array_map("trim", explode("=", $youtubeuser));
 
// This is the uploading video title.
$youtube_video_title = "Senior Project 2015" + rand(1, 90000);

// This is the uploading video description.
$youtube_video_description = "Example";

// This is the uploading video category.
$youtube_video_category = "News";

// This is the uploading video keywords.
$youtube_video_keywords = "example, video";

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
?>


<script type="text/javascript">
  function checkForFile()
  {
    if (document.getElementById('file').value)
    {
      return true;
    }
    
    document.getElementById('errMsg').style.display = '';
    return false;
  }
</script>
 

<?php
// URL to go to after upload.
$nexturl = "http://localhost/"; // for testing, later go to proper page.
?>
 
<form action="<?php echo($response->url); ?>?nexturl=<?php echo(urlencode($nexturl)); ?>" method="post" enctype="multipart/form-data" onsubmit="return checkForFile();">
  <input id="file" type="file" name="file"/>
  <div id="errMsg" style="display:none;color:red">
    You need to specify a file.
  </div>
  <input type="hidden" name="token" value="<?php echo($response->token); ?>"/>
  <input type="submit" value="go" />
 
</form>
</php>