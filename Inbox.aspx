<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Assets/css/chat.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row container">
        <h2>Unread message</h2>
        <asp:TextBox ID="phoneNUM" Visible="false" runat="server"></asp:TextBox>
        <asp:TextBox ID="userID" Visible="false" runat="server"></asp:TextBox>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [SMSData] WHERE [SmsID] = @SmsID" SelectCommand="SELECT [User].UserName, [User].image, SMSData.SmsID, SMSData.UserID, SMSData.FromPhoneNumber, SMSData.ToPhoneNumber, SMSData.contents, SMSData.create_at, SMSData.status FROM SMSData INNER JOIN [User] ON SMSData.FromPhoneNumber = [User].phone WHERE (SMSData.ToPhoneNumber = @ToPhoneNumber) AND (SMSData.UserID = @UserID) AND (SMSData.Status=0)" UpdateCommand="UPDATE [SMSData] SET  [status] =1 WHERE [SmsID] = @SmsID">
            <DeleteParameters>
                <asp:Parameter Name="SmsID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="phoneNUM" Name="ToPhoneNumber" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="userID" Name="UserID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SmsID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="SmsID" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>

                <%-- <div class="bubbledRight">
        Error dicunt theophrastus cu qui. Ad eos simul possit option, adipisci principes sed at. Detracto adolescens pro ea, duo no
    </div>--%>
                <div class="commentArea">
                    <div class="bubbledLeft">
                        <div class="row">
                            <div class="col-md-3 avatar">

                                <asp:Image ID="imageLabel" CssClass="img-circle" Width="70px" Height="70px" runat="server" ImageUrl='<%# Eval("image") %>' /><br />

                                <asp:Label ID="UserNameLabel" CssClass="text-center" runat="server" Text='<%# Eval("UserName") %>' />

                            </div>
                            <div class="col-md-9" style="padding: 10px;">
                                From:
                                <asp:Label ID="FromPhoneNumberLabel" runat="server" Text='<%# Eval("FromPhoneNumber") %>' />
                                <div class="contentchat">
                                    <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                                </div>
                                <span style="font: italic 10px; color: whitesmoke; padding-top: 10px;">
                                    <asp:Label ID="create_atLabel" runat="server" Text='<%# Eval("create_at") %>' />
                                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                </span>
                                <br />
                                <br />
                                <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success btn-sm " runat="server" CommandName="Update"><i class="fa fa-archive"></i> Archieve</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" CssClass=" btn btn-danger btn-sm " runat="server" CommandName="Delete"><i class="fa fa-trash"></i> Delete</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </AlternatingItemTemplate>
            <EditItemTemplate>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No unread SMS.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="commentArea">
                    <div class="bubbledLeft">
                        <div class="row">
                            <div class="col-md-3 avatar">

                                <asp:Image ID="imageLabel" CssClass="img-circle" Width="70px" Height="70px" runat="server" ImageUrl='<%# Eval("image") %>' /><br />

                                <asp:Label ID="UserNameLabel" CssClass="text-center" runat="server" Text='<%# Eval("UserName") %>' />

                            </div>
                            <div class="col-md-9" style="padding: 10px;">
                                From:
                                <asp:Label ID="FromPhoneNumberLabel" runat="server" Text='<%# Eval("FromPhoneNumber") %>' />
                                <div class="contentchat">
                                    <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                                </div>
                                <span style="font: italic 10px; color: whitesmoke; padding-top: 10px;">
                                    <asp:Label ID="create_atLabel" runat="server" Text='<%# Eval("create_at") %>' />
                                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                </span>
                                <br />
                                <br />
                                <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success btn-sm " runat="server" CommandName="Update"><i class="fa fa-archive"></i> Archieve</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" CssClass=" btn btn-danger btn-sm " runat="server" CommandName="Delete"><i class="fa fa-trash"></i> Delete</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="clear: both">
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
        <h2>My inbox</h2>
        <div class="col-md-9">

            <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" BorderStyle="None" runat="server" AutoGenerateColumns="False" DataKeyNames="SmsID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="From" InsertVisible="False" ReadOnly="True" SortExpression="ContactID" />
                    <asp:BoundField DataField="FromPhoneNumber" HeaderText="phone" SortExpression="FromPhoneNumber" />
                    <asp:BoundField DataField="contents" HeaderText="contents" SortExpression="contents" />
                    <asp:BoundField DataField="create_at" HeaderText="Time" SortExpression="create_at" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are you sure to delete SMS')" runat="server" CausesValidation="False" CommandName="Delete"><i class="fa fa-trash"></i> Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [SMSData] WHERE [SmsID] = @SmsID" SelectCommand="SELECT [User].UserName, [User].image, SMSData.SmsID, SMSData.UserID, SMSData.FromPhoneNumber, SMSData.ToPhoneNumber, SMSData.contents, SMSData.create_at, SMSData.status FROM SMSData INNER JOIN [User] ON SMSData.FromPhoneNumber = [User].phone WHERE (SMSData.ToPhoneNumber = @ToPhoneNumber) AND (SMSData.UserID = @UserID) AND (SMSData.Status=1)" UpdateCommand="UPDATE [SMSData] SET  [status] =1 WHERE [SmsID] = @SmsID">
                <DeleteParameters>
                    <asp:Parameter Name="SmsID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="phoneNUM" Name="ToPhoneNumber" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="userID" Name="UserID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SmsID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>

</asp:Content>

