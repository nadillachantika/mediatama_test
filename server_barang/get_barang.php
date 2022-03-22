<?php
include 'koneksi.php';

$sql = "SELECT * FROM tb_barang";
$result = $connect->query($sql);

if($result->num_rows>0){
    $res['is_success'] = true;
    $res['message']= 'Get Data Completed';
    $res['data']= array();
    while($row = $result->fetch_assoc()){
        $res['data'][]=$row;
    }
}else{
    $res['is_success']= false;
    $res['message']= 'Get Data Failed';
    $res['data']= null;
}
echo json_encode($res);
?>