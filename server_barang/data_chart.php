<?php

$connection_link = new mysqli("localhost", "root", "","db_barang"); 
  
if ($connection_link === false) { 
    die("ERROR: Not connected. ".$connection_link->connect_error); 
} 
$sql_query  =  "insert tb_chart select * from tb_barang"; 
$sql_query  =  "update tb_chart SET total_harga=(SELECT jumlah*harga FROM tb_barang WHERE tb_chart.id_barang = tb_barng)"; 
if ($connection_link->query($sql_query) === true) 
{ 
echo "Data Copied Successfully."; 
} 
else
{ 
echo "ERROR: Could not able to proceed $sql_query. "
    .$connection_link->error; 
} 
?>

UPDATE table1 
   SET price=(SELECT price FROM table2 WHERE table1.id=table2.id);