<h3>Sản phẩm bán chạy</h3>
<div class="row" style="padding-bottom: 30px">
<?php
    $sql = "SELECT * FROM SanPham WHERE BiXoa = 0 ORDER BY SoLuongBan DESC LIMIT 0, 10";
    $result = DataProvider::ExecuteQuery($sql);
    while($row = mysqli_fetch_array($result)){
        ?>
            <div class="col-12 col-md-6 col-lg-3" style="padding-top: 20px">
            <div class="card">
                    <img class="card-img-top" src="images/<?php echo $row["HinhURL"]; ?>">
                    <div class="pname"><?php echo $row["TenSanPham"]; ?></div>
                    <div class="action">
                        <a href="index.php?a=4&id=<?php echo $row["MaSanPham"]; ?>">Chi Tiết</a>
                    </div>
                </div>
            </div>
        <?php
    }
?>
</div>


