<?php

    /**
     * This is the model class for table "job_match". It keeps track of what student is 
     * matched to what job.
     *
     * The followings are the available columns in table 'job_match':
     * 
     * The followings are the available columns in table 'job_match':
     * @property integer $id
     * @property integer $jobID
     * @property integer $studentID
     * 
     * @author Rene Alfonso
     * Changing the name to 'JobMatch' will cause problems.
     */
    class JobMatchRelation extends CActiveRecord
    {
        /**
         * Returns the static model of the specified AR class.
         * @param string $className active record class name.
         * @return JobMatch the static model class
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
            return 'job_match';
            
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
            // NOTE: you should only define rules for those attributes that
            // will receive user inputs.
            return array(
		array('jobID, studentID', 'required'),
		array('jobID, studentID', 'numerical', 'integerOnly'=>true),
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
                'jobID' => 'JobID',
                'studentID' => 'StudentID',

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

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('jobID',$this->jobID);
		$criteria->compare('studentID',$this->studentID);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}


    }
    