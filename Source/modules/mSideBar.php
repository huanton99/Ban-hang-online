<div class="container">
<nav class="navbar navbar-light bg-light">
        <a class="navbar-brand"></a>
        <form class="form-inline" action="index.php" method="GET" onsubmit="ChuyenTrangTimKiem()">
            <input class="form-control mr-sm-2" type="search" name="txtSearch" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-primary mb-2" type="submit">Search</button>
            <input type="hidden" name="a" value="7">
        </form>
    </nav>
    <script type="text/javascript">
        function ChuyenTrangTimKiem(){
            location = "index.php?a=7";
        }
    </script>
<div class="row">
<div class="col-12 col-sm-3">
    <?php
        include "modules/mLoai.php";
    ?>
</div>
