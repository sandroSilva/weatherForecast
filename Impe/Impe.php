<?php
//CPTEC/INPE

$idcity = '244'; //id são paulo

//Montagem da URL Completa da API com todos o ID acima.
$enderecoAPI = 'http://servicos.cptec.inpe.br/XML/cidade/'.$idcity.'/previsao.xml';

//Enviamos a resposta para o SWF com o XML formatado em UTF-8
echo $resultadoXML = file_get_contents($enderecoAPI);
$xmlAPI = simplexml_load_string(utf8_encode($resultadoXML));
?>