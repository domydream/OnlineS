<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="Assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="textbox" runat="server"></asp:TextBox>
    </div>
    </form>
    <script src="Assets/js/jquery-1.10.2.js"></script>
    <script src="Assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="Assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
       <script>
           $(document).ready(function () {
               var dp = $('#<%=textbox.ClientID%>');
            dp.datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "en"
            }).on('changeDate', function (ev) {
                $(this).blur();
                $(this).datepicker('hide');
            });
        });
    </script>
</body>
</html>
