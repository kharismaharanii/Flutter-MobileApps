<?php
require "../koneksi.php";
@$nama = $_POST['nama'];
@$haritanggal = $_POST['haritanggal'];
@$tipesepeda = $_POST['tipesepeda'];
$sql = "INSERT INTO dataservice (id, nama, haritanggal, tipesepeda) VALUES('', '$nama', '$haritanggal', '$tipesepeda')";
$query = $koneksi->query($sql);
$koneksi->close();
