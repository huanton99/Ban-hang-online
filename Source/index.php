<?php
    session_start();
    include "lib/DataProvider.php";

    $_SESSION["path"] = $_SERVER["REQUEST_URI"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        img:hover {
    transform: scaleX(-1);
  }
  div .card .pname{
    font-weight: bold;
  }

  div .card .pprice{

    font-weight: bold;
  }
    </style>
</head>
<body>  
        <?php
            include "modules/mHeader.php";
            include "modules/mSidebar.php";
        ?>

        <div class="col">
                <?php
                    $a = 1;
                    if(isset($_GET["a"]) == true){
                        $a = $_GET["a"];
                    }
                    switch($a){
                        case 1:
                            include "pages/pIndex.php";
                            if(isset($_SESSION["txtMucGia"]))
                                unset($_SESSION["txtMucGia"]);
                            if(isset($_SESSION["txtLoaiSP"]))
                                unset($_SESSION["txtLoaiSP"]);
                            if(isset($_SESSION["txtHangSX"]))
                                unset($_SESSION["txtHangSX"]);
                            break;
                        case 2:
                            include "pages/pSanPhamYeuThich.php";
                            break;
                        case 3:
                            include "pages/pSanPhamTheoLoai.php";
                            break;
                        case 4:
                            include "pages/pChiTiet.php";
                            break;
                        case 5:
                            include "pages/GioHang/pIndex.php";
                            break;
                        case 6:
                            include "pages/TaoTaiKhoan/pIndex.php";
                            break;
                        case 7:
                            if(isset($_SESSION["txtMucGia"]))
                                unset($_SESSION["txtMucGia"]);
                            if(isset($_SESSION["txtLoaiSP"]))
                                unset($_SESSION["txtLoaiSP"]);
                            if(isset($_SESSION["txtHangSX"]))
                                unset($_SESSION["txtHangSX"]);
                            $_SESSION["txtSearch"] = $_GET["txtSearch"];
                            include "pages/TimKiem/pIndex.php";
                            break;
                        case 8:
                            $_SESSION["txtMucGia"] = $_POST["selectMucGia"];
                            $_SESSION["txtLoaiSP"] = $_POST["selectLoaiSanPham"];
                            include "pages/TimKiem/pIndex.php";
                            break;
                            case 9:
                                include "pages/f_pass/pIndex.php";
                                break;
                        default:
                            include "pages/pError.php";
                            break;
                    }
                ?>
        </div>
    </div>
        <?php include "modules/mFooter.php"; ?>
    </div>
</body>
</html>