<?php
    include "../../../lib/DataProvider.php";

    // if(isset($_GET["txtTen"])){
    //     $ten = $_GET["txtTen"];
    //     $gia = $_POST["txtGia"];
    //     $ton = $_POST["txtTon"];
    //     $mota = $_POST["txtMoTa"];
    //     $img="";
    //     $id_cate=0;
    //     $view=0;
    //     $sql = "INSERT INTO sanpham( TenSanPham, HinhURL, GiaSanPham, NgayNhap, SoLuongTon, SoLuongBan, SoLuotXem, MoTa,BiXoa) VALUES('$ten', 0)";
    //     DataProvider::ExecuteQuery($sql);
    // }
    // DataProvider::ChangeURL("../../index.php?c=4");
    if(isset($_POST['btnadd']))
{
    add();
}

function add()
{
    $productname=$_POST['txtTen'];
    $price=$_POST['txtGia'];
    $ton=$_POST['txtTon'];
    $intro=$_POST['txtMoTa'];
    $id_cate=$_POST['cmbLoai'];
    $img=$_POST['fHinh'];
    $DateAdd= getdate();
    $connection = mysqli_connect("localhost","root","");
	mysqli_select_db($connection, "doanweb");
	mysqli_query($connection, "set names 'utf8'");
	$sql="INSERT INTO sanpham( TenSanPham, HinhURL, GiaSanPham, NgayNhap, SoLuongTon, SoLuongBan, SoLuotXem, MoTa,BiXoa) VALUES('$productname','$price' ,'$DateAdd','$ton',' $intro','$id_cate',$img, 0)";
	mysqli_query($connection,$sql);
    //selectDb("INSERT INTO product (name,price,detail,view,id_cate,sale,total,intro)  VALUES ('$productname','$price','$des',0,29,0,0,'Được nhập khẩu từ Hàn Quốc                        ...')");
}

?>
