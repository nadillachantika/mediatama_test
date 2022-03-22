<?php

include 'koneksi.php';

$nama_barang = $_POST['nama_barang'];
$jumlah = $_POST['jumlah'];
$harga = $_POST['harga'];

$sql = "INSERT INTO tb_barang(nama_barang,jumlah,harga) VALUES('$nama_barang','$jumlah','$harga')";
$isSuccess = $connect = $connect->query($sql);

if($isSuccess){
    $res['is_success']= true;
    $res['message']= 'Add Data Success';

}else{
    $res['is_success']= false;
    $res['message']= 'Add data failed';

}
echo json_encode($res);
?>