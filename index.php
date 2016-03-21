<?php
// DB credentials.
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_NAME','singlecon');
define('DB_PASS','');

// Establish database connection.
try
{
    $dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,
    DB_USER, DB_PASS,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
}
catch (PDOException $e)
{
    exit("Error: " . $e->getMessage());
}

$sql = "SELECT c.name AS car_name, w.name AS worker_name
FROM `car_worker` AS cw
JOIN cars AS c
ON c.id = cw.car
RIGHT JOIN workers AS w 
ON w.id = cw.worker";

$query = $dbh -> prepare($sql);
$query -> execute();

$results = $query -> fetchAll(PDO::FETCH_OBJ);

$carsByWorkers = array(); 
if($query -> rowCount() > 0)
{       
    foreach($results as $result)
    {
        $workerName = $result -> worker_name;
        $carsByWorkers[$workerName][] = $result -> car_name;
    }
}

$tableBody = '';
foreach($carsByWorkers as $w => $c)
{
    $cStr = implode(', ', $c);
    $tableBody .= "<tr><td>$w</td><td>$cStr</td></tr>";
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dynamic table</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        
    <h1>Names and cars</h1>
    
    <table class="table table-striped">
        <tr>
            <th>Name</th><th>Cars</th>
        </tr>
        <?php echo $tableBody; ?>
    </table>
    </div>
</body>
</html>
