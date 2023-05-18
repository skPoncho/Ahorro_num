
<?php
setlocale(LC_MONETARY, 'es_MX');
date_default_timezone_set('America/Mexico_City');
include_once('./Classes/Catalogo.class.php');
$catalogo = new Catalogo();
$Aplicacion="Apuestas ";
$fecha = date("Y-m-d");
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' /> -->
    <link rel="stylesheet" type="text/css" href="./css/index.css" />
    <link rel="stylesheet" type="text/css" href="./css/estilos.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link href="./css/bootstrap-select.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="./js/bootstrap-select.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css">
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="./js/bootstrap/bootstrapValidator.js"></script>

    <title>::.Ahorro.::</title>
</head>
<body>
  <div class="well well-sm" style="margin-bottom:0px;background-color: #3694c3 !important;">
     <a style="color:#fefefe;" href="javascript:window.location.reload(true)">Ahorro numeros</a>
   </div>

  <?php
  $cons = 'select (SELECT  par1.Valor FROM parametros par1 WHERE par1.Identificador = "ahorro" ) as total ,
			(SELECT par2.Valor FROM parametros par2 WHERE par2.Identificador = "dias" ) as dias ,
            (SELECT SUM(ah1.Numero) total FROM ahorro ah1 ) as total_ahorrado  ';
  $resu= $catalogo->obtenerLista($cons);
  while ($rs = mysqli_fetch_array($resu)){
    $total_ = $rs['total'];
    $dias = $rs['dias'];
    $total_ahorrado = $rs['total_ahorrado'];
    $falante = $total_ -$total_ahorrado;
  }
  $numeros_yasalieron = array();
  $cons = 'select Numero  from ahorro  ';
  $resu= $catalogo->obtenerLista($cons);
  while ($rs = mysqli_fetch_array($resu)){
    array_push($numeros_yasalieron,$rs['Numero']);
  }


   ?>
<div class="container-fluid">
  <div class="row">
    <div class="row">
      <div class="col-md-3 col-sm-3 col-xs-3 text-center"><h5>Ahorro objetivo : <b><?php echo $total_; ?></b> &nbsp;&nbsp;&nbsp; Actual:  <b style="color: rgb(91, 199, 69);"><?php echo $total_ahorrado; ?>
      </b>  &nbsp;&nbsp;&nbsp; Faltante:  <b style="color: rgb(242, 50, 50);"><?php echo $falante; ?></b>

     </h5></div>



    </div>
    <legend id="AnioTitulo" style="text-align: center;margin-bottom:5px;"></legend>
  <div class="col-md-12 col-sm-12 col-xs-12">


<?php
$numero = 1;
$arrnum = array();
for ($i=1; $i < 11; $i++) {
  for ($j=1; $j <21 ; $j++) {
    if (!in_array($numero, $numeros_yasalieron)) {
      array_push($arrnum, $numero);
    }
    $numero++;
  }
}
$cons = 'select *  from ahorro WHERE Fecha = "'.$fecha.'"  ';
$resu= $catalogo->obtenerLista($cons);
$bandera = 0;
while ($rs = mysqli_fetch_array($resu)){
  $bandera = 1;
  $valor_dia = $rs['Numero'];
}
if($bandera == 0){
  $valor_dia =  $arrnum[array_rand($arrnum)];
  $insert = "INSERT INTO ahorro (Numero)
          VALUES ($valor_dia);";
          $ID_NUEVO = $catalogo->insertarRegistro($insert);
}

$numeros_yasalieron = array();
$cons = 'select Numero  from ahorro  ';
$resu= $catalogo->obtenerLista($cons);
while ($rs = mysqli_fetch_array($resu)){
  array_push($numeros_yasalieron,$rs['Numero']);
}

 ?>

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <center ><h1>Número del día : <?php echo $valor_dia; ?> </h1></center>
              <center ><h2>Reparto : <?php echo round($valor_dia / 3,2) ?>  </h2></center>
              <center ><h3>Fecha :  <?php echo $fecha; ?></h3></center>
              <table class="table table-striped table-bordered" id="tabla_movimientos" style="width:100%;margin-bottom: 0px !important;font-size: .7em;">
                <thead>
                  <th>Fecha</th>
                  <th>Numero</th>
                  <th>Repartición</th>
                </thead>
                <tbody>
                  <?php
                  $ganancia = 0;
                  $result = $catalogo->obtenerLista(" SELECT *  from  ahorro ah order by Fecha desc ");

                      while ($row = mysqli_fetch_array($result)){
                        echo "<tr>";

                          echo "<td>".$row['Fecha']."</td>";
                          echo "<td>".$row['Numero']."</td>";
                          echo "<td>".round($row['Numero'] / 3,2)."</td>";
                        echo "</tr>";
                      }
                   ?>

                </tbody>
              </table>
            </div>
          </div>





        <br>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <table class="table table-striped table-bordered" id="tabla_numeros" style="width:100%;margin-bottom: 0px !important;font-size: .7em;">
                <thead>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                </thead>
                <tbody>
                  <?php
                  $numero = 1;
                  $color = "";
                  for ($i=1; $i < 11; $i++) {

                    echo "<tr>";
                    for ($j=1; $j <21 ; $j++) {
                      if(in_array($numero, $numeros_yasalieron)){
                        $color = "style='background-color: rgb(61, 175, 52);color:white;'";
                      }else{
                        $color = "";
                      }
                      echo "<td $color >$numero</td>";
                      $numero++;
                    }

                    echo "</tr>";
                  }

                   ?>

                </tbody>
              </table>
            </div>


          </div>
          <br>


  </div>




  <div style="top: 64px;" class="modal fade" id="modal_nuevoapuesta" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="left: -62px;width: 624px;">
        <div class="modal-header h" style="padding: 7px 5px;">
          <button type="button" class="close" data-dismiss="modal" id="cerrar_nuevoasunto" onclick="window.location.reload(true);">&times;</button>
          <center>
            <span style="color:white;" id="titulo"></span>
          </center>
           <a style="color:white;text-decoration:none;" class="resul"></a>
        </div>

        <div class="modal-body detalle" style="padding: 5px 5px;">

        </div>

      </div>
      </div>
  </div>



</div>
</div>


</body>

<script>

$(document).ready(function () {

    var form = "#formIntervalo";
    var controller = "Controller_intervalo.php";

      var table = $('#tabla_movimientos').DataTable({
        "aLengthMenu": [
                    [5, 10, 100],
                    [5, 10, 100] // change per page values here
                ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json",
        },
        "order": [
            [1, "asc"]
        ],

        "scrollX": "0px",
        "responsive": false,
        "pageLength": 5,
        "scrollY": "370px",
        "scrollCollapse": true,
        "paging": true
        //"ordering": false
      });


  });









</script>

</html>
