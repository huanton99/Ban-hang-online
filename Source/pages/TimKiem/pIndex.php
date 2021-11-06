<h3>Danh sách sản phẩm cần tìm</h3>
<div class="row" style="padding-bottom: 30px">
<?php
    $txtSeach = $_SESSION["txtSearch"];


    $sql = "SELECT * FROM SanPham WHERE BiXoa = 0 AND TenSanPham LIKE '%$txtSeach%' ORDER BY NgayNhap DESC";
    $result = DataProvider::ExecuteQuery($sql);
    while($row = mysqli_fetch_array($result)){
        ?>
            <?php
                if(isset($_SESSION["txtMucGia"]) && $_SESSION["txtMucGia"] != "chonmucgia"){
                    $txtMucGia = $_SESSION["txtMucGia"];
                    if($txtMucGia == "duoi100"){
                        if($row["GiaSanPham"] >= 100000){
                            continue;
                        }
                    }
                    if($txtMucGia == "100den150"){
                        if($row["GiaSanPham"] < 100000 || $row["GiaSanPham"] > 150000){
                            continue;
                        }
                    }
                    if($txtMucGia == "150den300"){
                        if($row["GiaSanPham"] < 150000 || $row["GiaSanPham"] > 300000){
                            continue;
                        }
                    }
                    if($txtMucGia == "300den500"){
                        if($row["GiaSanPham"] < 300000 || $row["GiaSanPham"] > 500000){
                            continue;
                        }
                    }
                    if($txtMucGia == "tren500"){
                        if($row["GiaSanPham"] < 500000){
                            continue;
                        }
                    }
                }
                if(isset($_SESSION["txtLoaiSP"]) && $_SESSION["txtLoaiSP"] != "loaisp"){
                    $txtLoaiSP = $_SESSION["txtLoaiSP"];
                    if($row["MaLoaiSanPham"] != $txtLoaiSP){
                        continue;
                    }
                }
                if(isset($_SESSION["txtHangSX"]) && $_SESSION["txtHangSX"] != "hangsx"){
                    $txtHangSX = $_SESSION["txtHangSX"];
                    if($row["MaHangSanXuat"] != $txtHangSX){
                        continue;
                    }
                }
            ?>
            <div class="col-12 col-md-6 col-lg-4" style="padding-top: 20px">
                <div class="card">
                    <img class="card-img-top" src="images/<?php echo $row["HinhURL"]; ?>">
                    <div class="pname"><?php echo $row["TenSanPham"]; ?></div>
                    <div class="pprice">Giá: <?php echo $row["GiaSanPham"] ?>đ</div>
                    <div class="action">
                        <a href="index.php?a=4&id=<?php echo $row["MaSanPham"]; ?>">Chi Tiết</a>
                    </div>
                </div>
            </div>
        <?php
    }
?>
</div>
