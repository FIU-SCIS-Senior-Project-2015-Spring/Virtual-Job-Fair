<?php

    class MessageController extends Controller
    {
        public function actionIndex($target = null)
        {
            $user = User::model()->findByAttributes(array('username' => Yii::app()->user->name));
            $this->render('view', array('user' => $user, 'target' => $target)); 
        }

        public function actionSend($username = null, $reply = null, $selfReply = null/*, $send_Matched_Msg = null*/)
        {
            /*if(isset($_POST['send_Matched_Msg'])){
                $send_Matched_Msg = $_POST['send_Matched_Msg'];
            }*/
            $user = new User;
            $model = new Message;
            $message = null;

            $users = array();
            
            // Check if current user is admin.
            // Then get all users.
            if(User::getCurrentUser()->FK_usertype == 3)
                $models = User::model()->findAll();
            
            // Check if user is Employer.
            // Then get the list of the admins and students.
            else if(User::getCurrentUser()->FK_usertype == 2)
                $models = User::model()->findAllBySql("SELECT * FROM user WHERE (FK_usertype = 3 or FK_usertype = 1)");

            else // Only get the list of students.
                $models = User::model()->findAll(array('condition' => 'FK_usertype = 1'));

            // Get the autocomplete list from the database on the To: line
            foreach ($models as $aUser)
            {
                $users[] = array(
                    'label' => CHtml::image($aUser->image_url, '', array('width' => '20px')) . '  ' . $aUser->first_name . ' ' . $aUser->last_name,
                    'value' => "\"" . $aUser->first_name . " " . $aUser->last_name . "\" <" . $aUser->username . ">"
                );
            }

            // Send the message
            if (isset($_POST['Message']) && isset($_POST['receiver']))
            {
                $model->attributes = $_POST['Message'];
                $model->FK_sender = Yii::app()->user->name;             // Write the sender user name to the message table
                date_default_timezone_set('America/New_York');          // Set time zone for the script
                $model->date = date('Y-m-d H:i:s');                     // Write the current time to the database
                $model->userImage = $model->fKSender->image_url;        // Write sender profile image to the database
                $model->subject = $_POST['Message']['subject'];         // Write the message subject to the database
                $model->been_read = 0;                                  // Initialize the message to be unread
                $receivers = $this->getReceivers($_POST["receiver"]);   // Get the receivers from the View parse and save the returned array
                $receiverCount = count($receivers);                     // Count the number of recipients
                // Write the message record to each recipient
                for ($i = 0; $i < $receiverCount; $i++)
                {
                    $model->FK_receiver = $receivers[$i];                   // Write the name of each receiver
                    // If the user exists.
                    if (User::model()->find("username=:username", array(':username' => $model->FK_receiver)) != null)
                    {
                        // Save the message.
                        $model->save();

                        // Rene: create a notification.
                        Notification::createMessageNotification(User::getCurrentUser(), $model->FK_receiver, 'http://' . Yii::app()->request->getServerName() . '/JobFair/index.php/message', $model->id);
                    }

                    $model = new Message;                                   // Create new message object
                    $model->attributes = $_POST['Message'];                 // Write Message[message] to the database 
                    $model->FK_sender = Yii::app()->user->name;             // Write the sender username to the database
                    $model->date = date('Y-m-d H:i:s');                     // Write the date and time to the database
                    $model->userImage = $model->fKSender->image_url;        // Write the sender image url to the database
                    $model->subject = $_POST['Message']['subject'];         // Write the message and the subject to the database
                }

           
                $link = CHtml::link('here', 'http://' . Yii::app()->request->getServerName() . '/JobFair/index.php/message');
                $receiver = User::model()->find("username=:username", array(':username' => $model->FK_receiver));

                if($receiver != NULL)
                {
                    $message = "You just got a message from $model->FK_sender<br/> '$model->message'<br/> Access the message $link";
                    User::sendEmail($receiver->email, "Virtual Job Fair Message", "Message from Virtual Job Fair", $message);
                }

                $this->redirect("/JobFair/index.php/message");
                return;
            }
            
            if ($username != null)
            {   
                $newRecipient = User::model()->find("username=:username", array(':username' => $username));
                $fullname = $newRecipient->first_name . ' ' . $newRecipient->last_name;
                $username = '"' . $fullname . '"' . ' <' . $username . '>, '; 
            }

            if ($reply != null)
            {
                $message = Message::model()->findByPK($reply);

                if (Yii::app()->user->name == $message->FK_sender)
                {
                    $username = $message->FK_receiver;
                }
                else
                {
                    $username = $message->FK_sender;
                }
                $updatedSender = User::model()->find("username=:username", array(':username' => $username));
                $fullname = $updatedSender->first_name . ' ' . $updatedSender->last_name;

                $username = '"' . $fullname . '"' . ' <' . $username . '>, '; //"student four"
                $model->subject = $message->subject;
                $model->message = "\n\n\nOn " . $message->date . ", " . $message->FK_sender . " wrote:\n" . $message->message;
            }

            $this->render('send', array('user' => $user, 'users' => $users, 'model' => $model, 'username' => $username));
        }

        public function actionToggleMatchNotifications()
        {
            if (User::isCurrentUserAdmin())
            {
                $bit = intval($_GET['value']);
                $bit = ($bit == 0) ? 1 : 0;
                $mod = new MatchNotification();
                $mod->status = $bit;
                $mod->date_modified = date('Y-m-d H:i:s');
                $userinfo = User::getCurrentUser();
                $mod->userid = $userinfo['id'];
                $mod->save();
                $userid = $mod->getUserId();
                $user = User::model()->find("id=:id", array(':id' => $userid));
                $state = ($mod->isGlobalNotificationOn()) ? '1' : '0';
                $data = Array('userid' => $userid, 'status' => $state, 'last_modified' => $mod->getLastDate(), 'username' => $user['username']);
                echo CJSON::encode($data);
            }
        }

        public function actionCheckNotificationState()
        {
            if (User::isCurrentUserAdmin())
            {
                $matchnotification = MatchNotification::model()->findBySql("SELECT * FROM match_notification ORDER BY date_modified DESC limit 1");
                $status = Array('status' => $matchnotification['status'], 'date_modified' => $matchnotification['date_modified'], 'userid' => $matchnotification['userid']);
                $user = User::model()->find("id=:id", array(':id' => $matchnotification['userid']));
                $status['username'] = $user['username'];
                echo CJSON::encode($status);
            }
        }

        //Ajax calls
        public function actionGetInbox()
        {
            $username = Yii::app()->user->name;
            $user = User::model()->find("username=:username", array(':username' => $username));
            $messages = array();
            foreach ($user->messagesReceived(array('order' => 'id DESC')) as $aMessage)
            {
                if ($aMessage->been_deleted == 0)
                    $messages[] = $aMessage;
            }

            print CJSON::encode($messages);
        }

        public function actionGetMessage($id)
        {
            $message = Message::model()->findByPK($id);
            print CJSON::encode($message);
        }

        public function actionGetSent()
        {
            $username = Yii::app()->user->name;
            $user = User::model()->find("username=:username", array(':username' => $username));
            $messages = array();
            foreach ($user->messagesSent(array('order' => 'id DESC')) as $aMessage)
            {
                if ($aMessage->sender_deleted == 0)
                    $messages[] = $aMessage;
            }

            print CJSON::encode($messages);
        }

        public function actionGetReceiver()
        {
            $username = Yii::app()->user->name;
            $user = User::model()->find("username=:username", array(':username' => $username));

            print CJSON::encode($user);
        }

        public function actionGetTrash()
        {
            $username = Yii::app()->user->name;
            $user = User::model()->find("username=:username", array(':username' => $username));
            $messages = array();
            foreach ($user->messagesSent(array('order' => 'id DESC')) as $aMessage)
            {
                if ($username == $aMessage->FK_sender)
                {
                    if ($aMessage->sender_deleted == 1)
                        $messages[] = $aMessage;
                }
            }

            foreach ($user->messagesReceived(array('order' => 'id DESC')) as $aMessage)
            {
                if ($aMessage->been_deleted == 1)
                    $messages[] = $aMessage;
            }

            print CJSON::encode($messages);
        }

        /**
         * Rene: Fix for bug #677.
         */
        public function actionSetAsRead($id)
        {
            $message = Message::model()->findByPk($id);

            if ($message->FK_receiver == Yii::app()->user->name)
            {
                // Read by receiver.
                $message->been_read = 1;
                $message->save();

                // Fix the notification.
                Notification::markMessageNotificationAsRead($id);
            }

            // Check if sender is current user.
            else if ($message->FK_sender == Yii::app()->user->name)
            {
                // Create mark as read by sender code.
                return;
            }
        }

        public function actionSentToTrash()
        {
            $username = Yii::app()->user->name;
            $ids = $_REQUEST['messages'];

            foreach ($ids as $id)
            {
                $theId = intval($id);
                $message = Message::model()->findByPK($theId);

                //Same message is marked defferently depending on the user 
                //This allow us to later show it in the right Trash Box
                if($username == $message->FK_sender)
                    $message->sender_deleted = 1;

                // Check if user is the receiver.
                if($username == $message->FK_receiver)
                {
                    // Mark the notification associated with this message as read.
                    Notification::markMessageNotificationAsRead($theId);
                    $message->been_deleted = 1;
                }

                $message->save(false);
            }
        }

        /**
         * Rene: Used to delete a message.
         * Fixes card #685.
         */
        public function actionDeleteMessage()
        { //Delete messages from the trash box
            $username = Yii::app()->user->name;
            $ids = $_REQUEST['messages'];
            
            foreach ($ids as $id)
            {
                $theId = intval($id);
                $message = Message::model()->findByPK($theId);

                //The -1 for the been_deleted and sender_deletedmeans 
                //it wont be shonw no more to that user 
                //and that is ok to be deleted from his side.
                
                // Check if sender matches.
                if ($username == $message->FK_sender)
                {
                    if ($message->been_deleted == -1)
                        Message::model()->deleteByPK($theId);

                    else
                    {
                        $message->sender_deleted = -1;
                        $message->save(false);
                    }
                }

                // Check if receiver matches.
                if ($username == $message->FK_receiver)
                {
                    // Delete the notification associated with the message that will be deleted.
                    $receiverObj = User::model()->find("username=:username", array(':username' => $username));
                    $n = Notification::model()->findByAttributes(array('msgID' => $theId, 'receiver_id' => $receiverObj->id));
                    $n->delete();

                    if ($message->sender_deleted == -1)
                        Message::model()->deleteByPK($theId);

                    else
                    {
                        $message->been_deleted = -1;
                        $message->save(false);
                    }
                }
            }
        }

        public function actionRecoverMessages()
        { //Restore messages from the trash box original location
            echo "test";
            $username = Yii::app()->user->name;
            $ids = $_REQUEST['messages'];
            foreach ($ids as $id)
            {
                $theId = intval($id);
                $message = Message::model()->findByPK($theId);

                // Recover the 
                if ($username == $message->FK_sender && $message->sender_deleted == 1)
                {
                    $message->sender_deleted = 0;
                    $message->save(false);
                }

                // Recover for receiver.
                if ($username == $message->FK_receiver && $message->been_deleted == 1)
                {
                    // Check if message has been not read. 
                    if($message->been_read == 0) // Then actualize the notification.
                        Notification::markMessageAsUnRead($theId);
                        
                    $message->been_deleted = 0;
                    $message->save(false);
                }
            }
        }

        public function actionAutoComplete()
        {
            $users = array();

            if (isset($_GET['term']))
            {

                $models = User::model()->findAll();

                foreach ($models as $aUser)
                {
                    $users[] = array(
                        'name' => $aUser->username,
                        'label' => $aUser->username,
                        'id' => $aUser->id,
                    );
                }
            }

            print "<pre>";
            print_r($users);
            print "</pre>";
            return;
            print CJSON::encode($users);
        }

        // Parsing the recipient list to their user names and return and array
        private function getReceivers($string)
        {
            $receivers = array();
            $startPos = strpos($string, "<");
            while ($startPos !== false)
            {
                $endPos = strpos($string, ">");
                $receivers[] = substr($string, $startPos + 1, $endPos - $startPos - 1);

                $string = substr($string, $endPos + 2);

                if ($string)
                    $startPos = strpos($string, "<");
                else
                    $startPos = false;
            }
            return $receivers;
        }

        //Specifies access rules
        public function accessRules()
        {
            return array(
                array('allow', // allow authenticated users to perform these actions
                    'actions' => array('Index', 'Send', 'getInbox', 'getMessage', 'getSent',
                        'setAsRead', 'sentToTrash', 'getTrash', 'deleteMessage', 'recoverMessages',
                        'autoComplete', 'toggleMatchNotifications', 'checkNotificationState', 'getReceiver'),
                    'users' => array('@'),
                    'expression'=>'User::getCurrentUser()->FK_usertype <= 3',),
                
                
                array('deny', //deny all users anything not specified
                    'users' => array('*'),
                    'message' => 'Access Denied.'),
            );
        }

        public function filters()
        {
            // return the filter configuration for this controller, e.g.:
            return array(
                'accessControl',
            );
        }
    }
    