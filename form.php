<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3 style="text-align:center">Dodawanie danych do tabeli</h3> <br>

<form style="text-align:center" method="Post">
tytuł: <input type="text" name="tytul" required><br>
reżyser: <input type="text" name="rezyser" required><br>
czas trwania: <input type="number" name="czas" required><br>
<input type="submit" value="przeslij dane" name="wyslij"><br>
</form>

<?php
$connect = mysqli_connect( "localhost","root","","KINO4tig1");
if(mysqli_connect_errno()){
echo"<p>MYSQL CONNECTION FAILED</p>";
}
else{
    echo"<p>CONNCETION SUCCESS</p>";
}


if(isset($_POST))
{    
     $title = $_POST['tytul'];
     $rezyser = $_POST['rezyser'];
     $czas1 = $_POST['czas'];
    $sql = "INSERT INTO Filmy (Tytuł,Reżyser,`Czas_trwania(min)`)
     values('$title','$rezyser',$czas1)";

     if (mysqli_query($connect, $sql)) {
        echo " Nowy rekord został dodany!";
     } else {
        echo "Error: " . $sql . ":-" . mysqli_error($connect);
     }
     mysqli_close($connect);
}





?>


</body>
</html>