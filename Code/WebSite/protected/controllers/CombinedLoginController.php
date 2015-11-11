<?php

class CombinedLoginController extends Controller
{
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
        
        public function actionIndex()
	{
		$this->render('index');
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