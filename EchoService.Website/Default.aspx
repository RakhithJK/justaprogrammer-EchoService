<%@ Page Language="C#" %><!DOCTYPE html>
<html>
<head>
    <title>Echo Service Test page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/json2.min.js"></script>
    <script type="text/javascript" src="ObjectId-jscript/Objectid.js"></script>
</head>
<body>
    <form id="frmTestService" method="post" action="EchoClient.php">
    <p>
        Echo String:
        <input id="request" name="request" type="text" value="" />
        <input id="response" type="text" value="" />
        <input id="btnEchoString" type="button" value="Submit" />
        <input id="btnEchoStringPhp" type="submit" value="Submit to EchoClient.php" />
    </p>
    <p>
        Echo ObjectId:
        <input id="requestObjectId" type="text" value="" disabled="disabled" size='30' maxlength="24"/>
        <input id="responseObjectId" type="text" value="" size='30' maxlength="24"/>
        <input id="btnEchoObjectId" type="button" value="Submit" />
        <input id="btnNewObjectId" type="button" value="New ObjectId" />
        <br />
        <textarea id="txtResponseObjectId" cols="60" rows="7"></textarea>
    </p>
    <p>
        Guid/ObjectId generation:<br />
        Number to generate:&nbsp;<input id="txtIdCount" type="text" value="1" size='30' maxlength="24"/>
        <input id="btnGuids" type="button" value="Generate Guids" />
        <input id="btnObjectIds" type="button" value="Generate ObjectIds" />
        <br />
        <textarea id="txtIdResponse" cols="60" rows="7"></textarea>
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
                    //TODO: do something here
                }
            });
        });
        $("#btnNewObjectId").click(function () {
            var request = $("#requestObjectId");
            request.val(ObjectId());
            $("#btnEchoObjectId").click();
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
                    responseTxt.val(JSON.stringify(objectId, null, 2) + "\n" + Date(objectId.getDate()));
                },
                error: function (request, status, error) {
                    console.log(JSON.stringify(request));
                    ajaxOutput.val(jQuery.sprintf('Something screwed up: request: %s, status: %s, error: %s', JSON.stringify(request), status, error));
                }
            });
        });
        $("#btnGuids,#btnObjectIds").click(function () {
            var count = $('#txtIdCount').val();
            var response = $("#txtIdResponse");
            $.ajax({
                url: this.id == 'btnGuids'
                    ? 'EchoService.svc/JSON/GenerateGuids'
                    : 'EchoService.svc/JSON/GenerateObjectIds',
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ count: parseInt(count) }),
                dataType: "json",
                success: function (data) {
                    if (data.d.length == 0) {
                        response.val('');
                        return;
                    }
                    var output = '';

                    if (typeof (data.d[0]) == "string") {
                        for (var i in data.d) {
                            output += data.d[i] + '\n';
                        }
                    }
                    else if (typeof (data.d[0]) == "object") {
                        for (var i in data.d) {
                            output += ObjectId(data.d[i]) + '\n';
                        }
                    }
                    response.val(output);
                },
                error: function (request, status, error) {
                    //console.log(JSON.stringify(request));
                    response.val(jQuery.sprintf('Something screwed up: request: %s, status: %s, error: %s', JSON.stringify(request), status, error));
                }
            });
        });
    </script>
</body>
</html>
