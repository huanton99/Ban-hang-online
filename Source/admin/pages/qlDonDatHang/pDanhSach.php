

<table class="table">
  <thead>
    <tr>
      <th scope="col">Số thứ tự</th>
      <th scope="col">Mã đơn đặt hàng</th>
      <th scope="col">Ngày lập</th>
      <th scope="col">Khách hàng</th>
      <th scope="col">Tình trạng</th>
      <th scope="col">Thao tác</th>
    </tr>
  </thead>
  <tbody>
  <?php
        $sql = "SELECT d.MaDonDatHang, d.NgayLap, d.MaTinhTrang, t.TenHienThi, tt.TenTinhTrang
        FROM DonDatHang d, TaiKhoan t, TinhTrang tt
        WHERE d.MaTaiKhoan = t.MaTaiKhoan AND d.MaTinhTrang = tt.MaTinhTrang
        ORDER BY d.MaTinhTrang, d.NgayLap";
        $result = DataProvider::ExecuteQuery($sql);
        $i = 1;
        while($row = mysqli_fetch_array($result)){
            $c = "";
            switch($row["MaTinhTrang"]){
                case 2:
                    $c = "classGiaoHang";
                    break;
                case 3:
                    $c = "classThanhToan";
                    break;
                case 4:
                    $c = "classHuy";
                    break;
            }
            ?>
                <tr class="<?php echo $c; ?>">
                    <td><?php echo $i++; ?></td>
                    <td><?php echo $row["MaDonDatHang"]; ?></td>
                    <td><?php echo $row["NgayLap"]; ?></td>
                    <td><?php echo $row["TenHienThi"]; ?></td>
                    <td><?php echo $row["TenTinhTrang"]; ?></td>
                    <td>
                        <a href="index.php?c=5&a=2&id=<?php echo $row["MaDonDatHang"]; ?>">
                            <img src="images/edit.png">
                        </a>
                    </td>
                </tr>
            <?php
        }
    ?>
  </tbody>
</table>