    
<nav class="navbar navbar-expand-sm bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.php">IT Equipment</a>
        
        <div>           
            <?php
                if(isset($_SESSION["MaTaiKhoan"])){
                    // đã đăng nhập
                    ?>
                    Hello, <?php echo $_SESSION["TenHienThi"]; ?>
                    <a href="modules/xlDangXuat.php">Đăng xuất</a>
                    <a href="index.php?a=5">
                        <img src="img/manage_shopping.png" height="50">
                    </a>
                    <?php
                }
                else{
                    // Chưa đăng nhập
                    ?>
                    <form class="form-inline" name="frmLogin" action="modules/xlDangNhap.php" method="post" onsubmit="return KiemTraDangNhap()">
                        <div class="form-group mb-2">
                            <label for="inputTenDangNhap" class="sr-only"></label>
                            <input name="txtEmail" type="email" id="txtUS" class="form-control" placeholder="Nhập email">
                        </div>
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="inputPassword" class="sr-only">Password</label>
                            <input name="txtPS" type="password" class="form-control" id="txtPS" placeholder="Password">
                        </div>
                        <div class="form-group mx-sm-3">
                            <input type="submit" class="btn btn-outline-primary mb-2" value="Đăng nhập">
                        </div>
                        <div class="form-group mx-sm-3"">
                            <input  name ="btn" type="button" class="btn btn-outline-primary mb-2" value="Đăng ký" onclick="ChuyenTrangDangKy()" class="btn btn-secondary btn-number">
                        </div>
                        <script type="text/javascript">
                            function ChuyenTrangDangKy(){
                                location = "index.php?a=6";
                            }
                        </script>  
                        
                    </form>            
                    <?php
                }
            ?>
        </div>
    </div>
</nav>
