<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class GuestEmployerPostForm extends CFormModel
{
    public $type;
    public $title;
    public $description;
    public $compensation;
    public $deadline;
    public $email;
    public $verifyEmail;
    
    /**
     * Declares the validation rules.
     * The rules state that username and password are required,
     * and password needs to be authenticated.
     */
    public function rules(){
        return array(
            array('type, title, description, deadline, email, verifyEmail', 'required'),
            array('email', 'email'),
            array('verifyEmail', 'email'),
            array('email, verifyEmail', 'verify')
        );
    }
    /**
    * Declares customized attribute labels.
    * If not declared here, an attribute would have a label that is
    * the same as its name with the first letter in upper case.
    */
    public function attributeLabels()
    {
            return array(
                'type'=>'Type',
                'title' => 'Tittle',
                'description' => 'Description',
                'compensation' => 'Compensation',
                'deadline' => 'Deadline',
                'email' => 'Email',
                'verifyEmail' => 'Retype Email'
            );
    }
    
    /**
    * Verifies the email was typed in corrrectly.
    * This is the 'verify' validator as declared in rules().
    */    
    public function verify(){
        if(!$this->hasErrors()){
            if(!strcasecmp( $this->email , $this->verifyEmail )==0){
                $this->addError('email', "The emails don't match. Please check again.");
                return false;
            }
        }
        return true;        
    }
    
    
}