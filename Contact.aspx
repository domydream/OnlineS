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
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure to remove contact?')" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
         
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [ContactID] = @ContactID" InsertCommand="INSERT INTO [Contact] ([userID], [FriendName], [FriendNumber], [Status]) VALUES (@userID, @FriendName, @FriendNumber, @Status)" SelectCommand="SELECT * FROM [Contact] WHERE (([userID] = @userID) AND ([Status] = @Status))" UpdateCommand="UPDATE [Contact] SET [userID] = @userID, [FriendName] = @FriendName, [FriendNumber] = @FriendNumber, [Status] = @Status WHERE [ContactID] = @ContactID">
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
            <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="FriendName" Type="String" />
            <asp:Parameter Name="FriendNumber" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ContactID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

