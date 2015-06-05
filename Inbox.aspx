<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox ID="phoneNUM" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="userID" Visible="false" runat="server"></asp:TextBox>

    <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SmsID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="FromPhoneNumber" HeaderText="FromPhoneNumber" SortExpression="FromPhoneNumber" />
            <asp:BoundField DataField="contents" HeaderText="contents" SortExpression="contents" />
            <asp:BoundField DataField="create_at" HeaderText="create_at" SortExpression="create_at" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [SMSData] WHERE [SmsID] = @SmsID" InsertCommand="INSERT INTO [SMSData] ([UserID], [FromPhoneNumber], [ToPhoneNumber], [contents], [create_at], [status]) VALUES (@UserID, @FromPhoneNumber, @ToPhoneNumber, @contents, @create_at, @status)" SelectCommand="SELECT * FROM [SMSData] WHERE (([ToPhoneNumber] = @ToPhoneNumber) AND ([UserID] = @UserID))" UpdateCommand="UPDATE [SMSData] SET [UserID] = @UserID, [FromPhoneNumber] = @FromPhoneNumber, [ToPhoneNumber] = @ToPhoneNumber, [contents] = @contents, [create_at] = @create_at, [status] = @status WHERE [SmsID] = @SmsID">
        <DeleteParameters>
            <asp:Parameter Name="SmsID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="FromPhoneNumber" Type="String" />
            <asp:Parameter Name="ToPhoneNumber" Type="String" />
            <asp:Parameter Name="contents" Type="String" />
            <asp:Parameter Name="create_at" Type="DateTime" />
            <asp:Parameter Name="status" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="phoneNUM" Name="ToPhoneNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="userID" Name="UserID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="FromPhoneNumber" Type="String" />
            <asp:Parameter Name="ToPhoneNumber" Type="String" />
            <asp:Parameter Name="contents" Type="String" />
            <asp:Parameter Name="create_at" Type="DateTime" />
            <asp:Parameter Name="status" Type="Int32" />
            <asp:Parameter Name="SmsID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

