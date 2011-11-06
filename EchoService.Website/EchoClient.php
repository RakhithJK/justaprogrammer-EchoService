<?php
/*
 * This script was originally used to test PHP bug 50698.
 * http://bugs.php.net/bug.php?id=50698
 */
//trigger_error('Test notice', E_USER_NOTICE);
//trigger_error('Test warning', E_USER_WARNING);

use_soap_error_handler(true);
$client = new SoapClient
	("http://${_SERVER['SERVER_NAME']}:${_SERVER['SERVER_PORT']}/EchoService.svc?wsdl",
	 array(
		'location' => "http://${_SERVER['SERVER_NAME']}:${_SERVER['SERVER_PORT']}/EchoService.svc/Basic",
		'trace' => true,
		'soap_version' => SOAP_1_1,
		'connection_timeout' => 5
	)
);
echo "Soap Result: " . $client->echo(array('request' => "Hello World"))->EchoResult;
?>