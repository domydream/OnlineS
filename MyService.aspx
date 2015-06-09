<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="MyService.aspx.cs" Inherits="MyService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
    <link href="Assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />          
  <script src="Assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox runat="server" ID="userID" Visible="false"></asp:TextBox>
    <a id="sms1" class="btn btn-success" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>Add new service</a>
    <hr />
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">REGISTER SERVICES</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Services</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="txtService" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ServiceID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" SelectCommand="SELECT [ServiceID], [Name] FROM [services]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtQuantity"></asp:TextBox>
                        <div class="form-group">
                            <label>Start date</label>
                            <input type="text" id="txtStartDate" runat="server" class="form-control" />      
                            <%--<asp:TextBox runat="server" CssClass="form-control" ID="txtStartDate"></asp:TextBox>--%>                               
                        </div>
                        <div class="form-group">
                            <label>Expiration Date</label>                              
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtExpirationDate"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Register code</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtcode"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton runat="server" CssClass="btn btn-success" OnClick="btnregister_Click" ID="btnregister"><i class="fa fa-send"></i> Register now</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" DataKeyNames="UserID,ServiceID">
        <AlternatingItemTemplate>
            <div class="panel panel-info">
                <div class="panel-heading">
                    Service: 
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:Label ID="UserIDLabel" Visible="false" runat="server" Text='<%# Eval("UserID") %>' />
                    <asp:Label ID="ServiceIDLabel" Visible="false" runat="server" Text='<%# Eval("ServiceID") %>' />
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-responsive">
                        <tr>
                            <td>ServiceDetail</td>
                            <td>
                                <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Prices </td>
                            <td>
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                $/ 1 unit     
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td>
                                <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>From date</td>
                            <td>
                                <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>ExpirationDate</td>
                            <td>
                                <asp:Label ID="ExpirationDateLabel" runat="server" Text='<%# Eval("ExpirationDate") %>' />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-footer">
                    <asp:LinkButton ID="EditButton" CssClass="btn btn-success" runat="server" CommandName="Edit"><i class="fa fa-edit"></i> Extend Service</asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to unable service?')"><i class="fa fa-trash"></i> Remove Service</asp:LinkButton>
                </div>
            </div>

        </AlternatingItemTemplate>
        <EditItemTemplate>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    Service: 
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:Label ID="UserIDLabel" Visible="false" runat="server" Text='<%# Eval("UserID") %>' />
                    <asp:Label ID="ServiceIDLabel" Visible="false" runat="server" Text='<%# Eval("ServiceID") %>' />
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-responsive">
                        <tr>
                            <td>ServiceDetail</td>
                            <td>
                                <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Prices </td>
                            <td>
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                $/1 unit     
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>From date</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Text='<%# Bind("StartDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>ExpirationDate</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("ExpirationDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-footer">
                    <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success" runat="server" CommandName="Update"> <i class="fa fa-save"></i> Save</asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" CssClass="btn btn-danger" runat="server" CommandName="Cancel"><i class="fa fa-refresh"></i> Cancel</asp:LinkButton>
                </div>
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>You not register a service yet</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="panel panel-success">
                <div class="panel-heading">
                    Service: 
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:Label ID="UserIDLabel" Visible="false" runat="server" Text='<%# Eval("UserID") %>' />
                    <asp:Label ID="ServiceIDLabel" Visible="false" runat="server" Text='<%# Eval("ServiceID") %>' />
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-responsive">
                        <tr>
                            <td>ServiceDetail</td>
                            <td>
                                <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Prices </td>
                            <td>
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                / 1 unit     
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td>
                                <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>From date</td>
                            <td>
                                <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>ExpirationDate</td>
                            <td>
                                <asp:Label ID="ExpirationDateLabel" runat="server" Text='<%# Eval("ExpirationDate") %>' />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-footer">
                    <asp:LinkButton ID="EditButton" CssClass="btn btn-success" runat="server" CommandName="Edit"><i class="fa fa-edit"></i> Extend Service</asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to unable service?')"><i class="fa fa-trash"></i> Remove Service</asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [UserService] WHERE [UserID] = @UserID AND [ServiceID] = @ServiceID" InsertCommand="INSERT INTO [UserService] ([UserID], [ServiceID], [Quantity], [State], [StartDate], [ExpirationDate]) VALUES (@UserID, @ServiceID, @Quantity, @State, @StartDate, @ExpirationDate)" SelectCommand="SELECT services.Name, services.contents, services.price,UserService.UserID, UserService.ServiceID, UserService.Quantity, UserService.StartDate, UserService.ExpirationDate, UserService.State FROM services INNER JOIN UserService ON services.ServiceID = UserService.ServiceID WHERE (UserService.UserID = @UserID)" UpdateCommand="UPDATE [UserService] SET [Quantity] = @Quantity, [State] = @State, [StartDate] = @StartDate, [ExpirationDate] = @ExpirationDate WHERE [UserID] = @UserID AND [ServiceID] = @ServiceID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ServiceID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="userID" Name="UserID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ServiceID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
</asp:Content>
