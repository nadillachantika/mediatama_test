<?php
include 'koneksi.php';

$id_barang= $_POST['id_barang'];

$sql = "DELETE FROM tb_barang WHERE id_barang=$id_barang";
$isSuccess = $connect->query($sql);

if($isSuccess){
    $res['is_success']= true;
    $res['message'] = 'Data deleted';

}
echo json_encode($res);
?>