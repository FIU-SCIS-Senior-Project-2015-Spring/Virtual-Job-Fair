<?php

require_once 'vendor/autoload.php';
use OAuth_io\OAuth;

class CombinedLoginController extends Controller
{
        // Holds array of Google user data recieved after authentication
        private $result = array();
       // Google authentication status
        private $accAuthenticated = false;
        public $layout = '//layouts/column3';
        private $credentials;
	public function actionCreateDocument()
	{
		$this->render('createDocument');
	}

	public function actionCreateEmployer()
	{
		$this->render('createEmployer');
	}

	public function actionDeleteDocument()
	{
		$this->render('deleteDocument');
	}

	public function actionExportDocument()
	{
		$this->render('exportDocument');
	}

	public function actionGetLocalUrl()
	{
		$this->render('getLocalUrl');
	}

	public function actionGetRemoteUrl()
	{
		$this->render('getRemoteUrl');
	}

	public function actionHome()
	{
            $model = new PortalSites('search');
            $model->unsetAttributes();  // clear any default values
            if (isset($_GET['PortalSites']))
                $model->attributes = $_GET['PortalSites'];

            $this->render('home', array('model' => $model));
	}
        
        public function actionLogin()
	{
            $model = new LoginForm;

            // if it is ajax validation request
            if (isset($_POST['ajax']) && $_POST['ajax'] === 'login-form')
            {
                echo CActiveForm::validate($model);
                Yii::app()->end();
            }

            // collect user input data
            if (isset($_POST['LoginForm']))
            {
                //$model->attributes=$_POST['LoginForm'];
                $model->attributes = Yii::app()->request->getPost('LoginForm');
                // validate user input and redirect to the previous page if valid
                if ($model->validate())
                {
                    $username = $model->username;
                    $user = User::model()->find("username=:username", array(':username' => $username));
                    if ($user->disable != 1 && $user->activated != 0)
                    {
                        $model->login();
                        if (Yii::app()->user->returnUrl == "/JobFair/index.php")
                        {
                            if ($user->isAStudent())
                            {
                                $this->redirect("/JobFair/index.php/home/studenthome");
                            }
                            elseif ($user->isAEmployer())
                            {
                                $this->redirect("/JobFair/index.php/home/employerhome");
                            }
                            else
                            {
                                $this->redirect("/JobFair/index.php/CombinedLogin/admin");
                            }
                        }
                        else
                        {
                            $this->redirect('/JobFair/index.php/CombinedLogin/login');
                        }
                    }
                    
                    else // Show the disabled page.
                        $this->redirect("/JobFair/index.php/site/page?view=disableUser");
                }
            }
            // display the login form
            $this->render('login', array('model' => $model));
	}
        
        public function actionFiuAuth() {
        ########## Google Settings.. Client ID, Client Secret #############
        //edit by Manuel, making the links dynamic, using Yii
        //To access the google API console to be able to change the setting
        //go to https://code.google.com/apis/console/?noredirect#project:44822970295:access
        //E-mail: virtualjobfairfiu@gmail.com
        //PASS: cis49112014
        $google_client_id = '44822970295-ub8arp3hk5as3s549jdmgl497rahs6jl.apps.googleusercontent.com';
        $google_client_secret = 'RsCRTYbGC4VZc40ppLR-4L5h';
        $google_redirect_url = 'http://' . Yii::app()->request->getServerName() . '/JobFair/index.php/profile/fiuAuth/oauth2callback';
        $google_developer_key = 'AIzaSyBRvfT7Djj4LZUrHqLdZfJRWBLubk51ARA';

        //include google api files
        require_once Yii::app()->basePath . "/fiu/Google_Client.php";
        require_once Yii::app()->basePath . "/fiu/contrib/Google_Oauth2Service.php";

        $gClient = new Google_Client();
        $gClient->setApplicationName('Login to JobFair');
        $gClient->setClientId($google_client_id);
        $gClient->setClientSecret($google_client_secret);
        $gClient->setRedirectUri($google_redirect_url);
        $gClient->setDeveloperKey($google_developer_key);

        $google_oauthV2 = new Google_Oauth2Service($gClient);

        //If user wish to log out, we just unset Session variable
        if (isset($_REQUEST['reset'])) {
            unset($_SESSION['token']);
            $gClient->revokeToken();
            header('Location: ' . filter_var($google_redirect_url, FILTER_SANITIZE_URL));
        }

        if (isset($_GET['code'])) {
            $gClient->authenticate($_GET['code']);
            $_SESSION['token'] = $gClient->getAccessToken();
            header('Location: ' . filter_var($google_redirect_url, FILTER_SANITIZE_URL));
            return;
        }

        // if user canceled, redirect to home page
        if (isset($_GET['error'])) {
            $problem = $_GET['error'];
            $this->redirect('/JobFair/index.php');
        }


        if (isset($_SESSION['token'])) {
            $gClient->setAccessToken($_SESSION['token']);
        }


        if ($gClient->getAccessToken()) {
            //Get user details if user is logged in
            $user = $google_oauthV2->userinfo->get();
            $user_id = $user['id'];
            $user_name = filter_var($user['name'], FILTER_SANITIZE_SPECIAL_CHARS);
            $email = filter_var($user['email'], FILTER_SANITIZE_EMAIL);
            $_SESSION['token'] = $gClient->getAccessToken();
        } else {
            //get google login url
            $authUrl = $gClient->createAuthUrl();
        }

        if (isset($authUrl)) { //user is not logged in, show login button
            $this->redirect($authUrl);
        }

        //link Fiu Account account to the current one
        $currentUser = User::getCurrentUser();
        if (($currentUser != null) && ($currentUser->FK_usertype == 1)) {
            // check that there is no duplicate id
            $duplicateUser = User::model()->findByAttributes(array('fiu_account_id' => $user_id));
            if ($duplicateUser != null) {
                $this->actionDuplicationError();
                return;
            }

            $username = Yii::app()->user->name;
            $userLink = User::model()->find("username=:username", array(':username' => $username));
            $userLink->fiu_account_id = $user_id;
            $userLink->save(false);

            //get variables
            $mesg = "FIU Email";
            $phone = null;
            $city = null;
            $state = null;
            $about_me = null;
            $this->actionLinkToo($email, $user['given_name'], $user['family_name'], $user['picture'], $mesg, $phone, $city, $state, $about_me);
            return;
        } else { // user logged in succesfully to google, now check if we register or login to JobFair


            $userExists = User::model()->findByAttributes(array('fiu_account_id' => $user["id"]));
            // if user exists with fiu_account_id, login
            if ($userExists != null) {

                if ($userExists->disable != 1) {
                    $identity = new UserIdentity($userExists->username, '');
                    if ($identity->authenticateOutside()) {
                        Yii::app()->user->login($identity);
                    }

                    $this->redirect("/JobFair/index.php/combinedLogin/home");
                    return;
                } else {
                    $this->redirect("/JobFair/index.php/site/page?view=disableUser");
                    return;
                }
            }

            // register
            else {

                // check that there is no duplicate user
                $duplicateUser = User::model()->findByAttributes(array('email' => $user['email']));
                if ($duplicateUser != null) {

                    //populate db
                    $duplicateUser->fiu_account_id = $user_id;
                    $duplicateUser->save(false);

                    if ($duplicateUser->disable != 1) {
                        $identity = new UserIdentity($duplicateUser->username, '');
                        if ($identity->authenticateOutside()) {
                            Yii::app()->user->login($identity);
                        }
                        //get variables
                        $mesg = "FIU Email";
                        $phone = null;
                        $city = null;
                        $state = null;
                        $about_me = null;
                        $this->actionLinkToo($email, $user['given_name'], $user['family_name'], $user['picture'], $mesg, $phone, $city, $state, $about_me);
                        return;
                    } else {
                        $this->redirect("/JobFair/index.php/site/page?view=disableUser");
                        return;
                    }
                }

                $model = new User();
                //Populate user attributes
                $model->FK_usertype = 1;
                $model->registration_date = new CDbExpression('NOW()');
                $model->activation_string = 'fiu';
                $model->username = $user["email"];
                $model->first_name = $user['given_name'];
                $model->last_name = $user['family_name'];
                $model->email = $user["email"];
                $model->fiu_account_id = $user["id"];
                $model->image_url = $user['picture'];
                //Hash the password before storing it into the database
                $hasher = new PasswordHash(8, false);
                $model->password = $hasher->HashPassword('tester');
                $model->activated = 1;
                $model->save(false);

                // LOGIN
                $model2 = User::model()->find("username=:username", array(':username' => $model->email));
                $identity = new UserIdentity($model2->username, 'tester');
                if ($identity->authenticate()) {
                    Yii::app()->user->login($identity);
                }
                $this->redirect("/JobFair/index.php/user/ChangeFirstPassword");
            }
        }
    }
    
    // Create oauth object, redirect user to Google for authentication,
    // redirect to API endpoint
    private function authAcc()
    {
        $oauth = new OAuth(null, false);
        $oauth->setOAuthdUrl('http://vjf-dev.cis.fiu.edu:6284', $base='/auth');
        $oauth->initialize('8boH6TCiWWz3GAUDAN6jXtZ1Hg4', '1VWCLveBtnwmIqhM_SJZvjxmjDs');
        $oauth->redirect('google', '/JobFair/index.php/CombinedLogin/GetResult');
    }

    // Handle request object if it exists and retrieve data,
    // attempt to register user's Google account
    public function actionGetResult()
    {
        $oauth = new OAuth(null, false);
        $oauth->setOAuthdUrl('http://vjf-dev.cis.fiu.edu:6284', $base='/auth');
        $oauth->initialize('8boH6TCiWWz3GAUDAN6jXtZ1Hg4', '1VWCLveBtnwmIqhM_SJZvjxmjDs');
        
        $google_requester = $oauth->auth('google', array(
           'redirect' => true
        ));
        $this->accAuthenticated = true;

        $google_result = $google_requester->me();
        $this->result = $google_result;

        $this->actionGoogleAuth();
    }
	public function actionImportDocument()
	{
		$this->render('importDocument');
	}

	public function actionListDocument()
	{
		$this->render('listDocument');
	}

	public function actionOpenDocument()
	{
		$this->render('openDocument');
	}

	public function actionRenameDocument()
	{
		$this->render('renameDocument');
	}

	public function actionSaveDocument()
	{
		$this->render('saveDocument');
	}

	public function actionShareDocument()
	{
		$this->render('shareDocument');
	}
        
         /**
         * Displays a particular model.
         * @param integer $id the ID of the model to be displayed
         */
        public function actionView($id)
        {
            $this->render('view', array(
                'model' => $this->loadModel($id),
            ));
        }

        
        /**
         * Creates a new model.
         * If creation is successful, the browser will be redirected to the 'view' page.
         */
        public function actionCreate()
        {
            $model = new PortalSites();

            // Uncomment the following line if AJAX validation is needed
            // $this->performAjaxValidation($model);

            if (isset($_POST['PortalSites']))
            {
                $model->attributes = $_POST['PortalSites'];
                if ($model->save())
                    $this->redirect(array('view', 'id' => $model->id));
            }

            $this->render('create', array(
                'model' => $model,
            ));
        }
        
        /**
         * Updates a particular model.
         * If update is successful, the browser will be redirected to the 'view' page.
         * @param integer $id the ID of the model to be updated
         */
        public function actionUpdate($id)
        {
            $model = $this->loadModel($id);
            
            $confirmation = '';

            // Uncomment the following line if AJAX validation is needed
            // $this->performAjaxValidation($model);

            if(isset($_POST['PortalSites']))
            {
                $model->attributes = $_POST['PortalSites'];

                if($model->validate(array('name', 'url',)) && $model->save(false))
                {    //$this->redirect(array('admin', 'id' => $model->id));
                    // Show confirmation message.
                    $confirmation = 'Portal site list information updated successfully!';
                }
            }

            $this->render('update', array('model' => $model, 'confirmation'=>$confirmation));
        }

        /**
         * Deletes a particular model.
         * If deletion is successful, the browser will be redirected to the 'admin' page.
         * @param integer $id the ID of the model to be deleted
         */
        public function actionDelete($id)
        {
            $this->loadModel($id)->row_delete();


            // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
            if (!isset($_GET['ajax']))
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
        }

        /**
         * Lists all models.
         */
        public function actionIndex()
        {
            $this->actionAdmin();
        }

        /**
         * Manages all models.
         */
        public function actionAdmin()
        {
            $model = new PortalSites('search');
            $model->unsetAttributes();  // clear any default values
            if (isset($_GET['PortalSites']))
                $model->attributes = $_GET['PortalSites'];

            $this->render('admin', array('model' => $model));
        }

        /**
         * Returns the data model based on the primary key given in the GET variable.
         * If the data model is not found, an HTTP exception will be raised.
         * @param integer $id the ID of the model to be loaded
         * @return User the loaded model
         * @throws CHttpException
         */
        public function loadModel($id)
        {
            $model = PortalSites::model()->findByPk($id);
            
            if($model === null)
                throw new CHttpException(404, 'The requested page does not exist.');
            
            return $model;
        }
        
        /**
         * Logs out the current user and redirect to homepage.
         */
        public function actionLogout()
        {
            Yii::app()->user->logout();
            $this->redirect('/JobFair/index.php/CombinedLogin/login');
        }
        
        private function get_domain($email)
        {
            if (strrpos($email, '.') == strlen($email) - 3)
                $num_parts = 3;
            else
                $num_parts = 2;

             $domain = implode('.',
             array_slice( preg_split("/(\.|@)/", $email), - $num_parts)
        );
        return strtolower($domain);
        }
        
        public function actionGoogleLogin()
        {
            $this->actionFiuAuth();
            $this->redirect('/JobFair/index.php');
        }
        
        
        


	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}