<?php

$num = 2;
$foo = "to be";
$bar = "or not " .$num . " be";

echo $foo . ' ' . $bar . "\n";
echo $num * $num * $num;

$arr = [
    "first" => "Harry",
    "second" => "Hermione",
    "best" => "Ron"
];

$arr2 = [1,1,2,3,5,8];

if (true) {
    echo "\nTrue\n";
}

while (true) {
    //This way it doesn't actuallly do anything
    break;
}

# This is also a comment
/* This is a 
multi-line
comment */

// foreach($arr as $key=>$val) {
//     echo "<li>".$key." is ".$val."</li>";
// }
// echo "<ul>";



function printAndEncode( $val ) {
    echo json_encode(
        $val,
        JSON_PRETTY_PRINT|JSON_THROW_ON_ERROR
    );
}

echo printAndEncode($arr);

//====
//Naming conventions

//JS & PHP: camelCase
//PascalCase
//snake_case
//kebab-case