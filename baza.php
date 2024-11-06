<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php
$connect = mysqli_connect( "localhost","root","","KINO4tig1");
if(mysqli_connect_errno()){
echo"<p>MYSQL CONNECTION FAILED</p>";
}
else{
    echo"<p>CONNCETION SUCCESS";
}

$query = "SELECT * FROM Filmy;";
if($result = mysqli_query($connect,$query)){
echo"<table border = 1 >";
echo"<tr><th>ID</th><th>Tytuł</th><th>Rezyser</th><th>czas trwania</th></tr>";

foreach(mysqli_fetch_all(result: $result)as $row){
echo"<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td>";


}
echo "</table>";


}
mysqli_close($connect);

?>

</body>
</html>