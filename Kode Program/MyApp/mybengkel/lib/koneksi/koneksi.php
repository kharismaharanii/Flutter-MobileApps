<?php
$koneksi = new mysqli('localhost', 'root', '', 'mybengkel');
if ($koneksi->connect_errno) {
    die('koneksi gagal');
} else {
    // echo "koneksi sukses";
}
