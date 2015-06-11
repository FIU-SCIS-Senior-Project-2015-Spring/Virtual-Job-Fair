<?php

    /**
     * Controller for the Admin.
     */
    class UserCrudController extends Controller
    {             
        /**
         * @return array action filters
         */
        public function filters()
        {
            return array(
                'accessControl', // perform access control for CRUD operations
                'postOnly + delete', // we only allow deletion via POST request
            );
        }

        /**
         * Specifies the access control rules.
         * This method is used by the 'accessControl' filter.
         * @return array access control rules
         */
        public function accessRules()
        {
            return array(
                array('allow', // allow admin user to perform 'admin' and 'delete' actions
                    'actions' => array('admin', 'delete', 'update', 'index', 'toggleActivateButton',)
                    ,'users' => array('admin', 'administrator'),
                ),
                array('deny', // deny all users
                    'users' => array('*'),
                ),
            );
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
            $model = new User;

            // Uncomment the following line if AJAX validation is needed
            // $this->performAjaxValidation($model);

            if (isset($_POST['User']))
            {
                $model->attributes = $_POST['User'];
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

            if(isset($_POST['User']))
            {
                $model->attributes = $_POST['User'];

                if($model->validate(array('username', 'first_name', 'last_name', 'email', 'activated',)) && $model->save(false))
                {    //$this->redirect(array('admin', 'id' => $model->id));
                    // Show confirmation message.
                    $confirmation = 'User information updated successfully!';
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
            $currentUser = User::getCurrentUser();

            // Check if you are trying to delete the current user, this case the admin.
            // Bug fixed, card: #89.
            if ($currentUser->id == $id)
            {
                throw new CHttpException(501, 'You cannot delete your own account.');
                return;
            }

            // Else, delete the user.
            else
                $this->loadModel($id)->cascade_delete();


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
            $model = new User('search');
            $model->unsetAttributes();  // clear any default values
            if (isset($_GET['User']))
                $model->attributes = $_GET['User'];

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
            $model = User::model()->findByPk($id);
            
            if($model === null)
                throw new CHttpException(404, 'The requested page does not exist.');
            
            return $model;
        }

        /**
         * Not currently in use.
         * Performs the AJAX validation.
         * @param User $model the model to be validated
         */
        protected function performAjaxValidation($model)
        {
            if (isset($_POST['ajax']) && $_POST['ajax'] === 'user-form')
            {
                echo CActiveForm::validate($model);
                Yii::app()->end();
            }
        }
        
    } 