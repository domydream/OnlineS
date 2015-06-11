<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Outbox.aspx.cs" Inherits="Outbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h2>Outbox Message</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <asp:TextBox runat="server" ID="mynumber" Visible="false"></asp:TextBox>
    <asp:TextBox runat="server" ID="myID" Visible="false"></asp:TextBox>

    <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SmsID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ToPhoneNumber" HeaderText="To Phone Number" SortExpression="ToPhoneNumber" />
            <asp:BoundField DataField="contents" HeaderText="contents" SortExpression="contents" />
            <asp:BoundField DataField="create_at" HeaderText="create_at" SortExpression="create_at" />
            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"  OnClientClick="return confirm('Are you sure you want to delete this message?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [SMSData] WHERE [SmsID] = @SmsID" InsertCommand="INSERT INTO [SMSData] ([UserID], [FromPhoneNumber], [ToPhoneNumber], [contents], [create_at], [status]) VALUES (@UserID, @FromPhoneNumber, @ToPhoneNumber, @contents, @create_at, @status)" SelectCommand="SELECT * FROM [SMSData] WHERE (([UserID] = @UserID) AND ([FromPhoneNumber] = @FromPhoneNumber))" UpdateCommand="UPDATE [SMSData] SET [UserID] = @UserID, [FromPhoneNumber] = @FromPhoneNumber, [ToPhoneNumber] = @ToPhoneNumber, [contents] = @contents, [create_at] = @create_at, [status] = @status WHERE [SmsID] = @SmsID">
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
            <asp:ControlParameter ControlID="myID" Name="UserID" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="mynumber" Name="FromPhoneNumber" PropertyName="Text" Type="String" />
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
    <br />
    <br />
</asp:Content>

