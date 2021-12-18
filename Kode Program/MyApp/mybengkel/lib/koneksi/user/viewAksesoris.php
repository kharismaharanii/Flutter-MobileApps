<?php
require "../koneksi.php";

$sql = "SELECT * FROM aksesoris";
$query = $koneksi->query($sql);
$dt = array();
while ($res = $query->fetch_assoc()) {
    $dt[] = $res;
}
echo json_encode($dt);
