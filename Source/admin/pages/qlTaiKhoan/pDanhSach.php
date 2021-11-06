<table class="table">
  <thead>
    <tr>
      <th scope="col">Mã tài khoản</th>
      <th scope="col">Tên đăng nhập</th>
      <th scope="col">Tên hiển thị</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Điện thoại</th>
      <th scope="col">Email</th>
      <th scope="col">Loại tài khoản</th>
    </tr>
  </thead>
  <tbody>
  <?php
        $sql = "SELECT t.MaTaiKhoan, t.TenDangNhap, t.TenHienThi, t.DiaChi, t.DienThoai, t.Email, l.TenLoaiTaiKhoan
        FROM TaiKhoan t, LoaiTaiKhoan l
        WHERE t.MaLoaiTaiKhoan = l.MaLoaiTaiKhoan";
        $result = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($result)){
            ?>
                <tr>
                    <td><?php echo $row["MaTaiKhoan"]; ?></td>
                    <td><?php echo $row["TenDangNhap"]; ?></td>
                    <td><?php echo $row["TenHienThi"]; ?></td>
                    <td><?php echo $row["DiaChi"]; ?></td>
                    <td><?php echo $row["DienThoai"]; ?></td>
                    <td><?php echo $row["Email"]; ?> </td>               
                    <td><?php echo $row["TenLoaiTaiKhoan"]; ?></td>
                </tr>
            <?php
        }
    ?>
  </tbody>
</table>
