<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="FriendRequest.aspx.cs" Inherits="FriendRequest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
          
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:TextBox ID="findFriend" runat="server"  CssClass="form-control"></asp:TextBox>
    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1"
        EnableCaching="true"
        MinimumPrefixLength="1"
        ServiceMethod="ListUser"
        CompletionSetCount="1"      
        UseContextKey="true"
        CompletionInterval="1000"
        TargetControlID="findFriend"
        runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
</asp:Content>

