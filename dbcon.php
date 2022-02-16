<?php

$conn = new mysqli('localhost', 'root', '', 'grocery1');

if ($conn->connect_error) {
    exit('Connection failed: '.$conn->connect_error);
}
