<?php

    class NotificationController extends Controller
    {

        public function actionView()
        {

            $this->render('View');
        }

        public function actionGetNotification()
        {
            $username = Yii::app()->user->name;
            $user = User::model()->find("username=:username", array(':username' => $username));
        }
        
        
        /**
         * 
         * @param type $sender
         * @param type $receiver
         * @param type $link
         * @param type $message
         * @param type $jobID
         * @author Rene Alfonso
         */
        public static function createStudentJobMatchNotification($sender, $receiver, $link, $message, $jobID)
        {
            $n = new Notification();
            $n->sender_id = $sender;
            
            $n->receiver_id = $receiver;
            date_default_timezone_set('America/New_York');
            $n->datetime = date('Y-m-d H:i:s');
            $n->been_read = 0;
            $n->link = $link;
            
            $n->message = $message;
            $n->importancy = 2;
            $n->jobMatchID = $jobID;
            
            $n->save(false);
            
        }
        
    }
    