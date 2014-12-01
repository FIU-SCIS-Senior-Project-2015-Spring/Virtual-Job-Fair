<?php

namespace stackOverflow;

class StackOverflow
{
    //public static $url = "http://careers.stackoverflow.com/jobs/feed?location=Miami%2c+Florida&range=300&distanceUnits=Miles";
    public static function getJobCount($keywords, $location)
    {
        $location = urlencode($location);
        $keywords = urlencode($keywords);
        $url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=$keywords&location=$location&range=300&distanceUnits=Miles&allowsremote=true";
        //$url = StackOverflow::$url;
        //$url = "http://careers.stackoverflow.com/jobs/feed?location=Miami%2c+Florida&range=300&distanceUnits=Miles";
        //$xml = simplexml_load_file($url);
        try {$xml = simplexml_load_file($url);}
        catch(Exception $e){print_r($e);}
        $count = (int)$xml->channel->children('os', true)->totalResults;
        return $count;
    }
    public static function getJobResults($keywords, $location)
    {        
        //$url = "http://careers.stackoverflow.com/jobs/feed?location=Miami%2c+Florida&range=300&distanceUnits=Miles";
        $location = urlencode($location);
        $keywords = urlencode($keywords);
        $url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=$keywords&location=$location&range=150&distanceUnits=Miles&allowsremote=true";
        $xml = simplexml_load_file($url);
        $jobsCollection = Array();
        $currItem = 1;
        foreach($xml->channel->item as $item)
        {
            $currJob = new Job();                                     
            $title = $item->title;       
            $description = $item->description;
            $skills = $item->category;
            $position = strstr($title," at",true);            
            $tempStr = substr($title, strpos($title," at")+2);
            $company = substr($tempStr,1, strpos($tempStr, " (")-1);
            $currJob->title = $position;
            $currJob->companyName = $company;
            $currJob->jobURL = (string)$item->link;
            $pubDate = (string)$item->pubDate;
            $currJob->posted = strftime("%m/%d/%Y", strtotime($pubDate));
            $currJob->description = $description;
            $source = "Stack Overflow Careers";
            //print_r("Skills needed: ");
            foreach($item->category as $skill)
            {
                $currJob->skills .= ucwords((string)$skill)." ";
                //print_r($currJob->skills." ");
            }
            //print_r($currJob->skills." ");
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


