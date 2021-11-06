<a href="index.php?c=2&a=3">
<button name="btnadd">
<img src="images/new.png">
</button>
    
</a>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Số thứ tự</th>
      <th scope="col">Tên sản phẩm</th>
      <th scope="col">Hình</th>
      <th scope="col">Giá</th>
      <th scope="col">Ngày nhập</th>
      <th scope="col">Số lượng tồn</th>
      <th scope="col">Số lượt bán</th>
      <th scope="col">Số lượt xem</th>
      <th scope="col">Loại</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Trạng thái</th>
      <th scope="col">Thao tác</th>
    </tr>
  </thead>
  <tbody>
  <?php
        $sql = "SELECT s.MaSanPham, s.TenSanPham, s.HinhURL, s.GiaSanPham, s.NgayNhap, s.SoLuongTon, s.SoLuongBan, s.SoLuotXem, s.MoTa, s.BiXoa, l.TenLoaiSanPham
        FROM SanPham s, LoaiSanPham l
        WHERE s.MaLoaiSanPham = l.MaLoaiSanPham 
        ORDER BY s.MaSanPham DESC";
        $result = DataProvider::ExecuteQuery($sql);
        $i = 1;
        while($row = mysqli_fetch_array($result)){
            ?>
                <tr>
                    <td><?php echo $i++; ?></td>
                    <td><?php echo $row["TenSanPham"]; ?></td>
                    <td>
                        <img src="../images/<?php echo $row["HinhURL"]; ?>" height="50">
                    </td>
                    <td><?php echo $row["GiaSanPham"]; ?></td>
                    <td><?php echo $row["NgayNhap"]; ?></td>
                    <td><?php echo $row["SoLuongTon"]; ?></td>
                    <td><?php echo $row["SoLuongBan"]; ?></td>
                    <td><?php echo $row["SoLuotXem"]; ?></td>
                    <td><?php echo $row["TenLoaiSanPham"]; ?></td>
                
                    <td>
                        <?php
                            if(strlen($row["MoTa"]) >20){
                                $sMoTa = substr($row["MoTa"], 0, 20)."..."; 
                            }
                            else{
                                $sMoTa = $row["MoTa"];
                            }
                            echo $sMoTa;
                        ?>
                        <div class="fullMoTa">
                            <?php
                                echo $row["MoTa"];
                            ?>
                        </div>
                    </td>
                    <td>
                        <?php
                            if($row["BiXoa"] == 1){
                                echo "<img src='images/locked.png' >";
                            }
                            else{
                                echo "<img src='images/active.png' >";
                            }
                        ?>
                    </td>
                    <td>
                        <a href="pages/qlSanPham/xlKhoa.php?id=<?php echo $row["MaSanPham"]; ?>">
                            <img src="images/lock.png">
                        </a>
                        <a href="index.php?c=2&a=2&id=<?php echo $row["MaSanPham"]; ?>">
                            <img src="images/edit.png">
                        </a>
                    </td>
                </tr>
            <?php
        }
    ?>
  </tbody>
</table>

