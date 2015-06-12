<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row page-content-wrap">
    <h2>Please login to continue</h2>
       <p>
            For security purpose, you must re-login to continue with your services
       </p>
    <hr />
        <div class="col-md-4">              
            <div class="form-group">
                <label>Enter your Password</label>
                <asp:TextBox runat="server" TextMode="Password" ID="pass" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:LinkButton ID="submit" runat="server" OnClick="submit_Click" CssClass="btn btn-success"><i class="fa fa-users"></i> Login</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

