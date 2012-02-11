<?php
/*
 * This script was originally used to test PHP bug 50698.
 * http://bugs.php.net/bug.php?id=50698
 */
 
use_soap_error_handler(true);

$request = array_key_exists('request', $_REQUEST) ? $_REQUEST['request'] : 'Hello World!';

$client = new SoapClient
	("http://${_SERVER['SERVER_NAME']}:${_SERVER['SERVER_PORT']}/EchoService.svc?wsdl",
	 array(
		'location' => "http://${_SERVER['SERVER_NAME']}:${_SERVER['SERVER_PORT']}/EchoService.svc/Basic",
		'trace' => true,
		'soap_version' => SOAP_1_1,
		'connection_timeout' => 5
	)
);

echo "Soap Result: " . $client->echo(array('request' => $request))->EchoResult;
?>