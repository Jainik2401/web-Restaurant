<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="cart.aspx.vb" Inherits="Restaurant.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <style>
    hr
    {
        border:1px solid #ff9933;
    }
    tr
    {
        border-bottom:1px solid #262626;
    }
    td
    {
        padding:10px;
    }
    tr:hover
    {
        box-shadow: 0 5px 5px rgba(0,0,0,0.075) inset, 0 0 20px rgba(38,38,38,0.9);
    }
    </style>
<div class="container" style="margin:0;width:100%">
    <div class="row">
        <div class="col-sm-12">
            <h3>My Cart</h3>
            <hr />
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="Cart_details" style="width:100%" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image3" runat="server" Height="100px" 
                            ImageUrl='<%# Eval("Img", "{0}") %>' cssClass="img-rounded" Width="125px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Item_Name" HeaderText="Product" 
                    SortExpression="Item_Name" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:CommandField ButtonType="Button" DeleteText="Remove" SelectText="Remove" 
                    ShowSelectButton="True">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
            
            <HeaderStyle BackColor="#262626" Font-Bold="True" ForeColor="White" 
                Height="40px" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:GridView>
        <asp:AccessDataSource ID="Cart_details" runat="server" 
            DataFile="~/App_Data/restaurant.accdb" 
            
                SelectCommand="SELECT [ID], [Img], [Item_Name], [Amount], [Qty] FROM [Cart_details] WHERE (([Status] = ?) AND ([UserID] = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="pending" Name="Status" Type="String" />
                <asp:SessionParameter Name="UserID" SessionField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <h4 style="text-align:right;background-color:#262626;color:white;padding:10px;padding-right:20%">Total:  ₹ <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></h4>
        </div>
    </div>
    
    <div class="row" style="margin-bottom:25px">
        <div class="col-sm-12">
            <hr />
            <div class="pull-right col-sm-2">
                <asp:Button ID="btnCheck" runat="server" Text="Proccess to checkout" CssClass="btn btn-default" style="width:100%"/>
            </div>
            <div class="pull-right col-sm-2">
                <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn btn-default" style="width:100%"/>
            </div>
        </div>
    </div>
</div>
</asp:Content>
