<!-- ****  DO NOT REMOVE **** -->
<!-- DataTable -->
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
<!-- **** **** -->

<?php
$i = 0; $j = 0; $k = 0; $m = 0; $n = 0; $g = 0;
$sizeJobs = 0; $sizeIndeed = 0; $sizeCB = 0;$sizeST = 0; $sizeMJ = 0;$sizeGH = 0;

settype($size, "integer");
if (!isset($_GET['allWords'])) {
	$_GET['allWords'] = '';
}
if (!isset($_GET['phrase'])) {
    $_GET['phrase'] = '';
}
if (!isset($_GET['anyWord'])) {
    $_GET['anyWord'] = '';
}
if (!isset($_GET['minus'])) {
    $_GET['minus'] = '';
}
if (!isset($_GET['tagName'])) {
    $_GET['tagName'] = '';
}
if (!isset($_GET['radioOption'])) {
    $_GET['radioOption'] = '';
}
if (!isset($_GET['city'])) {
    $_GET['city'] = '';
}

?>


<?php if (isset($suc) && $suc == true) { var_dump("here");die;?>
    $('#saveSuc').show();
<?php } ?>
<?php if (isset($suc) && $suc == false) { ?>
    $('#saveErr').show();
<?php } ?>

<script>

    function myFunction()
    {
        document.getElementById("searchForm").action = "/JobFair/index.php/job/home";
        document.getElementById("searchForm").submit();
    }

    function saveQuery()
    {
        var leng = document.getElementById("tagName").value.length;

        if(leng == 0 ){
           $('#alertEmpty').show();
        }
        if(leng > 25){
            $('#alertBig').show();
        }
        if(leng > 0 && leng < 25)
        {
            document.getElementById("searchForm").action = "/JobFair/index.php/job/savequery";
            document.getElementById("searchForm").submit();
        }
    }

    function hideError()
    {
        $('#alertEmpty').hide();
        $('#alertBig').hide();
    }

    $(document).on('click', '#saveBT', saveQuery);

    $(document).on('click', '#btClose', hideError);

    $(document).ready(function()
    {
        $('#alertEmpty').hide();
        $('#alertBig').hide();
        var isChecked = $('#radioOption').is(':checked');
        $("#city").hide();
        $(document).on('click', '#radioOption', create);
        $clicked = 0;


        function create(e)
        {
            var value =  $('#radioOption').is(':checked');;
            if (value == true) {
                $("#city").show();
                isChecked = false;
            } else if (value == false) {
                $("#city").hide();
                isChecked = true;
            }
        }

        //var value = $('#radioOption').val();
        if (isChecked == true)
            $("#city").show();


       $('#jobtable').dataTable({
           "sPaginationType" : "full_numbers",
           "bSort":             false,
           "bFilter" :          false
        });

        $('#type').val(getURLParameter("type").replace(/[+]/g, " "));

        $('.pageclick').click(function(e) {
            //alert('.page' + $(this).text().replace(" ", ""));

            $('tr').hide();
            $('#headerrow').show();
            $('.currentpageclick').attr('class', 'pageclick');
            $('.page' + $(this).text().replace(" ", "")).show();
            $(this).attr('class', 'currentpageclick');

        });
        $('#firstpage').attr('class', 'currentpageclick');
});

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}
</script>

<div id="fullcontentjob">

<!-- --------------------- ADVANCED SEARCH ---------------------- -->
<div id="searchforjobs2" style="float:left;">
<div class="titlebox">Advanced Search  </div>
    <br/><br>
    <form method="GET" id="searchForm" action="">
        <h5> Queries Preferences</h5>
    
        <div style= "text-align:left; clear:both" >
            <p>Select queries to search for jobs</p>

            <div style= "text-align:left;">
                <?php foreach ($saveQ as $query) { ?>
                    <?php if($query['active'] == '1')
                    {?>
                        <div class="checkbox">
                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1" checked>
                            <strong> <?php echo ($query['query_tag']).":"; ?></strong> <?php echo ($query['query']); ?>
                            <del><a href="/JobFair/index.php/profile/deleteinterest?id=<?php echo $query->id?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                        </div>
                    <?php } else
                    {?>
                        <div class="checkbox">
                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1">
                            <strong> <?php echo ($query['query_tag']).":"; ?></strong> <?php echo ($query['query']); ?>
                            <del><a href="/JobFair/index.php/profile/deleteinterest?id=<?php echo $query->id?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                        </div>
                    <?php } ?>
                <?php } ?>
            </div>                    
        </div> 
      <h4>Find jobs with... </h4>
        <div>
            <strong>these words:</strong>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'allWords',
                'id'=>'allWords',
                'value'=> $_GET['allWords'],
                'htmlOptions'=>array('value'=> $_GET['allWords'],'placeholder' => 'put plus sign before word',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong>this exact word or phrase:</strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'phrase',
                'id'=>'phrase',
                'value'=> $_GET['phrase'],
                'htmlOptions'=>array('value'=> $_GET['phrase'],'placeholder' => 'put words or phrase in quotes',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong>any of these words:</strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'anyWord',
                'id'=>'anyWord',
                'value'=> $_GET['anyWord'],
                'htmlOptions'=>array('value'=> $_GET['anyWord'],'placeholder' => 'put OR between words',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong>none of these words:</strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'minus',
                'id'=>'minus',
                'value'=> $_GET['minus'],
                'htmlOptions'=>array('value'=> $_GET['minus'],'placeholder' => 'put minus sign before words',
                    'style'=>'width: 200px;'),)); ?>
            <!-- outside resources radio button -->
            <br> <div>
                <input type="checkbox" name="radioOption" id="radioOption" value="true"
                    <?php  if($_GET['radioOption'] == "true"){echo 'checked="checked"';} ?>  >
                <strong> Include jobs from outside sources</strong>
            </div>
            <!-- hidden box, DO NOT MAKE VISIBLE -->
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'city',
                'id'=>'city',
                'value'=> $_GET['city'],
                'htmlOptions'=>array('value'=> $_GET['city'], 'placeholder' => 'City, State',
                    'style'=>'width: 200px; display: none'),)); ?>
            <!-- search button -->
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'label'=>'Search',
                'type'=>'primary',
                'htmlOptions'=>array(
                    'data-toggle'=>'modal',
                    'data-target'=>'#myModal',
                    'id' => "searchbutton",
                    'style' => "margin-top: 5px; margin-bottom: 5px; width: 115px;",
                    'onclick' => "myFunction()",
                ),
            )); ?>
            <!-- save button -->
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'label'=>'Save Query',
                'type'=>'info',
                'htmlOptions'=>array(
                    'data-toggle'=>'modal',
                    'data-target'=>'#saveQmodal',
                    'href'=> "#saveQmodal",
                    'id' => "savebutton",
                    'style' => "margin-top: 5px; margin-bottom: 5px; width: 115px;",
                    'onclick' => "$('#saveQmodal').modal('show');",
                ),
            )); ?>
            <!-- Modal -->
            <div class="modal hide fade" id="saveQmodal" tabindex="-1">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Please enter query name</h4>
                    </div>
                    <div class="modal-body">
                        By saving a query, and setting up profile preferences you can receive emails with jobs
                        matching your criteria. <br>
                        <!-- tag name -->
                        <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                            'name'=>'tagName',
                            'id'=>'tagName',
                            'value'=> $_GET['tagName'],
                            'htmlOptions'=>array('value'=> $_GET['tagName'],
                            'style'=>'width: 200px;'),)); ?>
                        <br>
                        <strong>Remember to check profile settings to set preference. </strong>
                        <div id="alertEmpty" class="alert alert-error">
                            <strong>Error!</strong> The name cannot be left empty. Please try again.
                        </div>
                        <div id="alertBig" class="alert alert-error">
                            <strong>Error!</strong> The name cannot be greater then 25 characters. Please try again.
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btClose" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="saveBT" value="true">Save name</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        <!--  reset button-->
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'buttonType'=>'reset',
                'label'=>'Reset Fields',
                'htmlOptions'=>array(
                    'data-toggle'=>'modal',
                    'data-target'=>'#myModal',
                    'id' => "searchbutton",
                    'style' => "margin-top: 5px; margin-bottom: 5px;width: 140px;",
                    'onclick' =>'window.location = "/JobFair/index.php/job/home"',
                ),)); ?>
        </div>
    </form>
</div>
<!-- -----------  END OF ADVANCED SEARCH ------------------ -->


<!-- ----------------- SEARCH RESULTS --------------------- -->
 <div id ="jobcontent">    
 <?php if (isset($flag) && $flag == 2) { ?>
    <!-- ******* Job Postings from Job Page using external sources & Career Path *******  -->
    <table class="display" id="jobtable" style="max-width: 120%; width:100%">
     <?php if ($jobs == null && $result == "" && $cbresults == "" && $result3 =="" && $mjresults =="" && $ghresults=="")
         {?>
         <h3>Sorry, your search did not match any jobs </h3>
         <br>
         <strong>Search suggestions:</strong>
         <br>
         <ul type= "square">
             <li>Try more general keywords </li>
             <li>Check your spelling  </li>
             <li>Replace abbreviations with the entire word </li>
             <li>Try searching by position, skills, or company. </li>
         </ul>
     <?php } else { ?>
    <thead align="left"><th>Position</th> <th>Company</th> <th>Type</th>
        <th>Opening</th>  <!-- <th>Deadline</th>-->  <th>Salary</th>
        <th> Skills</th><th>Source</th>
    </thead>
     <!-- get size of all job results -->
    <?php
         // gets how many job from CareerPath
        if($jobs !=null & sizeof($jobs) > 0)
        {
            $sizeJobs = sizeof($jobs); $i = 0;
        }
         // gets how many job from Indeed
        if($result != null & sizeof($result) > 0)
        {
            $sizeIndeed = $result['end']; $j = 0; $results=$result['results'];
            //print_r($result);die;
        }
         // gets how many job from CareerBuilder
        if($cbresults != null & sizeof($cbresults) > 0)
        {
            $sizeCB = $cbresults[0]; $k = 1;
            if($sizeCB == 1) {$sizeCB =2;}
        }
        // gets how many job from StackOverflow
        if($result3 != null & sizeof($result3) > 0)
        {   
//            require_once 'protected/stackOverflow/StackOverflow.php';
//            $sizeST = stackOverflow\StackOverflow::getJobCount("","Miami, Florida");
            foreach($result3 as $job) { $sizeST++; }
            //var_dump($sizeST);
            $m = 1;
        }
        // gets how many job from Monster Jobs
        if($mjresults != null & sizeof($mjresults)>0)
        {
            foreach($mjresults as $job) { $sizeMJ++; }
            $n = 1;              
        }
        // gets how many job from GitHubJobs
        if($ghresults != null & sizeof($ghresults)>0)
        {
            foreach ($ghresults as $job) {$sizeGH++;}
            $g = 1;
        }
    ?>
    <tbody>
        <?php // There is only CareerPath jobs(when click on Jobs tab, no search query)
         if($j == $sizeIndeed && $k == $sizeCB && $m == $sizeST && $n == $sizeMJ && $sizeJobs > 0 )
         {
             foreach ($jobs as $job) 
             {?>
             <tr>
                 <td><a href="/JobFair/index.php/job/view/jobid/<?php echo $job->id;?>"><?php echo $job->title;?></a></td>
                 <td><a href="/JobFair/index.php/profile/employer/user/<?php echo User::model()->findByAttributes(array('id'=>$job->FK_poster))->username;?>"><?php echo CompanyInfo::model()->findByAttributes(array('FK_userid'=>$job->FK_poster))->name;?></a></td>
                 <td><?php echo $job->type;?></td>
                 <td><?php echo Yii::app()->dateFormatter->format('MM/dd/yyyy', $job->post_date);?></td>
<!--                 <td>--><?php //echo Yii::app()->dateFormatter->format('MM/dd/yyyy', $job->deadline);?><!--</td>-->
                 <td><?php echo $job->compensation;?></td>
                 <td>
                    <?php
                        $temp = JobSkillMap::model()->findAllByAttributes(array('jobid'=>$job->id));

                        foreach ($temp as $one)
                        {
                            $cur_skill = Skillset::model()->findByAttributes(array('id'=>$one->skillid))->name;

                            $this->widget('bootstrap.widgets.TbLabel', array(
                            'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                            'label'=>strtolower($cur_skill),
                            ));
                            echo ' ';
                        }
                        if (count($temp) <= 0)
                        {
                            $this->widget('bootstrap.widgets.TbLabel', array(
                                'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                'label'=>'N/A',
                            ));
                        }
                    ?>
                 </td>
                 <td><a href="/JobFair/index.php/job/view/jobid/<?php echo $jobs[$i]->id;?>">
<img src="http://www.alumnicareerservices.org/Portals/0/FIU%20Career%20Services.png" width="125px" height="75px" alt="CareerPath"/>
</a></td>
             </tr>
            <?php
            }
         }
         else{?>
           <?php  while($j != $sizeIndeed || $k != $sizeCB || $i != $sizeJobs || $m != $sizeST || $n != $sizeMJ)
           {
               if($i < $sizeJobs) { ?> <!-- CareerPath -->
                   <tr>
                       <td><a href="/JobFair/index.php/job/view/jobid/<?php echo $jobs[$i]->id;?>"><?php echo $jobs[$i]->title;?></a></td>
                       <td><a href="/JobFair/index.php/profile/employer/user/<?php echo User::model()->findByAttributes(array('id'=>$jobs[$i]->FK_poster))->username;?>"><?php echo CompanyInfo::model()->findByAttributes(array('FK_userid'=>$jobs[$i]->FK_poster))->name;?></a></td>
                       <td><?php echo $jobs[$i]->type;?></td>
                       <td><?php echo Yii::app()->dateFormatter->format('MM/dd/yyyy', $jobs[$i]->post_date);?></td>
<!--                       <td>--><?php //echo Yii::app()->dateFormatter->format('MM/dd/yyyy', $jobs[$i]->deadline);?><!--</td>-->
                       <td><?php echo $jobs[$i]->compensation;?></td>
                       <td>
                            <?php
                                $temp = JobSkillMap::model()->findAllByAttributes(array('jobid'=>$jobs[$i]->id));
                                foreach ($temp as $one)
                                {
                                    $cur_skill = Skillset::model()->findByAttributes(array('id' => $one->skillid))->name;
                                    $this->widget('bootstrap.widgets.TbLabel', array(
                                        'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                        'label'=>strtolower($cur_skill),
                                    ));
                                    echo ' ';
                                }
                                if (count($temp) <= 0)
                                {
                                    $this->widget('bootstrap.widgets.TbLabel', array(
                                        'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                        'label'=>'N/A',
                                    ));
                                }
                            ?>
                       </td>
                       <td><?php echo "CareerPath"?></td>
                   </tr>
                   
               <?php $i++; }
               if($j < $sizeIndeed && $sizeIndeed > 1){ ?> <!-- Indeed -->
                <tr>
                    <td><a href=<?php echo $results['result'][$j]['url']; ?> target="_blank">
                            <?php if($results['result'][$j]['jobtitle'] != null) {echo $results['result'][$j]['jobtitle'];}
                            else {echo "N/A";}?></a></td>
                    <td><?php if($results['result'][$j]['company'] != null) { echo $results['result'][$j]['company'];}
                        else {echo "N/A";}?></a></td>
                    <td>N/A</td>
                    <td><?php
                        if($results['result'][$j]['date'] != null)
                        {
                            $date_str = $results['result'][$j]['date'];
                            echo date('m/d/Y', strtotime($date_str));
                        }
                        else {echo "N/A";}
                        ?></td>
<!--                    <td>N/A</td>-->
                    <td>N/A</td>
                    <td>
                        <?php
                        if($results['result'][$j]['snippet'] != null)
                        {
                            $in_skill_list = explode(' ', $results['result'][$j]['snippet']);
                            foreach ($in_skill_list as $in_skill)
                            {
                                $this->widget('bootstrap.widgets.TbLabel', array(
                                    'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                    'label'=>strtolower($in_skill),
                                ));
                                echo ' ';
                            }
                        }
                        else
                        {
                            $this->widget('bootstrap.widgets.TbLabel', array(
                                'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                'label'=>'N/A',
                            ));
                            echo ' ';
                        }
                        ?>
                    </td>
                    <td><?php echo "CareerPath"?></td>
               </tr>
               <!-- Indeed -->
               <?php $j++; }
               if($sizeIndeed == 1)
               {?>
                   <tr>
                       <td><a href=<?php echo $results['result']['url']; ?> target="_blank">
                               <?php if($results['result']['jobtitle'] != null) {echo $results['result']['jobtitle'];}
                               else {echo "N/A";}?></a></td>
                       <td><?php if($results['result']['company'] != null) { echo $results['result']['company'];}
                           else {echo "N/A";}?></a></td>
                       <td>N/A</td>
                       <td><?php if($results['result']['date'] != null)
                           {
                               $date_str = $results['result']['date'];
                               echo date('m/d/Y', strtotime($date_str));
                           }
                           else {echo "N/A";} ?></td>
<!--                       <td>N/A</td>-->
                       <td>N/A</td>
                       <td>
                           <?php
                           if($results['result']['snippet'] != null)
                           {
                               $in_skill_list = explode(' ', $results['result']['snippet']);
                               foreach ($in_skill_list as $in_skill)
                               {
                                   $this->widget('bootstrap.widgets.TbLabel', array(
                                       'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                       'label'=>strtolower($in_skill),
                                   ));
                                   echo ' ';
                               }
                           }
                           else
                           {
                               $this->widget('bootstrap.widgets.TbLabel', array(
                                   'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                   'label'=>'N/A',
                               ));
                               echo ' ';
                           }
                           ?>
                       </td>
                       <td><a href=<?php echo $results['result']['url']; ?> target="_blank">
                           <img src="http://www.indeed.com/images/job_search_indeed.png" alt="Indeed"/>
                           </a>
                       </td>
                   </tr>
              <?php $j++;             
                }
               if($k < $sizeCB && $sizeCB > 0)
               {  ?>  <!-- CareerBuilder -->
                <tr>
                    <td><a href=<?php echo $cbresults[$k]->jobDetailsURL; ?> target="_blank">
                            <?php if($cbresults[$k]->title != null) {echo $cbresults[$k]->title;}
                            else {echo "N/A";}?></a></td>
                    <td><?php if($cbresults[$k]->companyName != null) { echo $cbresults[$k]->companyName;}
                        else {echo "N/A";}?></td>
                    <td><?php if($cbresults[$k]->type != null) { echo $cbresults[$k]->type;}
                        else {echo "N/A";}?></td>
                    <td><?php if($cbresults[$k]->posted != null) {echo $cbresults[$k]->posted;}
                        else {echo "N/A";} ?></td>
<!--                    <td>N/A</td>-->
                    <td><?php if($cbresults[$k]->pay != null) {echo '<small>'.$cbresults[$k]->pay.'</small>';}
                        else {echo "N/A";} ?></td>
                    <td>
                        <?php
                        if($cbresults[$k]->skills != null)
                        {
                            $in_skill_list = explode(' ', $cbresults[$k]->skills);
                            $uniqueSkill = array_unique($in_skill_list);

                            foreach ($uniqueSkill as $in_skill)
                            {
                                $this->widget('bootstrap.widgets.TbLabel', array(
                                    'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                    'label'=>strtolower($in_skill),
                                ));
                                echo ' ';
                            }
                        }
                        else
                        {
                            $this->widget('bootstrap.widgets.TbLabel', array(
                                'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                'label'=>'N/A',
                            ));
                            echo ' ';
                        }
                        ?>
                    </td>
                    <td><a href=<?php echo $cbresults[$k]->jobDetailsURL; ?> >
                        <img src="http://www.wirestaurant.org/images/logo/CareerBuilder_300.gif" alt="CareerBuilder"/>
                        </a></td>
                </tr> <!--StackOverflow-->
                <?php $k++;
                } 
                if($m < $sizeST && $sizeST > 0)
                {  ?>  
                <tr>
                    <td><a href=<?php echo $result3[$m]->jobURL;?> title="StackOverflow"><!--target="_blank"-->
                        <?php if($result3[$m]->title != null) {echo $result3[$m]->title;}
                              else {echo "N/A";}?></a></td>
                    <td><?php if($result3[$m]->companyName != null) { echo $result3[$m]->companyName;}
                              else {echo "N/A";}?></a></td>
                    <td><?php if($result3[$m]->type != null) { echo $result3[$m]->type;}
                              else {echo "N/A";}?></td>
                    <td><?php if($result3[$m]->posted != null) {echo $result3[$m]->posted;}
                              else {echo "N/A";} ?></td>
<!--                    <td>N/A</td>-->
                    <td><?php if($result3[$m]->pay != null) {echo '<small>'.$result3[$m]->pay.'</small>';}
                              else {echo "N/A";} ?></td>
                    <td><?php if($result3[$m]->skills != null)
                            {
                                $in_skill_list = explode(' ', $result3[$m]->skills);
                                $uniqueSkill = array_unique($in_skill_list);

                                foreach ($uniqueSkill as $in_skill)
                                {
                                    $this->widget('bootstrap.widgets.TbLabel', array(
                                        'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                        'label'=>strtolower($in_skill),
                                    ));
                                    echo ' ';
                                }
                            }
                            else
                            {
                                $this->widget('bootstrap.widgets.TbLabel', array(
                                    'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                    'label'=>'N/A',
                                ));
                                echo ' ';
                            }
                        ?>
                    </td>
                    <td><a href=<?php echo $result3[$m]->jobURL;?> >
                        <img src="http://www.userlogos.org/files/logos/pek/stackoverflow2.png" alt="StackOverflow"/>
                        </a>
                    </td>
                </tr>
                <?php $m++; }
                //<!--Monster JOBS-->
                if($n < $sizeMJ && $sizeMJ > 0)
                {  ?>  
                <tr>
                    <td><a href=<?php echo $mjresults[$n]->jobURL;?> title="MonsterJobs"><!--target="_blank"-->
                        <?php if($mjresults[$n]->title != null) {echo $mjresults[$n]->title;}
                              else {echo "N/A";}?></a></td>
                    <td><a href=<?php echo $mjresults[$n]->jobURL;?> title="ClickHere">
                        <?php if($mjresults[$n]->companyName != null) { echo $mjresults[$n]->companyName;}
                              else {echo "Company Info";}?></a></td>
                    <td><?php if($mjresults[$n]->type != null) { echo $mjresults[$n]->type;}
                              else {echo "N/A";}?></td>
                    <td><?php if($mjresults[$n]->posted != null) {echo $mjresults[$n]->posted;}
                              else {echo "N/A";} ?></td>
<!--                    <td>N/A</td>-->
                    <td><?php if($mjresults[$n]->pay != null) {echo '<small>'.$mjresults[$n]->pay.'</small>';}
                              else {echo "N/A";} ?></td>
                    <td><?php if($mjresults[$n]->skills != null)
                            {
                                $in_skill_list = explode(' ', $mjresults[$n]->skills);
                                $uniqueSkill = array_unique($in_skill_list);

                                foreach ($uniqueSkill as $in_skill)
                                {
                                    $this->widget('bootstrap.widgets.TbLabel', array(
                                        'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                        'label'=>strtolower($in_skill),
                                    ));
                                    echo ' ';
                                }
                            }
                            else
                            {
                                $this->widget('bootstrap.widgets.TbLabel', array(
                                    'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                    'label'=>'N/A',
                                ));
                                echo ' ';
                            }
                        ?>
                    </td>
                    <td><a href=<?php echo $mjresults[$n]->jobURL;?>> 
                        <img src="http://media.monster.com/mm/usen/my/144x30_monsterBug.gif" alt="MonsterJobs"/></a> 
                        </td>
                </tr>
                <?php $n++; }
                //<!--GITHUB JOBS-->
                if($g < $sizeGH && $sizeGH > 0)
                {  ?>  
                <tr>
                    <td><a href=<?php echo $ghresults[$g]->jobURL;?> title="GitHubJobs"><!--target="_blank"-->
                        <?php if($ghresults[$g]->title != null) {echo $ghresults[$g]->title;}
                              else {echo "N/A";}?></a></td>
                    <td><a href=<?php echo $ghresults[$g]->jobURL;?> title="ClickHere">
                        <?php if($ghresults[$g]->companyName != null) { echo $ghresults[$g]->companyName;}
                              else {echo "Company Info";}?></a></td>
                    <td><?php if($ghresults[$g]->type != null) { echo $ghresults[$g]->type;}
                              else {echo "N/A";}?></td>
                    <td><?php if($ghresults[$g]->posted != null) {echo $ghresults[$g]->posted;}
                              else {echo "N/A";} ?></td>
<!--                    <td>N/A</td>-->
                    <td><?php if($ghresults[$g]->pay != null) {echo '<small>'.$ghresults[$g]->pay.'</small>';}
                              else {echo "N/A";} ?></td>
                    <td><?php if($ghresults[$g]->skills != null)
                            {
                                $in_skill_list = explode(' ', $ghresults[$g]->skills);
                                $uniqueSkill = array_unique($in_skill_list);
                
                                foreach ($uniqueSkill as $in_skill)
                                {
                                    $this->widget('bootstrap.widgets.TbLabel', array(
                                        'type'=>'default', // 'success', 'warning', 'important', 'info' or 'inverse'
                                        'label'=>strtolower($in_skill),
                                    ));
                                    echo ' ';
                                }
                            }
                            else
                            {
                                $this->widget('bootstrap.widgets.TbLabel', array(
                                    'type'=>'inverse', // 'success', 'warning', 'important', 'info' or 'inverse'
                                    'label'=>'N/A',
                                ));
                                echo ' ';
                            }
                        ?>
                    </td>
                    <td><a href=<?php echo $ghresults[$g]->jobURL;?> > 
                        <img src="http://media.creativebloq.futurecdn.net/sites/creativebloq.com/files/images/2013/06/16-logo.jpg" alt="GitHubJobs"/></a> 
                        </td>
                </tr>
                <?php $g++; }
                
                ?>
                
          <?php }
         }

     }?>
    </tbody>
 </table>
<?php } ?>
</div> <!-- END OF JOB RESULT TABLE-->

<div class="modal hide fade" id="saveSuc" tabindex="-1">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="modal-title">Query was saved Successfully! </h4>
        </div>
        <div class="modal-footer">
            <button type="button" id="btClose" class="btn btn-default" data-dismiss="modal">OK</button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->

<div class="modal hide fade" id="saveErr" tabindex="-1">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="modal-title">An error occurred while trying to save query. Please try again. </h4>
        </div>
        <div class="modal-footer">
            <button type="button" id="btClose" class="btn btn-default" data-dismiss="modal">OK</button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->


</div> <!-- END OF FULL CONTENT -->