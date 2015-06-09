<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="ServicesControl.aspx.cs" Inherits="ServicesControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h2>Add new Service</h2>
        <div class="col-md-5">
            <div class="form-group">
                <label>Name service</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>content</label>
                <asp:TextBox TextMode="MultiLine" runat="server" ID="txtContent" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Price</label>
                <asp:TextBox runat="server" ID="txtprice" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>State</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="txtState">
                    <asp:ListItem Value="0" Text="Unavailable"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Available" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
             <div class="form-group">
               <asp:LinkButton runat="server" ID="create" OnClick="create_Click" CssClass="btn btn-success"> <i class="fa fa-plus"></i> Add new</asp:LinkButton>
            </div>
        </div>
    </div>
    <div>
        <asp:GridView runat="server" CssClass="table table-responsive table-hover" ID="servicelist" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="contents" HeaderText="contents" SortExpression="contents" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="fa fa-save"></i></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="fa fa-backward"></i></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" ><i class="fa fa-edit"></i> Edit</asp:LinkButton>
                       <%-- &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>--%>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete service?')" Text="Delete"><i class="fa fa-trash"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [services] WHERE [ServiceID] = @ServiceID" InsertCommand="INSERT INTO [services] ([Name], [contents], [price], [state]) VALUES (@Name, @contents, @price, @state)" SelectCommand="SELECT * FROM [services]" UpdateCommand="UPDATE [services] SET [Name] = @Name, [contents] = @contents, [price] = @price, [state] = @state WHERE [ServiceID] = @ServiceID">
            <DeleteParameters>
                <asp:Parameter Name="ServiceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="contents" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="state" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="contents" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="state" Type="Int32" />
                <asp:Parameter Name="ServiceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

