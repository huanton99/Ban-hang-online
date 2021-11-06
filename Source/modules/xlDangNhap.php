<?php
    session_start();
    include "../lib/DataProvider.php";

    if(isset($_POST["txtEmail"]) && isset($_POST["txtPS"])){
        $email = $_POST["txtEmail"];
        $ps = $_POST["txtPS"];

        $sql = "SELECT * FROM TaiKhoan
                WHERE BiXoa = 0
                    AND Email = '$email'
                    AND MatKhau = '$ps'";

        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result);

        if($row == null){
            DataProvider::ChangeURL("../index.php?a=404&id=1");
        }
        else{
            $_SESSION["MaTaiKhoan"] = $row["MaTaiKhoan"];
            $_SESSION["MaLoaiTaiKhoan"] = $row["MaLoaiTaiKhoan"];
            $_SESSION["TenHienThi"] = $row["TenHienThi"];
            if($row["MaLoaiTaiKhoan"] == 2){
                
                DataProvider::ChangeURL("../admin/index.php");
            }
            else{
                    DataProvider::ChangeURL("../index.php");
            }
        }
    }
    else{
        DataProvider::ChangeURL("../index.php?a=404&id=1");
    }
?>