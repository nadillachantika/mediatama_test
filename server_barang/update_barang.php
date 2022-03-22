<?php
include 'koneksi.php';

$id_barang = $_POST['id_barang'];
$nama_barang = $_POST['nama_barang'];
$jumlah = $_POST['jumlah'];
$harga = $_POST['harga'];

$sql = "UPDATE tb_barang SET nama_barang='$nama_barang', jumlah='$jumlah', harga='$harga' WHERE id_barang=$id_barang";
$isSuccess = $connect->query($sql);

if($isSuccess){
    $res['is_success'] = true;
    $message['message']='Update Success';

}else{
    $res['is_success'] = false;
    $message['message']='Update Failed';

}
echo json_encode($res);
?>