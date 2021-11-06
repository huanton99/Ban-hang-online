<?php
unset($_SESSION['us']);
function findUserByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM taikhoan WHERE Email = ?");
    $stmt->execute(array(strtolower($email)));
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    return $user;
}

function CreateUser($name, $email, $password){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO taikhoan (email, password, name) VALUE (?, ?, ?)");
    $stmt->execute(array($email, $password, $name));
    return $conn->lastInsertId();
}


if (isset($_POST['email']) && isset($_POST['password'])) {
    $fullname = $_POST['fullname'];
    $email = strtolower($_POST['email']);
    $password = $_POST['password'];
    $confirmpassword = $_POST['confirmpassword'];
    $exists = findUserByEmail($email);
    if ($exists) {
        $error = 'Email already exists';
    } else {
			if ($password != $confirmpassword) {
                $error = 'Password incorrect';
            } else 
			{
               echo '<div class="alert alert-success" role="alert">' . 'Success' . '</div>';
               $user = CreateUser($fullname, $email, password_hash($password, PASSWORD_DEFAULT));
			} 
				
	}
}
?>
<div class="row">
    <div class="col-lg-10 col-xl-9 mx-auto">
    <div class="card card-signin flex-row my-5">
        <div class="card-img-left d-none d-md-flex">
            <!-- Background image for card set in CSS! -->
        </div>
        <div class="card-body">
        <h5 class="card-title text-center">Register</h5>
        <form class="form-signin" action="pages/TaoTaiKhoan/xlTaoTaiKhoan.php" method="POST">
            <div class="form-label-group">
                <label for="inputUserame" class="sr-only">Tên đăng nhập</label>
                <input type="text" name="us" id="us" class="form-control" placeholder="Tên đăng nhập" required autofocus>
            </div>
            <br>

            <div class="form-label-group">
                <label for="inputEmail" class="sr-only">Địa chỉ Email</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Địa chỉ Email" required>
            </div>
            <br>

            <div class="form-label-group">
                <label for="inputPassword" class="sr-only">Mật khẩu</label>
                <input type="password" name="ps" id="ps" class="form-control" placeholder="Mật khẩu" required>
            </div>
            <br>

            <div class="form-label-group">
                <label for="inputConfirmPassword" id="rps" class="sr-only">Xác nhận mật khẩu</label>
                <input type="password" data-match="#ps" data-match-error="Whoops, these don't match" id="rps" class="form-control" placeholder="Xác nhận mật khẩu" required>
            </div>
            <br>
            
            <div class="form-label-group">
                <label for="inputUsername" class="sr-only">Tên hiển thị</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Tên hiển thị" required>
            </div>
            <br>

            <div class="form-label-group">
                <label for="inputAddress" class="sr-only">Địa chỉ</label>
                <input type="text" id="add" name="add" class="form-control" placeholder="Địa chỉ" required>
            </div>
            <br>

            <div class="form-label-group">
                <label for="inputEmail" class="sr-only">Điện thoại</label>
                <input type="text" id="tel" name="tel" class="form-control" placeholder="Điện thoại" required>
            </div>
            <br>
            <input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="Đăng ký">
            <a class="d-block text-center mt-2 small" href="#">Sign In</a>
        </form>
        </div>
    </div>
</div>

<script type="text/javascript"> 
    var password = document.getElementById("ps")
        ,confirm_password = document.getElementById("rps");

    function validatePassword(){
    if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
        confirm_password.setCustomValidity('');
    }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>

<?php
    if(isset($_GET["err"])){
        ?>
            <div>
                <span class="err">Tên đăng nhập đã tồn tại</span>
            </div>
        <?php
    }
?>