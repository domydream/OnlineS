<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="FindFriend.aspx.cs" Inherits="FindFriend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row container">
            <asp:Label ID="info"  runat="server"></asp:Label>
        <div class="panel panel-info col-md-8 col-md-offset-1 ">
            <div class="panel-heading">
                <asp:Label ID="Fullname" runat="server" />
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Image ID="imgUser" CssClass="img-responsive img-thumbnail user-image" runat="server" />

                    </div>
                    <div class="col-md-8">
                        <table class="table table-hover table-responsive">
                            <tr>
                                <td>UserName</td>
                                <td>
                                    <asp:Label ID="lblUsername" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Phone number</td>
                                <td>
                                    <asp:Label runat="server" ID="lblPhone"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:LinkButton ID="Requestbutton" OnClick="Requestbutton_Click" CssClass="btn btn-success" runat="server" ><i class="fa fa-user-plus"></i> Send friend request </asp:LinkButton>
              
            </div>
        </div>
    </div>
</asp:Content>

