<?php  
    include ($_SERVER["DOCUMENT_ROOT"].'/Virtual-Job-Fair/Code/WebSite/protected/youtube_subsystem/google/src/Google/autoload.php'); 
    
    
  require_once ($_SERVER["DOCUMENT_ROOT"].'/JobFair/protected/youtube_subsystem/google/src/Google/Client.php');  
  require_once ($_SERVER["DOCUMENT_ROOT"].'/JobFair/protected/youtube_subsystem/google/src/Google/Service/YouTube.php');  
    
  session_start();

  $DEVELOPER_KEY = 'AIzaSyDyj9EhNPGF3bnj50k9MgxZdV_iuUPhQL0';  
     
  
$OAUTH2_CLIENT_ID = '499416543715-taun1hsg9901oghtgjvf6ov79kn2aof5.apps.googleusercontent.com';
$OAUTH2_CLIENT_SECRET = 'b_D_XmQJEs9oZJwXVxvNL3bn';
$REDIRECT = 'http://localhost/jobfair/protected/youtube_subsystem/sample.php';
$APPNAME = "VirtualJobFair";
 
 

 
 
$client = new Google_Client();
$client->setClientId($OAUTH2_CLIENT_ID);
$client->setClientSecret($OAUTH2_CLIENT_SECRET);
$client->setScopes('https://www.googleapis.com/auth/youtube');
$client->setRedirectUri($REDIRECT);
$client->setApplicationName($APPNAME);
$client->setAccessType('offline');
 
 
// Define an object that will be used to make all API requests.
$youtube = new Google_Service_YouTube($client);
 
if (isset($_GET['code'])) {
    if (strval($_SESSION['state']) !== strval($_GET['state'])) {
        die('The session state did not match.');
    }
 
    $client->authenticate($_GET['code']);
    $_SESSION['token'] = $client->getAccessToken();
 
}
 
if (isset($_SESSION['token'])) {
    $client->setAccessToken($_SESSION['token']);
    echo '<code>' . $_SESSION['token'] . '</code>';
}
 
// Check to ensure that the access token was successfully acquired.
if ($client->getAccessToken()) {
    try {
        // Call the channels.list method to retrieve information about the
        // currently authenticated user's channel.
        $channelsResponse = $youtube->channels->listChannels('contentDetails', array(
            'mine' => 'true',
        ));
 
        $htmlBody = '';
        foreach ($channelsResponse['items'] as $channel) {
            // Extract the unique playlist ID that identifies the list of videos
            // uploaded to the channel, and then call the playlistItems.list method
            // to retrieve that list.
            $uploadsListId = $channel['contentDetails']['relatedPlaylists']['uploads'];
 
            $playlistItemsResponse = $youtube->playlistItems->listPlaylistItems('snippet', array(
                'playlistId' => $uploadsListId,
                'maxResults' => 50
            ));
 
            $htmlBody .= "<h3>Videos in list $uploadsListId</h3><ul>";
            foreach ($playlistItemsResponse['items'] as $playlistItem) {
                $htmlBody .= sprintf('<li>%s (%s)</li>', $playlistItem['snippet']['title'],
                    $playlistItem['snippet']['resourceId']['videoId']);
            }
            $htmlBody .= '</ul>';
        }
    } catch (Google_ServiceException $e) {
        $htmlBody .= sprintf('<p>A service error occurred: <code>%s</code></p>',
            htmlspecialchars($e->getMessage()));
    } catch (Google_Exception $e) {
        $htmlBody .= sprintf('<p>An client error occurred: <code>%s</code></p>',
            htmlspecialchars($e->getMessage()));
    }
 
    $_SESSION['token'] = $client->getAccessToken();
} else {
    $state = mt_rand();
    $client->setState($state);
    $_SESSION['state'] = $state;
 
    $authUrl = $client->createAuthUrl();
    $htmlBody = <<<END
  <h3>Authorization Required</h3>
  <p>You need to <a href="$authUrl">authorise access</a> before proceeding.<p>
END;
}
?>
 
<!doctype html>
<html>
<head>
    <title>My Uploads</title>
</head>
<body>
<?php echo $htmlBody?>
</body>
</html>

