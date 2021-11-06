<?php 
session_start();
include "../../lib/DataProvider.php";
if (!isset($_GET['code'])) {
	exit("can't find the page"); 
}

$code = $_GET['code']; 

$sql = "SELECT * FROM resetPasswords WHERE code = '$code'";
$getCodequery = DataProvider::ExecuteQuery($sql);

if (mysqli_num_rows($getCodequery) == 0) {
	exit("can't find the page because not same code"); 
}

// handling the form 
if (isset($_POST['MatKhau'])) {
	$pw = $_POST['MatKhau']; 
	$row = mysqli_fetch_array($getCodequery); 
	$email = $row['Email']; 
	$sql = "UPDATE taikhoan SET MatKhau = '$pw' WHERE Email = '$email'";
	$query = DataProvider::ExecuteQuery($sql);

	if ($query) {
		 $sql = "DELETE FROM resetPasswords WHERE code ='$code'";
		$query = DataProvider::ExecuteQuery($sql); 
	 	exit('Password updated'); 	
 	 }else {
 	 	exit('Something went wrong :('); 	
 	 } 	 
}


?>


<form method="post">
	<input type="password" name="password" placeholder="New password">
	<br>
	<input type="submit" name="submit" value="Update password">
</form>