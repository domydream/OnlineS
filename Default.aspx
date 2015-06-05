<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="Recaptcha.Web" Namespace="Recaptcha.Web.UI.Controls" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OnlineSMS Login</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="Assets/plugins/bootstrap/css/style-metronic.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" style="margin-top: 10px;">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><i class="fa fa-send fa-2x"></i>ONLINESMS</a>
                </div>
                <center>
                <div class="navbar-collapse collapse" id="navbar-main">                
                  

                    <div class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <asp:TextBox ID="txtUsername" placeholder="Username" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtPassword"  placeholder="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:Button ID="btnLogin" CssClass="btn grean" runat="server" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                        </div><br />
                        <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox> Remember me &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                        <a>Forget your password? </a>
                    </div>
                </div>
            </center>
            </div>
        </nav>
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-8"></div>
                <div class="col-md-4">
                    <h3>CREATE NEW ACCOUNT</h3>
                    <div class=" form-horizontal">
                        <div class="form-body ">
                            <div class="form-group">
                                <label>Username</label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <asp:TextBox ID="txtUname" placeholder="Username" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key"></i>
                                    </span>
                                    <asp:TextBox ID="txtPass" TextMode="Password" placeholder="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope"></i>
                                    </span>
                                    <asp:TextBox ID="txtMail" placeholder="Email Address" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Phone number</label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-phone"></i>
                                    </span>
                                    <asp:TextBox ID="txtPhone" placeholder="Phone number" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div><div class="form-group">
                                <label>Full name</label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-android"></i>
                                    </span>
                                    <asp:TextBox ID="txtFullName" placeholder="Your fullname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <label>Verify code</label>
                                <cc1:Recaptcha ID="Recaptcha1" runat="server" />
                            </div>
                        </div>

                        <div class="form-actions">
                            <asp:Button ID="btnRegister" class="btn blue" runat="server" Text="Register now!" OnClick="btnRegister_Click" />
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>
    <script src="Assets/js/jquery-1.10.2.js"></script>
    <script src="Assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<%--   --%>
</body>
</html>
