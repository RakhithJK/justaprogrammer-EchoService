<%@ Page Language="C#" %><!DOCTYPE html>
<html>
<head>
    <title>Echo Service Test page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script type="text/javascript" src="ObjectId-jscript/Objectid.js"></script>
</head>
<body>
    <form id="frmTestService" method="get" action="Default.aspx">
    <p>
        Echo String:
        <input id="request" type="text" value="" />
        <input id="response" type="text" value="" />
        <input id="btnEchoString" type="button" value="Submit" />
    </p>
    <p>
        Echo ObjectId:
        <input id="requestObjectId" type="text" value="" disabled="disabled" size='30' maxlength="24"/>
        <input id="responseObjectId" type="text" value="" size='30' maxlength="24"/>
        <input id="btnEchoObjectId" type="button" value="Submit" />
        <input id="btnNewObjectId" type="button" value="New ObjectId" />
        <br />
        <textarea id="txtResponseObjectId" cols="30" rows="7"></textarea>
    </p>
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
        $("#btnNewObjectId").click(function () {
            var request = $("#requestObjectId");
            request.val(ObjectId());
        });
        $("#btnEchoObjectId").click(function () {
            var request = $("#requestObjectId");
            var response = $("#responseObjectId");
            var responseTxt = $("#txtResponseObjectId");
            $.ajax({
                url: 'EchoService.svc/JSON/EchoObjectId',
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ request: new ObjectId(request.val()) }),
                dataType: "json",
                success: function (data) {
                    var objectId = new ObjectId(data.d);
                    response.val(objectId.toString());
                    responseTxt.val(JSON.stringify(objectId, null, 2));
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
