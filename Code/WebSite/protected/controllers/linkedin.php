<?php

session_start();
define('site_URI','http://'.Yii::app()->request->getServerName().'/JobFair/index.php/user/auth1');

class Linkedin {

    private $api_KEY = '78u1o4v00gjudi';
    private $api_SECRET = 'z7OHk1oW9I0NaOPk';
// You must pre-register your redirect_uri at https://www.linkedin.com/secure/developer
    private $redirect_URI;
    //private $redirect_URI = 'http://localhost/JobFair/index.php/user/auth1';
    //define('redirect_URI', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/user/auth1');

    private $scope = 'r_basicprofile r_emailaddress';

    function __construct() {
        
        $this->redirect_URI = site_URI;        
    }

    function getAuthorizationCode() {
        $params = array(
            'response_type' => 'code',
            'client_id' => $this->api_KEY,
            'scope' => $this->scope,
            'state' => uniqid('', true), // unique long string
            'redirect_uri' => $this->redirect_URI,
        );

        // Authentication request
        $url = 'https://www.linkedin.com/uas/oauth2/authorization?' . http_build_query($params);

        // Needed to identify request when it returns to us
        $_SESSION['state'] = $params['state'];

        // Redirect user to authenticate
        header("Location: $url");
        exit;
    }

    function getAccessToken() {
        $params = array(
            'grant_type' => 'authorization_code',
            'client_id' => $this->api_KEY,
            'client_secret' => $this->api_SECRET,
            'code' => $_GET['code'],
            'redirect_uri' => $this->redirect_URI,
        );

        // Access Token request
        $url = 'https://www.linkedin.com/uas/oauth2/accessToken?' . http_build_query($params);

        // Tell streams to make a POST request
        $context = stream_context_create(
                array('http' =>
                    array('method' => 'POST',
                    )
                )
        );
        
        set_error_handler(
                create_function(
                        '$severity, $message, $file, $line', 'throw new ErrorException($message, $severity, $severity, $file, $line);'
                )
        );
        
        try {
             // Retrieve access token information
            $response = file_get_contents($url, false, $context);
        } catch (Exception $e) {
            echo "Cannot get Authorization Token. Please, try to loging again.";
            exit();
        }
        restore_error_handler();

        // Native PHP object, please
        $token = json_decode($response);

        // Store access token and expiration time
        $_SESSION['access_token'] = $token->access_token;
        $_SESSION['expires_in'] = $token->expires_in; // relative time (in seconds)
        $_SESSION['expires_at'] = time() + $_SESSION['expires_in']; // absolute time

        return true;
    }

    function fetch($method, $resource, $body = '') {
        //print $_SESSION['access_token'];
        $params[] = "";

        $opts = array(
            'http' => array(
                'method' => $method,
                'header' => "Authorization: Bearer " . $_SESSION['access_token'] . "\r\n" . "x-li-format: json\r\n"
            )
        );

        // Need to use HTTPS
        $url = 'https://api.linkedin.com' . $resource;

        // Append query parameters (if there are any)
        if (count($params)) {
            $url .= '?' . http_build_query($params);
        }

        // Tell streams to make a (GET, POST, PUT, or DELETE) request
        // And use OAuth 2 access token as Authorization
        $context = stream_context_create($opts);

        // Hocus Pocus
        $response = file_get_contents($url, false, $context);

        // Native PHP object, please
        return json_decode($response);
    }

}
