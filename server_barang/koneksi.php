<?php
$connect = new mysqli("localhost","root","","db_barang");

if($connect){
    // echo 'success';

}else{
    echo "Connection Failed";
    exit();
}
?>