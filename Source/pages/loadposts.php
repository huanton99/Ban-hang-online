<?php
    if(isset($_GET["id"])){
        $id = ($_GET["id"]);
    }
    else{
        DataProvider::ChangeURL("index.php?a=404");
    }

    $sql = "SELECT s.MaSanPham, s.TenSanPham, s.GiaSanPham, s.SoLuongTon, s.HinhURL, s.MoTa,l.TenLoaiSanPham, s.MaLoaiSanPham
    FROM SanPham s,  LoaiSanPham l
    WHERE s.BiXoa = 0  AND s.MaLoaiSanPham = l.MaLoaiSanPham AND s.MaSanPham = $id";

    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);
    
    if ($row == null){
        echo $id;
        DataProvider::ChangeURL("index.php?a=404");
    }
     
?>
<div>
 <h3>Bình luận</h3>
    <div>
    <?php
    $id1 = $row["MaSanPham"];
    $sql1="SELECT p.MaTK, u.TenDangNhap, p.content, p.createdAt FROM posts p , taikhoan u WHERE MaSP=$id1 AND u.MaTaiKhoan = p.MaTK";
    $result1 = DataProvider::ExecuteQuery($sql1);
  
    while($row = mysqli_fetch_array($result1)){
        ?>
        
           <li style="list-style: None;">
                <?php echo $row["TenDangNhap"]; ?>:
                <?php echo $row["content"]; ?>
            </li>
            </div>
        <?php
    }
?>
 </div>