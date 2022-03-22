<?php

include 'koneksi.php';

$id_barang= $_POST['id_barang'];
$harga_barang = $connect->query("SELECT harga from tb_barang WHERE id_barang=$id_barang")->fetch_assoc();
$jumlah_barang= $connect->query("SELECT jumlah from tb_barang WHERE id_barang=$id_barang")->fetch_assoc();
$total = $harga_barang['harga'] *$jumlah_barang['jumlah'];

$sql = "INSERT INTO tb_chart(id_barang,jumlah,total_harga) VALUES('$id_barang','$jumlah_barang[jumlah]','$total')";
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