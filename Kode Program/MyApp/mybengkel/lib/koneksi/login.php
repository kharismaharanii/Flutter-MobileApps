<?php
include 'koneksi.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult = $koneksi->query("SELECT * FROM login WHERE username='" . $username . "' and password='" . $password . "'");

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);
