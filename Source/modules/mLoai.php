<div class="card bg-light mb-3">
    <ul class="list-group category_block">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Loại sản phẩm</div>
        
        <?php
        $sql = "SELECT * FROM LoaiSanPham WHERE BiXoa = 0";
        $result = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($result)){
            ?>
                <li class="list-group-item">
                    <a href="index.php?a=3&id=<?php echo $row["MaLoaiSanPham"]; ?>">
                        <?php echo $row["TenLoaiSanPham"]; ?>
                    </a>
                </li>
            <?php
        }
    ?>
    </ul>
</div>
