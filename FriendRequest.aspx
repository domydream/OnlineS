<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="FriendRequest.aspx.cs" Inherits="FriendRequest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:TextBox runat="server" ID="myID" Visible="false"></asp:TextBox>
    <h2>Pedding Request:</h2>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ContactID">
        <AlternatingItemTemplate>          
            FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" Text='<%# Eval("FriendName") %>' />
            <br />
            FriendNumber:
            <asp:Label ID="FriendNumberLabel" runat="server" Text='<%# Eval("FriendNumber") %>' />           
             <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
            <br />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
           
        </InsertItemTemplate>
        <ItemTemplate>                
            FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" Text='<%# Eval("FriendName") %>' />
            <br />
            FriendNumber:
            <asp:Label ID="FriendNumberLabel" runat="server" Text='<%# Eval("FriendNumber") %>' />
            <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
            <br />        
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
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
            <asp:Parameter DefaultValue="0" Name="Status" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="FriendName" Type="String" />
            <asp:Parameter Name="FriendNumber" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ContactID" Type="Int32" />
        </UpdateParameters>
     </asp:SqlDataSource>
          
     <hr />
    <h2>Friend request</h2> 
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="userID,ContactID">
        <AlternatingItemTemplate> 
                 <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />               
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />              
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            phone:
            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
            <br />
            fullname:
            <asp:Label ID="fullnameLabel" runat="server" Text='<%# Eval("fullname") %>' />
            <br />
            image:
            <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
            <br />    
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Accept" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Cancel" />
<br /><br /></span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            Friend request accepted!
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <
        </InsertItemTemplate>
        <ItemTemplate>
           <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            Password:
            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            phone:
            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
            <br />
            fullname:
            <asp:Label ID="fullnameLabel" runat="server" Text='<%# Eval("fullname") %>' />
            <br />
            image:
            <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
            <br />             
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Accept" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Remove" />
<br /><br /></span>
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

      <asp:TextBox runat="server" ID="mynum" Visible="false"></asp:TextBox>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [ContactID] = @ContactID" SelectCommand="SELECT [User].*,[Contact].* FROM [Contact] JOIN [User] ON [User].UserID=[Contact].userID WHERE (([FriendNumber] = @FriendNumber) AND ([Status] = @Status))" UpdateCommand="UPDATE [Contact] SET [Status] = 1 WHERE [ContactID] = @ContactID">
         <DeleteParameters>
             <asp:Parameter Name="ContactID" Type="Int32" />
         </DeleteParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="mynum" Name="FriendNumber" PropertyName="Text" Type="String" />
             <asp:Parameter DefaultValue="0" Name="Status" Type="Int32" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="ContactID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>


</asp:Content>

