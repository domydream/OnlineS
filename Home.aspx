<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://oap.accuweather.com/launch.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h2>ONLINE SMS </h2>
            <h5>Welcome 
                    <asp:Label runat="server" ID="funame"></asp:Label>, Love to see you back. </h5>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <div class="row">

        <div class="col-md-4 col-sm-6 col-xs-6">
            <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>
                <div class="text-box">

                    <asp:HyperLink runat="server" NavigateUrl="~/Inbox.aspx">
                        <p class="main-text">
                            <asp:Label runat="server" ID="countMessage"> </asp:Label>
                            News
                        </p>
                        <p class="text-muted">SMS</p>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-6">
            <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bars"></i>
                </span>
                <div class="text-box">
                    <asp:HyperLink runat="server" NavigateUrl="~/Services.aspx">   
                        <p class="main-text">
                            <asp:Label ID="countSMSService" runat="server"></asp:Label>
                            Free SMS
                        </p>
                        <p class="text-muted">Remaining</p>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-6">
            <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-brown set-icon">
                    <i class="fa fa-users"></i>
                </span>
                <div class="text-box">
                    <asp:HyperLink runat="server" NavigateUrl="~/FriendRequest.aspx">      
                        <p class="main-text">
                            <asp:Label ID="countRequest" runat="server" />
                            Friend
                        </p>
                        <p class="text-muted">Request</p>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <hr />

        <div class="row" style="margin: 15px auto;">

            <div class="col-md-6 col-sm-12 col-xs-12">
                <h2>BREAKING NEWS</h2>
                <div style="width: 100%; align=center; margin: 20px auto; padding: 20px; border-radius: 18px;">
                    <script language='javascript' type='text/javascript'>
                        var keyword = 'computer, microsoft , windows, technology, mobile, smartphone, science ';
                        var type = 'HID';
                        var height = 450;
                        var width = 'Auto';
                        var border = 0;
                        var bordercolor = '#000000';
                        var textcolor = '#000000';
                        var backgroundcolor = '#ebe9e9';
                        var linkcolor = 'red';
                        var scroll = 1;
                        var scrollspeed = 1;
                        var fontfamily = 'Arial, Helvetica, sans-serif';
                        var fontsize = 12;
                        var rhost = document.URL;
                        var v = 1.0;
                    </script>
                    <script language='javascript' src='http://www.widgetmate.com/news/js/showNews.js' type='text/javascript'> </script>
                </div>

            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 ">
                <h2>WEATHER FORECAST</h2>
                <a href="http://www.accuweather.com/en/us/new-york-ny/10007/current-weather/349727" class="aw-widget-legal"></a>
                <div id="awtd1434002949071" style="margin: 20px auto; padding: 20px;" class="aw-widget-current" data-locationkey="" data-unit="c" data-language="en-us" data-useip="true" data-uid="awtd1434002949071" data-editlocation="true"></div>

            </div>
        </div>

    </div>


    <br />
</asp:Content>
