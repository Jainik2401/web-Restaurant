<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="menu.aspx.vb" Inherits="Restaurant.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
    hr
    {
        border:1px solid #ff9933;
    }
      input {
	    font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
        font-style: normal;
        font-weight: normal;
        text-decoration: inherit;
    }
    td:hover
    {
        box-shadow: 0 2px 2px rgba(0,0,0,0.075) inset, 0 0 20px rgba(255,153,51,0.9);
    }
    </style>
    <div class="container" style="margin:0;width:100%">
        <div class="row" style="margin-top:15px">
            <div class="col-sm-2">
                <h4>Select category:</h4>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="Cat" runat="server" DataSourceID="Icat" 
                    DataTextField="CatName" CssClass="form-control" DataValueField="CatName">
                </asp:DropDownList>
                <asp:AccessDataSource ID="Icat" runat="server" 
                    DataFile="~/App_Data/restaurant.accdb" 
                    SelectCommand="SELECT [CatName] FROM [Category]"></asp:AccessDataSource>
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnApply" runat="server" CssClass="btn btn-default" style="width:100%" Text="Apply" />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-default" style="width:100%" Text="Cancel" />
            </div>
        </div>
        <hr />
    </div>

    <asp:Panel ID="panelmain" runat="server">
    <div class="container" style="margin:0;width:100%" >
    <div class="row">
        <div class="col-sm-12">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Item_ID" 
                DataSourceID="ItemList" RepeatColumns="6" CellPadding="25" 
                CellSpacing="25" Width="100%">
                <ItemTemplate>
                    <style>
                        td
                        {
                            padding:15px;
                            border-radius:15px;
                        }
                    </style>
                    <center>
                    <asp:Image ID="Image2" runat="server" Height="150px" 
                        ImageUrl='<%# Eval("Img", "{0}") %>' Width="180px" CssClass="img-rounded" style="border-bottom:1px solid #ff9933"/>
                    
                    <br />
                    <br />
                    <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                    <br />
                        Price:
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                    ₹</span>
                    <asp:Label ID="Item_priceLabel" runat="server" 
                        Text='<%# Eval("Item_price") %>' />
                        <br />
                        Qty:
                        <asp:TextBox ID="txtQty" runat="server" Height="25px" TextMode="Number" 
                            Width="70px" ValidationGroup="qty" value="1"></asp:TextBox>
                        <br />
                        <asp:RangeValidator ID="rangeval" runat="server" 
                            ErrorMessage="Enter qty. between 1 to 100." ValidationGroup="qty" 
                            ControlToValidate="txtQty" CssClass="error" Display="static" MinimumValue="1" MaximumValue="100" Type="Integer"></asp:RangeValidator>
                        <br />
                        <asp:Button ID="btnAddCart" runat="server" Text="Add To Cart" style="width:60%" 
                            CssClass="btn btn-default" CommandName="addTocart" 
                            Commandargument='<%# Eval("Item_ID") %>' ValidationGroup="qty"/>
                        
                    </center>
                </ItemTemplate>
            </asp:DataList>
            <asp:AccessDataSource ID="ItemList" runat="server" 
                DataFile="~/App_Data/restaurant.accdb" 
                SelectCommand="SELECT [Item_ID], [Item_Name], [Item_price], [Img] FROM [Item]">
            </asp:AccessDataSource>
            
        </div>
    </div>
    </div>
    </asp:Panel>


    <asp:Panel ID="panelFilter" runat="server">
    <div class="container" style="margin:0;width:100%" >
    <div class="row">
        <div class="col-sm-12">
           <asp:DataList ID="DataList2" runat="server" DataKeyField="Item_ID" 
                DataSourceID="AccessDataSource1" RepeatColumns="6" CellPadding="25" 
                CellSpacing="25" Width="100%">
                <ItemTemplate>
                    <style>
                        td
                        {
                            padding:15px;
                            border-radius:15px;
                        }
                    </style>
                    <center>
                    <asp:Image ID="Image2" runat="server" Height="150px" 
                        ImageUrl='<%# Eval("Img", "{0}") %>' Width="180px" CssClass="img-rounded" style="border-bottom:1px solid #ff9933"/>
                    
                    <br />
                    <br />
                    <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                    <br />
                        Price:
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                    ₹</span>
                    <asp:Label ID="Item_priceLabel" runat="server" 
                        Text='<%# Eval("Item_price") %>' />
                        <br />
                        Qty:
                        <asp:TextBox ID="txtQty" runat="server" Height="25px" TextMode="Number" 
                            Width="70px" ValidationGroup="qty" value="1"></asp:TextBox>
                        <br />
                        <asp:RangeValidator ID="rangeval" runat="server" 
                            ErrorMessage="Enter qty. between 1 to 100." ValidationGroup="qty" 
                            ControlToValidate="txtQty" CssClass="error" Display="static" MinimumValue="1" MaximumValue="100" Type="Integer"></asp:RangeValidator>
                        <br />
                        <asp:Button ID="btnAddCart" runat="server" Text="Add To Cart" style="width:60%" CssClass="btn btn-default"  CommandName="addTocart" Commandargument='<%# Eval("Item_ID") %>' />
                        
                    </center>
                </ItemTemplate>
            </asp:DataList>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/restaurant.accdb" 
                
                SelectCommand="SELECT [Item_ID], [Item_Name], [Item_price], [Img] FROM [Item] WHERE ([Category] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="Category" SessionField="cat" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
            
        </div>
    </div>
    </div>
    </asp:Panel>

</asp:Content>
