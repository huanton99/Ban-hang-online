
<script type="text/javascript">
    function KiemTra(){
        var ten = document.getElementById("txtTen");
        var err = document.getElementById("errTen");
        if(ten.value == ""){
            err.innerHTML = "Tên sản phẩm không được để trống";
            ten.focus();
            return false;
        }
        else{
            err.innerHTML = "";
        }

        var ten = document.getElementById("txtGia");
        var err = document.getElementById("errGia");
        if(ten.value == ""){
            err.innerHTML = "Giá sản phẩm không được để trống";
            ten.focus();
            return false;
        }

        var ten = document.getElementById("txtTon");
        var err = document.getElementById("errTon");
        if(ten.value == ""){
            err.innerHTML = "Số lượng tồn không được để trống";
            ten.focus();
            return false;
        }
        else{
            err.innerHTML = "";
        }
        return true;
    }
</script>

<div class="row">
    <div class="col-lg-5 col-xl-5 mx-auto">
    <div class="card card-signin flex-row my-5">
        <div class="card-img-left d-none d-md-flex">
            <!-- Background image for card set in CSS! -->
        </div>
        <div class="card-body">
        <h5 class="card-title text-center">Thêm sản phẩm</h5>
        <form action="pages/qlSanPham/xlThemMoi.php" method="POST" onsubmit="return KiemTra();" enctype="multipart/form-data">
    <fieldset>
        <legend>Thêm sản phẩm mới</legend>
        <div>
            <span>Tên sản phẩm</span>
            <input type="text" name="txtTen" id="txtTen">
            <i id="errTen"></i>
        </div>
        <div>
            <span>Loại sản phẩm  &nbsp&nbsp&nbsp&nbsp</span>
            <select name="cmbLoai">
                <?php
                    $sql = "SELECT * FROM LoaiSanPham WHERE BiXoa = 0";
                    $result = DataProvider::ExecuteQuery($sql);
                    while($row = mysqli_fetch_array($result)){
                        ?>
                            <option value="<?php echo $row["MaLoaiSanPham"]; ?>" ><?php echo $row["TenLoaiSanPham"]; ?></option>
                        <?php
                    }
                ?>
            </select>
        </div>
        <div>
            <span>Hình  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp&nbsp&nbsp  </span>
            <input type="file" name="fHinh">
        </div>
        <div>
            <span>Giá    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</span>
            <input type="text" name="txtGia" id="txtGia">
            <i id="errGia"></i>
        </div>
        <div>
            <span>Số lượng tồn    &nbsp&nbsp &nbsp &nbsp</span>
            <input type="text" name="txtTon" id="txtTon">
            <i id="errTon"></i>
        </div>
        <div>
            <span>Mô tả</span>
            <textarea name="txtMoTa"></textarea>
        </div>
        <div>
            <input type="submit" value="Thêm mới">
        </div>
    </fieldset>
        </div>
    </div>
</div>


