<?php
require __DIR__.'/vendor/autoload.php';

if(!isset($argv[1])) {
	echo "Did not recive the path of the execution!\n";
	exit;
}

if(!is_dir($argv[1])) {
	echo "The recive the path of the execution is not existent!\n";
	exit;
}

if(!isset($argv[2])) {
	echo "Make sure your first parameter is the file!\n";
	exit;
}

$file = rtrim($argv[1], '/') . '/' . $argv[2];
if(!file_exists($file)) {
	echo "Could not open file: '{$file}'\n";
	exit;
}

dump(unserialize(file_get_contents($file)));