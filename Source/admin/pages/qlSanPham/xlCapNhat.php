<?php
    include "../../../lib/DataProvider.php";

    if(isset($_GET["id"])){
        $id = $_GET["id"];
        $ten = $_GET["txtTen"];
        $sql = "UPDATE SanPham SET TenSanPham = '$ten' WHERE MaSanPham = $id";

        DataProvider::ExecuteQuery($sql);
    }
    DataProvider::ChangeURL("../../index.php?c=4");
?>