<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item <?php if(isset($_GET["c"]) == false) echo 'active'; ?>">
            <a class="nav-link" href="index.php" color="red">HOME<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item <?php if($c == 1) echo 'active'; ?>">
            <a class="nav-link" href="index.php?c=1" <?php if($c == 1) echo "class='selected'"; ?>>Quản lý tài khoản<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item <?php if($c == 2) echo 'active'; ?>">
            <a class="nav-link" href="index.php?c=2" <?php if($c == 2) echo "class='selected'"; ?>>Quản lý sản phẩm</a>
        </li>
        <li class="nav-item <?php if($c == 3) echo 'active'; ?>">
            <a class="nav-link" href="index.php?c=3" <?php if($c == 3) echo "class='selected'"; ?>>Quản lý loại</a>
        </li>
        <li class="nav-item <?php if($c == 5) echo 'active'; ?>">
            <a class="nav-link" href="index.php?c=5" <?php if($c == 5) echo "class='selected'"; ?>>Quản lý đơn hàng</a>
        </li>
    </ul>
    <div style="color: #fff">
        Hello, <?php echo $_SESSION["TenHienThi"] ; ?>
        <a href="../modules/xlDangXuat.php">&nbsp; Đăng xuất</a>
    </div>
  </div>
</nav>
