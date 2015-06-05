<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="ContactList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:TextBox runat="server" Visible="false" ID="myID"></asp:TextBox>

    <h4>Add new Contact</h4>
    <div class="form-inline">
        <asp:TextBox runat="server" placeholder="Friend name" CssClass="form-control" ID="name"></asp:TextBox>
        <asp:TextBox runat="server"  placeholder="Your friend number" CssClass="form-control" ID="number"></asp:TextBox>

        <asp:LinkButton CssClass="btn btn-success" runat="server" ID="submit" OnClick="submit_Click"> Add New</asp:LinkButton>
    </div>
    <hr />
    <h2>Here are your contact</h2>
    <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ContactID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="FriendName" HeaderText="FriendName" SortExpression="FriendName" />
            <asp:BoundField DataField="FriendNumber" HeaderText="FriendNumber" SortExpression="FriendNumber" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [ContactID] = @ContactID" InsertCommand="INSERT INTO [Contact] ([userID], [FriendName], [FriendNumber], [Status]) VALUES (@userID, @FriendName, @FriendNumber, @Status)" SelectCommand="SELECT * FROM [Contact] WHERE ([userID] = @userID)" UpdateCommand="UPDATE [Contact] SET  [FriendName] = @FriendName, [FriendNumber] = @FriendNumber WHERE [ContactID] = @ContactID">
        <DeleteParameters>
            <asp:Parameter Name="ContactID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="FriendName" Type="String" />
            <asp:Parameter Name="FriendNumber" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="myID" Name="userID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FriendName" Type="String" />
            <asp:Parameter Name="FriendNumber" Type="String" />
            <asp:Parameter Name="ContactID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

