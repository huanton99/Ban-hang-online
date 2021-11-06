<a href="index.php?c=3&a=3">
    <img src="images/new.png">
</a>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Số thứ tự</th>
      <th scope="col">Tên loại sản phẩm</th>
      <th scope="col">Tình trạng</th>
      <th scope="col">Thao tác</th>
    </tr>
  </thead>
  <tbody>
  <?php
        $sql = "SELECT MaLoaiSanPham, TenLoaiSanPham, BiXoa
        FROM LoaiSanPham";
        $result = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($result)){
            ?>
            <tr>
                <td><?php echo $row["MaLoaiSanPham"]; ?></td>
                <td><?php echo $row["TenLoaiSanPham"]; ?></td>
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
                    <a href="pages/qlLoai/xlKhoa.php?id=<?php echo $row["MaLoaiSanPham"]; ?>">
                        <img src="images/lock.png" >
                    </a>
                    <a href="index.php?c=3&a=2&id=<?php echo $row["MaLoaiSanPham"]; ?>">
                        <img src="images/edit.png">
                    </a>
                </td>
            </tr>
            <?php
        }
    ?>
  </tbody>
</table>
