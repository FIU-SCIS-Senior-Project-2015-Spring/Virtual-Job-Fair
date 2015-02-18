<?php
/**
 * Class githubJobsapi
 * @package githubJobs
 * source: http://jobs.github.com/api
 */
namespace githubJobs;

class githubJobsapi
{
   public static function getJobResults($keywords, $location)
    {          
        $location = urlencode($location);
        $keywords = urlencode($keywords);
        $url = "http://jobs.github.com/positions.json?description=$keywords&location=$location";
        $jsondata = file_get_contents($url); //get JSON from url
        $json = json_decode($jsondata,true); //convert JSON to PHP
        //foreach($json as $job) echo $job['title'];
        $jobsCollection = Array();
        $currItem = 1;
        $skillset = \Skillset::model()->findAll();
        foreach($json as $item)
        {
            $currJob = new Job();                 
            
            $skills = $item['description'];           
            $currJob->title = $item['title'];
            $currJob->companyName = $item['company'];
            $currJob->jobURL = $item['url'];
            $currJob->type = $item['type'];
            $pubDate = (string)$item['created_at'];
            $currJob->posted = strftime("%m/%d/%Y", strtotime($pubDate));
            $currJob->description = $item['description'];
            $source = "GitHub Jobs";
            $description = (string)$item['description'];
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
//            foreach($item['Requirements'] as $skill)
//            {
//                $currJob->skills .= ucwords((string)$skill)." ";
//                //print_r($currJob->skills." ");
//            }
            
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
    
    
}
?>

