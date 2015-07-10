<?php
	//if (!isset($_SESSION))
    //	session_start();
    //$this->redirect('http://localhost/JobFair/index.php/user/RegisterLinkedIn');
    /*    
    $linkedin_callback_url = urlencode('http://localhost/JobFair/index.php/user/RegisterLinkedIn');    
    $linkedin_access = '78u1o4v00gjudi';  
    $linkedin_secret = 'z7OHk1oW9I0NaOPk';
    $this->redirect('https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id='.$linkedin_access.'&redirect_uri='.$linkedin_callback_url.'&state=6d4c84fe86ddb04f85c160aa6d332987&scope=r_basicprofile');     
    //$this->redirect('https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=78u1o4v00gjudi&redirect_uri=http%3A%2F%2Flocalhost%2FJobFair%2Findex.php%2Fuser%2FRegisterLinkedIn&state=6d4c84fe86ddb04f85c160aa6d332987');   
    
    $linkedin_code = 
    $grant_type = 'authorization_code&code=987654321&redirect_uri='.$linkedin_callback_url.'&client_id='.$linkedin_access.'&client_secret='.$linkedin_secret;
    
    $post_url = 'https://api.linkedin.com/uas/oauth2/accessToken?'.$grant_type;
    
    $url = $post_url;
    $ch = curl_init($url);

    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    curl_close($ch);*/

 
//edit by Manuel making the link dynamic, using Yii
 	//$config['base_url']             =   'http://'.Yii::app()->request->getServerName().'/JobFair/index.php/user/auth1.php';
 	//$config['callback_url']         =   'http://'.Yii::app()->request->getServerName().'/JobFair/index.php/user/RegisterLinkedIn';
    //$config['linkedin_access']      =   '78u1o4v00gjudi';
    //$config['linkedin_secret']      =   'z7OHk1oW9I0NaOPk';

    //include_once "linkedin.php";

    # First step is to initialize with your consumer key and secret. We'll use an out-of-band oauth_callback
    //$linkedin = new LinkedIn($config['linkedin_access'], $config['linkedin_secret'], $config['callback_url'] );
    //$linkedin->debug = true;

    # Now we retrieve a request token. It will be set as $linkedin->request_token
    //$linkedin->getRequestToken();
    //$_SESSION['requestToken'] = serialize($linkedin->request_token);
  
    # With a request token in hand, we can generate an authorization URL, which we'll direct the user to
    //echo "Authorization URL: " . $linkedin->generateAuthorizeUrl() . "\n\n";
    //header("Location: " . $linkedin->generateAuthorizeUrl());
?>
