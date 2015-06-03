<?php    
    Yii::import('application.vendors.*');
    require_once 'Zend/Loader.php';
    Zend_Loader::loadClass('Zend_Gdata_YouTube');
    Zend_Loader::loadClass('Zend_Gdata_ClientLogin');
    
    /**
     * Class that encapsulates some functionalities related to YouTube.
     *
     * @author Rene Alfonso
     */
    class YouTubeHandler
    {    
        // PHP doesn't allow private constant variables. 
        
        private $username = 'vjfuploads';   
        private $password = 'virtualjobfair';
        private $devKey = 'AIzaSyDyj9EhNPGF3bnj50k9MgxZdV_iuUPhQL0';
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
            $httpClient = Zend_Gdata_ClientLogin::getHttpClient($this->username, $this->password, self::SERVICE);
            $yt = new Zend_Gdata_YouTube($httpClient, null, null, $this->devKey);
            
            // Try catch incase someone manually deleted the old video from YouTube.
            try
            {
                // Grab the resume and delete it from YouTube.
                $vid = $yt->getVideoEntry($vidresume->video_path, null, true);
                $yt->delete($vid);
            }
            catch(Exception $e)
            {
                
            }
            
            $vidresume->video_path = NULL;
            $vidresume->save(true);
        }
        
        /*
         * Returns video frame as a string that can be 'echo' to show it.
         */
        function getVideoFrame($vidId, $width, $height)
        {
            return ' <div /> <iframe width="'.$width.'" height="'.$height.'" src="//www.youtube.com/embed/' . $vidId
                    . '?&rel=0&modestbranding=1&autoplay=0&showinfo=0&controls=2" frameborder="0" allowfullscreen> </iframe>'; 
        }
    }
    
    
    
                            
                            // Rene: Don't delete these comments until I have cleaned them up. Thanks.
                            // Delete video [START].
                            
                            // Rene: I can delete the video even though it is private. 
                            // However, I can't play it because it is private.
                        //    $vid = $currentYT->getVideoEntry($videoresume->video_path, null, true);
                            //$newURL = $vid->getFlashPlayerUrl();
                            
                            
                           // $vid->setVideoPublic();
                           // $yt->updateEntry($vid);
                           // 
                           // $newURL = $vid->getFlashPlayerUrl();
                            //$this->redirect($newURL);
                            
                           // sleep(50);
                           // $vid->setVideoPrivate();
                           // $yt->updateEntry($vid);
                            
                            //$this->redirect($newURL);
                            
                            
                            //$yt->delete($vid);
                            
              
                             // DB removal code.
                            //$videoresume->video_path = NULL;
                            //$videoresume->save(true);
                            // Delete video [END].
                            
                            
                            //$this->redirect('/JobFair/index.php/profile/view');