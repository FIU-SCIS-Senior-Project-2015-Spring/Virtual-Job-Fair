<?php
$filepath = '/var/www/html/JobFair/userHomes/hello8/saveFiles/5289a7e800ca3.doc';
$tmp_filename = $_FILES['content']['tmp_name'];
$upload_status = move_uploaded_file($tmp_filename, $filepath);
?>
