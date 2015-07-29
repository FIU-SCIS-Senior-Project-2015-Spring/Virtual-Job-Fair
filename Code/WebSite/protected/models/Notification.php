<?php

    /**
     * This is the model class for table "notification".
     *
     * The followings are the available columns in table 'notification':
     * @property integer $id
     * @property integer $sender_id
     * @property integer $receiver_id
     * @property string $datetime
     * @property integer $been_read
     * @property string $message
     */
    class Notification extends CActiveRecord
    {

        public $keyid;

        /**
         * R    eturns the static model of the specified AR class.
         * @param string $className active record class name.
         * @return Notification the static model class
         */
        public static function model($className = __CLASS__)
        {
            return parent::model($className);
        }

        /**
         * @return string the associated database table name
         */
        public function tableName()
        {
            return 'notification';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
            // NOTE: you should only define rules for those attributes that
            // will receive user inputs.
            return array(
                array('id, sender_id, receiver_id, datetime, been_read', 'required'),
                array('id, sender_id, receiver_id, been_read', 'numerical', 'integerOnly' => true),
                array('message', 'length', 'max' => 5000),
                // The following rule is used by search().
                // Please remove those attributes that should not be searched.
                array('id, sender_id, receiver_id, datetime, been_read, message', 'safe', 'on' => 'search'),
            );
        }

        /**
         * @return array relational rules.
         */
        public function relations()
        {
            // NOTE: you may need to adjust the relation name and the related
            // class name for the relations automatically generated below.
            return array(
            );
        }

        /**
         * @return array customized attribute labels (name=>label)
         */
        public function attributeLabels()
        {
            return array(
                'id' => 'ID',
                'sender_id' => 'Sender',
                'receiver_id' => 'Receiver',
                'datetime' => 'Datetime',
                'been_read' => 'Been Read',
                'message' => 'Message',
                'link' => 'Link',
                'importancy' => 'Importancy',
                'msgID' => 'MessageID',
                'jobMatchID' => 'JobMatchID',
            );
        }

        /**
         * Retrieves a list of models based on the current search/filter conditions.
         * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
         */
        public function search()
        {
            // Warning: Please modify the following code to remove attributes that
            // should not be searched.

            $criteria = new CDbCriteria;

            $criteria->compare('id', $this->id);
            $criteria->compare('sender_id', $this->sender_id);
            $criteria->compare('receiver_id', $this->receiver_id);
            $criteria->compare('datetime', $this->datetime, true);
            $criteria->compare('been_read', $this->been_read);
            $criteria->compare('message', $this->message, true);

            return new CActiveDataProvider($this, array(
                'criteria' => $criteria,
            ));
        }

        public function getNotificationId($id)
        {
            $no = Notification::model()->findAllByAttributes(array('receiver_id' => $id), array("order" => "id desc"));

            return $no;
        }

        /**
         * Mark a notification as read. Do some extra checks for Message notifications.
         * @param type $id The id of the notification.
         * @author Rene Alfonso
         */
        public static function markHasBeenRead($id)
        {
            $notification = Notification::model()->findByPk($id);

            // Instead of original code, check if notification is a msg type.
            if (isset($notification->msgID))
            {
                // Then to make it read the message must actually be read.
                // Find the Message related to this notification.
                $m = Message::model()->find("id=:id", array('id' => $notification->msgID));

                // Check if Message was read.
                if ($m->been_read != null && $m->been_read == 1)
                    $notification->been_read = 1;
            }
            else // For other type of notifications.
                $notification->been_read = 1;

            // Always save.
            $notification->save(false);
        }

        /**
         * Use this for changing Message notifications to read.
         * @param type $msgID the ID of the message.
         * @author Rene Alfonso
         */
        public static function markMessageNotificationAsRead($msgID)
        {
            try
            {
                $n = Notification::model()->find("msgID=:msgID", array('msgID' => $msgID));

                $n->been_read = 1;
                $n->save(false);
            } 
            catch (Exception $ex)
            {
                
            }
        }
        
        /**
         * Use this for changing Message notifications to unread.
         * @param type $msgID the ID of the message.
         * @author Rene Alfonso
         */
        public static function markMessageAsUnRead($msgID)
        {
            try
            {
                $n = Notification::model()->find("msgID=:msgID", array('msgID' => $msgID));

                $n->been_read = 0;
                $n->save(false);
            } 
            catch (Exception $ex)
            {
                
            }
        }

        /**
         * Rene: Someone started this code on the User model, that was a bad idea.
         * I moved it to the notifications model. 
         * This is part of Bug fix #
         * @param type $senderObj The User model object that sent the message.
         * @param type $reciver The username of the receiver.
         * @param type $link Link to the message.
         * @author Rene Alfonso
         */
        public static function createMessageNotification($senderObj, $receiver, $link, $msgID)
        {
            // Create a new model.
            $model = new Notification;

            // Save the id.
            $model->sender_id = $senderObj->id;

            // Look in database for the matching username. 
            $receiverObj = User::model()->find("username=:username", array(':username' => $receiver));

            // If not null, then actually save the notification.
            if ($receiverObj != NULL)
            {
                $model->receiver_id = $receiverObj->id;
                $model->datetime = date('Y-m-d H:i:s');
                $model->been_read = 0;
                $model->link = $link;

                $model->message = 'You have a new message from ' . $senderObj->username;
                $model->importancy = 3;

                $model->msgID = $msgID;
                $model->save(false);
            }
        }

    }
    