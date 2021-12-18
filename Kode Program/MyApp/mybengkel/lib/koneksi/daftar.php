<?php
require "koneksi.php";
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "INSERT INTO login (id, username, password, level) VALUES('', '$username', '$password', 'user')";
$query = $koneksi->query($sql);
$koneksi->close();
