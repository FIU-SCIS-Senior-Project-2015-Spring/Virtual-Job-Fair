<?php    
    Yii::import('application.vendors.*');
    require_once 'Zend/Loader.php';
    Zend_Loader::loadClass('Zend_Gdata_YouTube');
    Zend_Loader::loadClass('Zend_Gdata_ClientLogin');
    

    require_once (Yii::app()->basePath . '/vendors/Google/autoload.php'); 
  
    require_once ('Google/Client.php');  
    require_once ('Google/Service/YouTube.php');  
    
    
    /**
     * Class that encapsulates some functionalities related to YouTube.
     * It allows you to upload videos to YouTube as well as delete them.
     * @author Rene Alfonso
     */
    class YouTubeHandler
    {    
        // PHP doesn't allow private constant variables. 
        
        private $username = 'vjfuploads';  
      //  private $username = 'vjfuploadsdev';
        private $password = 'virtualjobfair';
        private $devKey = 'AIzaSyDyj9EhNPGF3bnj50k9MgxZdV_iuUPhQL0';
        //private $devKey = 'AIzaSyDa1vSVEB83Bm1e07-R3SottqsUz-ZE79I'; // vjfuploadsdev account.
        const SERVICE = 'youtube';
        const AUTH_URL = 'https://www.google.com/accounts/ClientLogin';
        
        function __construct()
        {
        }
        
        public function getYouTubeInstance()
        {
            $httpClient = Zend_Gdata_ClientLogin::getHttpClient(
                                $this->username, $this->password, self::SERVICE, 
                                $client = null, $source = 'VirtualJobFair', 
                                $loginToken = null, $loginCaptcha = null, self::AUTH_URL);
            
            $yt = new Zend_Gdata_YouTube($httpClient, '', '', $this->devKey);
            
            return $yt;
        }
        
        /**
         * Deletes the video from resume and cleans up the video_path in the model.
         * @param type $vidresume The VideoResume model.
         */
        public function deleteVideo($vidresume)
        {    
            // [Deprecated] This code no longer works do to changes by YouTube.
            //$httpClient = Zend_Gdata_ClientLogin::getHttpClient($this->username, $this->password, self::SERVICE);
            //$yt = new Zend_Gdata_YouTube($httpClient, null, null, $this->devKey);
            
            /*$httpClient = Zend_Gdata_ClientLogin::getHttpClient(
                                $this->username, $this->password, self::SERVICE, 
                                $client = null, $source = 'VirtualJobFair', 
                                $loginToken = null, $loginCaptcha = null, self::AUTH_URL);
            
            $yt = new Zend_Gdata_YouTube($httpClient, '', '', $this->devKey);
            
            // Try catch incase someone manually deleted the old video from YouTube.
            try
            {
                // Grab the resume and delete it from YouTube.
                $vid = $yt->getVideoEntry($vidresume->video_path, null, true);                                
                $yt->delete($vid);
            }
            
            catch(Exception $e)
            {
                
            }*/
            
            try
            {
                $key = file_get_contents(Yii::app()->basePath . '/youtube_subsystem/the_key.txt');

                $application_name = 'VirtualJobFair'; 
                $client_secret = 'b_D_XmQJEs9oZJwXVxvNL3bn';
                $client_id = '499416543715-taun1hsg9901oghtgjvf6ov79kn2aof5.apps.googleusercontent.com';
                $scope = array('https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtubepartner');

                // Client init
                $client = new Google_Client();
                $client->setApplicationName($application_name);
                $client->setClientId($client_id);
                $client->setAccessType('offline');
                $client->setAccessToken($key);
                $client->setScopes($scope);
                $client->setClientSecret($client_secret);
 
                if($client->getAccessToken()) 
                {
                    // Check to see if our access token has expired. 
                    // If so, get a new one and save it to file for future use.         
                    if($client->isAccessTokenExpired()) 
                    {
                        $newToken = json_decode($client->getAccessToken());
                        $client->refreshToken($newToken->refresh_token);
                        file_put_contents(Yii::app()->basePath . '/youtube_subsystem/the_key.txt', $client->getAccessToken());
                    }

                    $youtube = new Google_Service_YouTube($client);

                    $youtube->videos->delete($vidresume->video_path);
                }
            }
            
            catch(Exception $e)
            {
                
            }

            $vidresume->video_path = NULL;
            $vidresume->save(true);
        }

        /*
         * [Deprecated] Returns video frame as a string that can be 'echo' to show it.
         */
        function getVideoFrame($vidId, $width, $height)
        {
            return '<iframe width="'.$width.'" height="'.$height.'" src="//www.youtube.com/embed/' . $vidId
                    . '?&rel=0&modestbranding=1&autoplay=0&showinfo=0&controls=2" frameborder="0" allowfullscreen> </iframe>'; 
        }
        
        /*
         * Returns video frame as a string that can be 'echo' to show it.
         */
        static function getVideoFrameV2($vidId, $width, $height)
        {
             return '<iframe width="'.$width.'" height="'.$height.'" src="//www.youtube.com/embed/' . $vidId
                    . '?&rel=0&modestbranding=1&autoplay=0&showinfo=0&controls=2" frameborder="0" allowfullscreen> </iframe>'; 
        }
    }