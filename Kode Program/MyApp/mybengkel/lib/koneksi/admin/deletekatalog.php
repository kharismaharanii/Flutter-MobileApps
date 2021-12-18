<?php
require "../koneksi.php";
$id = $_POST['id'];
$sql = "DELETE FROM datakatalog where id='$id'";
$query = $koneksi->query($sql);
$koneksi->close();
