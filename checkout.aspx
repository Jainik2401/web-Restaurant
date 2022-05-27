<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="checkout.aspx.vb" Inherits="Restaurant.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    th
    {
        border:none;
        border-bottom:1px solid white;
    }
    table
    {
        border-bottom:1px solid white;
    }
    .shipping tr
    {
        border-bottom:1px solid white;
        padding:5px;
    }
    .shipping td
    {
        padding:5px;
    }
</style>
<div class="container" style="margin:0;width:100%">
    <div class="row">
        <div class="col-sm-6" style="padding:15px">
            <div class="poster" style="width:100%;padding:10px">
                <div class="row">
                    <div class="col-sm-12">
                    <h3>Cart Details</h3>
                    <hr style="border-width:2px" />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="cart_data" GridLines="None" style="width:100%">
                            <Columns>
                                <asp:BoundField DataField="Item_Name" HeaderText="Product" 
                                    SortExpression="Item_Name" />
                                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                                    SortExpression="Amount" />
                            </Columns>
                            <HeaderStyle BackColor="#262626" ForeColor="White" />
                            <RowStyle BackColor="#262626" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="cart_data" runat="server" 
                            DataFile="~/App_Data/restaurant.accdb" 
                            SelectCommand="SELECT [Qty], [Amount], [Item_Name] FROM [Cart_details] WHERE (([Status] = ?) AND ([UserID] = ?))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="pending" Name="Status" Type="String" />
                                <asp:SessionParameter Name="UserID" SessionField="uid" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                        <div class="row">
                            <div class="col-sm-12">
                                <p style="text-align:right;padding:10px;padding-right:30%;">Total: ₹ 
                                    <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6" style="padding:15px">
            <div class="poster" style="width:100%;padding:10px">
                <div class="row">
                    <div class="col-sm-12">
                        <h3>Shipping details</h3>
                        <hr style="border-width:2px" />
                    
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
                        AutoGenerateRows="False" BackColor="#262626" DataSourceID="shipping" 
                            style="width:100%" GridLines="None" cssclass="shipping">
                        
                        <Fields>
                            <asp:BoundField DataField="address" HeaderText="Address :   " 
                                SortExpression="address" />
                            
                            <asp:BoundField DataField="contact_no" HeaderText="Contact No. :" 
                                SortExpression="contact_no" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:AccessDataSource ID="shipping" runat="server" 
                        DataFile="~/App_Data/restaurant.accdb" 
                        SelectCommand="SELECT [contact_no], [address] FROM [User_data] WHERE ([UserID] = ?)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="uid" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="padding:15px">
        <div class="col-sm-2 pull-right">
            <asp:Button ID="btnPlace" runat="server" Text="Place Order" CssClass="btn btn-default" style="width:100%" />
        </div>
    </div>
</div>
</asp:Content>
