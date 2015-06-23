<?php

    /**
     * This is the model class for table "cover_letter".
     *
     * The followings are the available columns in table 'cover_letter':
     * @property integer $id
     * @property string $file_path
     * 
     * @author Rene Alfonso
     */
    class CoverLetter extends CActiveRecord
    {

        /**
         * Returns the static model of the specified AR class.
         * @param string $className active record class name.
         * @return CoverLetter the static model class
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
            return 'cover_letter';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
            // NOTE: you should only define rules for those attributes that
            // will receive user inputs.
            return array(
                array('id', 'required'),
                array('id', 'numerical', 'integerOnly' => true),
                array('file_path', 'length', 'max' => 100),
                array('file_path', 'file', 'types'=>'pdf'),
                array('id', 'safe', 'on' => 'search'),
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
                'file_path' => 'File Path',
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
            $criteria->compare('file_path', $this->file_path, true);

            return new CActiveDataProvider($this, array('criteria' => $criteria,));
        }

    }
    