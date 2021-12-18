<?php
require "../koneksi.php";
@$nama = $_POST['nama'];
@$alamat = $_POST['alamat'];
@$namabarang = $_POST['namabarang'];
@$harga = $_POST['harga'];
@$jumlah = $_POST['jumlah'];
$sql = "INSERT INTO datakatalog (id, nama, alamat, namabarang, harga, jumlah) VALUES('', '$nama', '$alamat', '$namabarang' , '$harga' ,'$jumlah')";
$query = $koneksi->query($sql);
$koneksi->close();
