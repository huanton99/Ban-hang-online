<?php
    $sub = 1;
    if(isset($_GET["sub"])){
        $sub = $_GET["sub"];
    }

    switch($sub){
        case 1:
            include "pages/f_pass/forgottenPassword.php";
            break;
        default:
            DataProvider::ChangeURL("index.php?a=404");
        break;
    }
?>