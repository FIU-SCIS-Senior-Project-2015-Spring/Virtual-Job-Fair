<!-- ****  DO NOT REMOVE **** -->
<!-- DataTable -->
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
<!-- **** **** -->

<?php

$i = 0; $j = 0; $k = 0;
$sizeJobs = 0; $sizeIndeed = 0; $sizeCB = 0 ;


settype($size, "integer");

if (!isset($_GET['allWords'])) {
	$_GET['allWords'] = '';
}
if (!isset($_GET['city'])) {
    $_GET['city'] = '';
}
if (!isset($_GET['ZIPcode'])) {
    $_GET['ZIPcode'] = '';
}
if (!isset($_GET['school'])) {
    $_GET['school'] = '';
}
if (!isset($_GET['major'])) {
    $_GET['major'] = '';
}
if (!isset($_GET['graduationdate'])) {
    $_GET['graduationdate'] = '';
}
if (!isset($_GET['workedasa'])) {
    $_GET['workedasa'] = '';
} 
if (!isset($_GET['workedin'])) {
    $_GET['workedin'] = '';
}
if (!isset($_GET['tagName'])) {
    $_GET['tagName'] = '';
}

 

?>


<script>

    function myFunction()
    {
        document.getElementById("searchForm").action = "/JobFair/index.php/job/emphome";
        document.getElementById("searchForm").submit();
    }
    
    // Saves the Adv. Search Query.
    function saveEmpQuery()
    {              
        var leng = document.getElementById("tagName").value.length;
        
        if(leng == 0 )
        {
           $('#alertEmpty').show();
        }
        
        if(leng > 25){
            $('#alertBig').show();
        }
        if(leng > 0 && leng < 25)
        {
            document.getElementById("searchForm").action = "/JobFair/index.php/job/saveempquery";
            document.getElementById("searchForm").submit();
        }
    }
    
    // Check if save_button was clicked.
    $(document).on('click', '#saveempBT', saveEmpQuery);
    
    // Check if close_button was clicked.
    $(document).on('click', '#btClose', hideError);
      
    // Hides the error messages relating to saving the 'Adv. Search Query'.
    function hideError()
    {
        $('#alertEmpty').hide();
        $('#alertBig').hide();
    }
    
</script>


<div id="searchforjobs2" style="float:left;">
<div class="titlebox">Advanced Student Search  </div>
    <form method="GET" id="searchForm" action="">
        <br/><br>
    <h5> Queries Preferences</h5>
    
        <div style= "text-align:left; clear:both" >
            <p>Select queries to search for students</p>

            <div style= "text-align:left;">
                <?php foreach ($saveQ as $query) { ?>
                    <?php 
                        // Check if query has been used for a search.
                        if($query['active'] == '1') 
                    {?>
                        <div class="checkbox">
                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1" checked>
                            <strong> <?php echo ($query['query_tag']).":"; ?></strong> <?php echo ($query['query']); ?>
                            <del><a href="/JobFair/index.php/home/DeleteAdvSearchQueryEmp?id=<?php echo $query->id?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                        </div>
                    <?php } else
                    {?>
                        <div class="checkbox">
                            <input type="checkbox" name="<?php echo $query['id']; ?>" id="<?php echo $query['id']; ?>" value="1">
                            <strong> <?php echo ($query['query_tag']).":"; ?></strong> <?php echo ($query['query']); ?>
                            <del><a href="/JobFair/index.php/home/DeleteAdvSearchQueryEmp?id=<?php echo $query->id?>"><img src='/JobFair/images/ico/del.gif' width="10px" height="10px"/></a></del>

                        </div>
                    <?php } ?>
                <?php } ?>
            </div>                    
        </div>  
      <h4>Find students with... </h4>
        <div>
            <strong>these skills:</strong>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'allWords',
                'id'=>'allWords',
                'value'=> $_GET['allWords'],
                'htmlOptions'=>array('value'=> $_GET['allWords'],'placeholder' => 'put plus sign before skill',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong>this location:</strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'city',
                'id'=>'city',
                'value'=> $_GET['city'],
                'source'=> BasicInfo::getAllCity(),
                'htmlOptions'=>array('value'=> $_GET['city'],'placeholder' => 'write city',
                    'style'=>'width: 200px;'),)); ?>
           
            <br> <strong> went to this school: </strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'school',
                'id'=>'school',
                'value'=> $_GET['school'],
                'source'=> School::getAllSchools(),
                'htmlOptions'=>array('value'=> $_GET['school'],'placeholder' => 'name of the school',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong> has this major: </strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'major',
                'id'=>'major',
                'value'=> $_GET['major'],
                'source'=> Education::getAllMajors(),
                'htmlOptions'=>array('value'=> $_GET['major'],'placeholder' => 'major',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong> Graduation Date: </strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'graduationdate',
                'id'=>'graduationdate',
                'value'=> $_GET['graduationdate'],
                'source'=> Education::getAllGrad(),
                'htmlOptions'=>array('value'=> $_GET['graduationdate'],'placeholder' => 'Year-Month',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong> Has experience as a: </strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'workedasa',
                'id'=>'workedasa',
                'value'=> $_GET['workedasa'],
                'htmlOptions'=>array('value'=> $_GET['workedasa'],'placeholder' => 'worked as a',
                    'style'=>'width: 200px;'),)); ?>
            <br> <strong> Worked in what position: </strong><br>
            <?php $this->widget('zii.widgets.jui.CJuiAutoComplete',array(
                'name'=>'workedin',
                'id'=>'workedin',
                'value'=> $_GET['workedin'],
                'htmlOptions'=>array('value'=> $_GET['workedin'],'placeholder' => 'worked in',
                    'style'=>'width: 200px;'),)); ?>
            <br> <div>
                <input type="checkbox" name="ZIPcode" id="radioOption" value="true"
                    <?php  if($_GET['ZIPcode'] == "true"){echo 'checked="checked"';} ?>  >
                <strong> Order students by closest to you!</strong>
            </div>

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
            <?php
            $username = Yii::app()->user->name;
            $guestUser = User::model()->getGuestEmployerUser()->username;
            if(!strcasecmp($username,$guestUser) == 0){
                $this->widget('bootstrap.widgets.TbButton', array(
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
                )); 
            }                
                ?>
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
                                'style'=>'width: 200px;'),)); 
                        
                        // There is a bug below.
                        ?>
                        
                        
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
                        <button type="button" class="btn btn-primary" id="saveempBT" value="true">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
            
            
            <?php 
                // Bug fix, card #627.
                echo '<script> hideError(); </script>';?>
            
        <!--  reset button-->
            <?php $this->widget('bootstrap.widgets.TbButton', array(
                'buttonType'=>'reset',
                'label'=>'Reset Fields',
                'htmlOptions'=>array(
                    'data-toggle'=>'modal',
                    'data-target'=>'#myModal',
                    'id' => "searchbutton",
                    'style' => "margin-top: 5px; margin-bottom: 5px;width: 140px;",
                    'onclick' =>'window.location = "/JobFair/index.php/job/emphome"',
                ),)); ?>
        </div>
    </form>
</div>

<!------ End of the Advance Search ----->

<!---Start of the student search result--->

<div id="hardcorecontent">
<?php if ($students != null && sizeof($students) > 0) {?>
<br><br>
<h2>Search Results </h2>
 
<table class="jobtable">
<thead>
<tr><th> Username </th> <th> Name </th> <th> University </th> <th> Skills </th></tr>
</thead>
<tbody id="fbody">
<?php foreach ($students as $student)
    {  
    if ($student != null)
        {
        ?>
<tr>
	<td class="info"><a href="/JobFair/index.php/profile/student/user/<?php echo $student->username;?>"><?php echo $student->username;?></a></td>
	<td><?php echo $student->first_name . " " . $student->last_name;?></td>
        
        <td><?php 
	$educ = Education::model()->findByAttributes(array('FK_user_id'=>$student->id));
	$school = "";
	if($educ)
	{
		$school = School::model()->findByAttributes(array('id'=>$educ->FK_school_id))->name;
	}
	echo $school;
	?></td>	
       
        <td class="info1">
            
	<?php $temp = StudentSkillMap::model()->findAllByAttributes(array('userid'=>$student->id));
        
	 foreach ($temp as $one){
		echo Skillset::model()->findByAttributes(array('id'=>$one->skillid))->name." - ";
	}?></td>
</tr>
<?php } } ?>
</tbody>
</table>


<?php } else {?>
<br><br>
<h2>No Results</h2>
<?php }?>
</div>