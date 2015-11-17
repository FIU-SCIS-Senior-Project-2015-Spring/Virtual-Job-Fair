<?php

class PortalSitesController extends Controller
{
        public $layout = '//layouts/column3';
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
		$this->render('home');
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
        
        public function actionAddSite()
        {
            $model = new PortalSites;

            if (isset($_POST['PortalSites']))
            {
                $user = $_POST['PortalSites'];
                
                $this->render('siteCreate');
                

                $model->attributes = $_POST['PortalSites'];

                //Save site into database. 
                $model->save(false);
                
                

                return;
            }
            $error = '';
            $this->render('siteCreate', array('model' => $model, 'error' => $error));
        }
        
        public function actionVerifySiteCreate()
        {
            $user = $_POST['PortalSites'];
            $error = "";

            $name = $user['name'];
            $url = $user['url'];


            if (PortalSites::model()->find("name=:name", array(':name' => $name)))
            {
                $error .= "Site name is taken<br />";
            }
            if (PortalSites::model()->find("url=:url", array(':url' => $url)))
            {
                $error .= "Url is taken<br />";
            }
            

            print $error;
            return $error;
        }
        
        // Admin function that adds a new site to the site list.
        public function actionCreateSite()
        {
            if(User::isCurrentUserAdmin())
            {
                $model = new PortalSites;

                // Uncomment the following line if AJAX validation is needed
                // $this->performAjaxValidation($model);

                if (isset($_POST['PortalSites']))
                {
                    $model = $_POST['PortalSites'];

                    $this->actionAddSite();
                    $this->redirect('/JobFair/index.php/CombinedLogin/admin');
                }
                
                //$this->render('siteCreate', array('model' => $model));
            }
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