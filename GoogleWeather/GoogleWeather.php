<?php
//GOOGLE WEATHER

//Coloque abaixo os dados de localização, após você também poderá implementar as mudanças destes dados pelo SWF.
$city = 'Novo Hamburgo'; //Cidade
$state = 'Rio Grande do Sul'; //Estado (sem abreviação!)
$country = 'Brazil'; //País (coloque em inglês)
$language = 'pt-br'; //Idioma de resposta (pt-br)
$googleWeather = 'http://www.google.com/ig/api'; //URL principal da API do Google Weather

//Montagem da URL Completa da API com todos os dados acima. Também usamos a função urlencode() para substituir alguma acentuação ou caractere especial.
$apiUrl = $googleWeather . '?weather=' . urlencode($city) . ',' . urlencode($state) . ',' . urlencode($country) . '&hl=' . $language;

//Enviamos a resposta para o SWF com o XML formatado em UTF-8
echo $resultXML = file_get_contents($apiUrl);
$xml = simplexml_load_string(utf8_encode($resultXML));
?>