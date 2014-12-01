<?php

namespace monster;
class monsterJobs 
{
    
    public static function getJobResults($keywords, $location)
    {        
        //$url = "http://rss.jobsearch.monster.com/rssquery.ashx?q=Computer%20Software,$keywords&rad_units=miles&brd=5&cy=US&pp=50&sort=rv.di.dt&geo=$location,32.18688,,,376&baseurl=jobview.monster.com";
        $location = urlencode($location);
        $keywords = urlencode($keywords);
        $url = "http://rss.jobsearch.monster.com/rssquery.ashx?q=Computer%20Software,%20Programming,".$keywords."&rad_units=miles&brd=5&cy=US&pp=50&sort=rv.di.dt&geo=".$location.",32.18688,,,376&baseurl=jobview.monster.com";
        $xml = simplexml_load_file($url);
        $jobsCollection = Array();
        $currItem = 1;
        //$skillset = Array();
        $skillset = \Skillset::model()->findAll();
        
        foreach($xml->channel->item as $item)
        {
            $currJob = new Job();                                     
            //$title = $item->title;
            $description = (string)$item->description;
            //var_dump($description);die;
            $currJob->title = (string)$item->title;  //position
            $currJob->companyName = "";      // not available
            $currJob->jobURL = (string)$item->link; //link to the job
            $pubDate = (string)$item->pubDate;      //opening/posting date
            $currJob->posted = strftime("%m/%d/%Y", strtotime($pubDate));
            $currJob->description = (string)$description;   //short description 
            
            foreach($skillset as $s)
            {                
                $skill = (string)$s->name;                
                if(strtok($description, $skill) === $description)
                {
                    $currJob->skills .= ucwords($skill)." ";
                }
                else
                {
                    $currJob->skills .= " ";
                }
            }
            
            $jobsCollection[$currItem] = $currJob;            
            $currItem++;
        }             
        return $jobsCollection;
    }  
    
}
class Job
{    
    public $title = "";
    public $companyName = "";
    public $city = "";
    public $state = "";
    public $skills = "";
    public $description = "";
    public $type = "";
    public $posted = "";
    public $jobURL = "";
    public $pay = "";
    
    public function getCompanyName($maxLength = null) 
    {
        if($this->companyName != null && $maxLength != null && strlen($this->companyName) > $maxLength) {
            return substr($this->companyName, 0, $maxLength-3)."...";
        } else {
            return $this->companyName;
        }
    }
    
    public function getJobDescription() 
    {
        return $this->description;
    }
}
?>

