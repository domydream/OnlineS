<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="FriendRequest.aspx.cs" Inherits="FriendRequest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:TextBox runat="server" ID="myID" Visible="false"></asp:TextBox>      

    <h2>Pedding Request:</h2>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ContactID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>              
           
            FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" Text='<%# Eval("FriendName") %>' />
            <br />
            FriendNumber:
            <asp:Label ID="FriendNumberLabel" runat="server" Text='<%# Eval("FriendNumber") %>' />
            <br />             
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
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
            <br />
          
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
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
             <asp:Parameter DefaultValue="2" Name="Status" Type="Int32" />
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

    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ContactID,Expr1" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
          
            FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" Text='<%# Eval("FriendName") %>' />
            <br />
            FriendNumber:
            <asp:Label ID="FriendNumberLabel" runat="server" Text='<%# Eval("FriendNumber") %>' />
            <br />           
            <asp:Button ID="UpdateButton" runat="server" CommandName="Accept" Text="Update" />           
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
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
            <br />           
           
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Accept" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
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
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineSMSConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [ContactID] = @ContactID" SelectCommand="SELECT Contact.ContactID, Contact.userID, Contact.FriendName, Contact.FriendNumber, Contact.Status, [User].userID AS Expr1 FROM Contact INNER JOIN [User] ON Contact.FriendNumber = [User].phone WHERE (Contact.userID = @userID) AND (Contact.Status = @Status)" UpdateCommand=" UPDATE [Contact] SET status = CASE userID   WHEN @Expr1 THEN '1'  WHEN @myID THEN '1'  END WHERE userID IN (@Expr1, @myID) " InsertCommand="INSERT INTO [Contact] ([userID], [FriendName], [FriendNumber], [Status]) VALUES (@userID, @FriendName, @FriendNumber, @Status)">
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
              <asp:Parameter Name="Expr1" Type="Int32" />
             <asp:ControlParameter ControlID="myID" Name="myID" PropertyName="Text" Type="Int32" />             
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

                      