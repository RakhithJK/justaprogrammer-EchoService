<%@ Page Language="C#" %><!DOCTYPE html>
<html>
<head>
    <title>Echo Service Test page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
</head>
<body>
    <form id="frmTestService" method="get" action="Default.aspx">
    <div>
        Echo String:
        <input id="request" type="text" value="" />
        <input id="response" type="text" value="" />
        <input id="btnEchoString" type="button" value="Submit" />
        <br />
    </div>
    </form>
    <script type="text/javascript">
        $("#btnEchoString").click(function () {
            var request = $("#request");
            var response = $("#response");
            $.ajax({
                url: 'EchoService.svc/JSON/Echo',
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ request: request.val() }),
                dataType: "json",
                success: function (data) {
                    response.val(data.d);
                },
                error: function (request, status, error) {
                    console.log(JSON.stringify(request));
                    ajaxOutput.val(jQuery.sprintf('Something screwed up: request: %s, status: %s, error: %s', JSON.stringify(request), status, error));
                }
            });
        });
    </script>
</body>
</html>
