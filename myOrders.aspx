<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="myOrders.aspx.vb" Inherits="Restaurant.myOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    hr
    {
        border:1px solid #ff9933;
    }
    
    </style>
    <div class="container" style="margin:0;width:100%">
    <div class="row" >
    <div class="col-sm-2" style="padding:0">
        
       <asp:Menu ID="Menu1" runat="server" CssClass="sidenav">
            <Items>
                <asp:MenuItem Text="My Profile" Value="My Profile" NavigateUrl="~/profile.aspx"></asp:MenuItem>
                <asp:MenuItem Text="My Cart" Value="My Cart" NavigateUrl="~/cart.aspx"></asp:MenuItem>
                <asp:MenuItem Text="My Orders" Value="My Orders" NavigateUrl="~/myOrders.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Change Password" Value="Change Password" NavigateUrl="~/changepass.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Log Out" Value="Log Out" NavigateUrl="~/logout.aspx"></asp:MenuItem>
            </Items>
        </asp:Menu>

    </div>
    
    <div class="col-sm-10" style="padding:20px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="Cart_details" style="width:100%" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" 
                    SortExpression="OrderNo" />
                <asp:ImageField DataImageUrlField="Img">
                    <ControlStyle CssClass="img-rounded" Height="100px" Width="125px" />
                </asp:ImageField>
                <asp:BoundField DataField="Item_Name" HeaderText="Product" 
                    SortExpression="Item_Name" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" 
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
            </Columns>
            
            <EmptyDataTemplate>
                <asp:Image ID="Image2" runat="server" CssClass="img-rounded" Height="100px" 
                    ImageUrl='<%# Eval("Img", "{0}") %>' Width="125px" />
            </EmptyDataTemplate>
            
            <HeaderStyle BackColor="#262626" Font-Bold="True" ForeColor="White" 
                Height="40px" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:GridView>
        <asp:AccessDataSource ID="Cart_details" runat="server" 
            DataFile="~/App_Data/restaurant.accdb" 
            
                
            SelectCommand="SELECT [Status], [OrderDate], [Amount], [Qty], [Item_Name], [Img], [OrderNo] FROM [MyOrders] WHERE ([UserID] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
         
    </div>
    </div>
    </div>
</asp:Content>
