<h1>Dashboard</h1>
<div class="well">
TODO:
    <ul>
        <li>total number of users =  <?php echo $model->countUsers(); ?></li>
        <li>total number of students = <?php echo $model->countStudents(); ?></li>
        <li>total number of students active = <?php echo $model->countactiveStudents(); ?> </li>
        <li>total number of employers = <?php echo $model->countEmployers(); ?></li>
        <li>total number of employer's active = <?php echo $model->countactiveEmployers(); ?> </li>
        <li>total number of administrators = <?php echo $model->countAdmin(); ?></li>
        <li>total number of jobs posted = <?php echo $model->countactiveJobs(); ?> </li>
        <li>total number of active jobs posted = <?php echo $model->countJobs(); ?> </li>
        <li>total number of unique hits (integrate google analytics extension for yii framework) = </li>
    </ul>
</div>