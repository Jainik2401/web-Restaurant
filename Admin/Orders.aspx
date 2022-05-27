<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="Orders.aspx.vb" Inherits="Restaurant.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .frm
    {
        box-sizing: border-box;
	    overflow: hidden;
	    box-shadow: 0px 2px 25px 10px rgba(0,0,0,.7);
	    margin-top:25px;
	    padding:15px;
    }
    input {
	    font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
        font-style: normal;
        font-weight: normal;
        text-decoration: inherit;
    }
    .form-control:focus
    {
        border-color:#ff9933;
        outline:none;
        box-shadow: 0 2px 2px rgba(0,0,0,0.075) inset, 0 0 20px rgba(255,153,51,0.9);
    }
    .btn-default
    {
        background-color:#ff9933;
        border:1px solid #ff9933;
        color:White;
    }
    .btn-default:hover
    {
        background-color:white;
        color:black;
        transition: 0.9s;
        border: 1px solid #ff9933;
    }
    hr
    {
        border-bottom:2px solid #ff9933;
    }
    
    .form-group
    {
        margin-bottom:0;        
    }
    .btn-primary:hover
    {
         background-color:white;
        color:black;
        transition: 0.9s;
        border: 1px solid #2e6da4;
    }
    .btn-danger:hover
    {
        background-color:white;
        color:black;
        transition: 0.9s;
        border: 1px solid #d43f3a;
    }
    .btn-success:hover
    {
        background-color:white;
        color:black;
        transition: 0.9s;
        border: 1px solid #4cae4c;
    }
     .btn-info:hover
    {
        background-color:white;
        color:black;
        transition: 0.9s;
        border: 1px solid #46b8da;
    }
</style>

<div class="container" style="margin:0;width:100%">
    
    <div class="row">      
        <div class="col-lg-12">
            <div class="frm">
            <div class="row">
                <div class="col-lg-2" style="text-align:right">
                    <h4> Select to view:</h4>
                </div>
                <div class="col-lg-4">
                <asp:DropDownList ID="type" runat="server" class="form-control">
                    <asp:ListItem Value="pending">Pending Orders</asp:ListItem>
                    <asp:ListItem Value="completed">Completed Orders</asp:ListItem>
                    <asp:ListItem Value="canceled">Canceled orders</asp:ListItem>
                </asp:DropDownList>
                </div>
                <div class="col-lg-2"><asp:Button ID="btnview" class="btn btn-default" runat="server" Text="&#xf06e; View details" UseSubmitBehavior="False" style="width:100%" /></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="paneldetails" class ="frm" runat="server">
                <h1><asp:Label ID="lbltype" runat="server" Text="Label"></asp:Label></h1><hr />
               
                <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <asp:GridView ID="cancelled" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                        CellPadding="5" CellSpacing="5" DataKeyNames="OrderID" 
                        DataSourceID="Cancelleddetails" GridLines="Horizontal" 
                        style="width:100%;line-height:1.8">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                                SortExpression="OrderID" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                SortExpression="UserID" />
                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo." 
                                SortExpression="CartID" />
                            <asp:BoundField DataField="Total_Price" HeaderText="Total_Price" 
                                SortExpression="Total_Price" />
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                                SortExpression="OrderDate" />
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="&#xf06e; View">
                            <ControlStyle CssClass="btn btn-default" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#FF9933" ForeColor="Black" />
                        <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                      
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>       
                </div>
                    <asp:AccessDataSource ID="Cancelleddetails" runat="server" 
                        DataFile="~/App_Data/restaurant.accdb" 
                        
                        
                        SelectCommand="SELECT [OrderID], [UserID], [OrderNo], [Total Price] AS Total_Price, [OrderDate] FROM [Order_details] WHERE ([Status] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="type" Name="Status" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
             
                </div>   
              
                <hr />
                

            </asp:Panel>
        </div>
    </div>


     <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="panelpending" class ="frm" runat="server">
                <h1>Pending orders Details</h1><hr />
               
                <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <asp:GridView ID="tblpending" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                        CellPadding="5" CellSpacing="5" DataKeyNames="OrderID" 
                        DataSourceID="pending" GridLines="Horizontal" 
                        style="width:100%;line-height:1.8">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                                SortExpression="OrderID"/>
                            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                SortExpression="UserID" />
                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo." 
                                SortExpression="CartID" />
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                                SortExpression="OrderDate" />
                            <asp:BoundField DataField="Total_Price" HeaderText="Total_Price" 
                                SortExpression="Total_Price" />
                            <asp:CommandField ButtonType="Button" SelectText="&#xf06e; View" ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-default" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#FF9933" ForeColor="Black" />
                        <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                       
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>       
                    <asp:AccessDataSource ID="pending" runat="server" 
                        DataFile="~/App_Data/restaurant.accdb" 
                        
                        SelectCommand="SELECT [OrderID], [UserID], [OrderNo], [OrderDate], [Total Price] AS Total_Price FROM [Order_details]">
                    </asp:AccessDataSource>
                </div>             
                </div>                
                <hr />              

            </asp:Panel>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12" >
            <asp:Panel ID="panelcanceled" class ="frm" runat="server">
                <h1>Order details</h1><hr />
                <div class="row">                   
                    <div class="col-lg-4">
                        <div class="row" style="line-height:1.7;font-weight:bold;font-size:16px">
                        <div class="col-lg-6" style="text-align:right">Order ID:</div>
                        <div class="col-lg-6"><asp:Label ID="lblOrderID" class="control-label" runat="server" Text="Label"></asp:Label></div>
               
                        <br />
                        <div class="col-lg-6" style="text-align:right">Cart ID:</div>
                        <div class="col-lg-6"><asp:Label ID="lblCartid" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        
                        <br />
                        <div class="col-lg-6" style="text-align:right">Total Amount:</div>
                        <div class="col-lg-6"><asp:Label ID="lbltotal" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        
                        <br />
                        <div class="col-lg-6" style="text-align:right">Order Date:</div>
                        <div class="col-lg-6"><asp:Label ID="lbldate" class="control-label" runat="server" Text="Label"></asp:Label></div>  
     
                        </div>
                    </div>
                  

                    <div class="col-lg-5">
                    <div class="row">
                        <h3>Cart details:</h3><hr />
                        <div class="col-sm-12">
                        <asp:GridView ID="cartview" runat="server" 
                        CellPadding="4" GridLines="Horizontal" style="width:100%;line-height:1.5" 
                            ForeColor="#333333" AutoGenerateColumns="False" DataKeyNames="ID" 
                                DataSourceID="cartdetails">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                                    SortExpression="ItemID" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                                    SortExpression="Amount" />
                                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                          
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                            <asp:AccessDataSource ID="cartdetails" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                
                                SelectCommand="SELECT [ID], [ItemID], [Amount], [Qty] FROM [Cart] WHERE ([OrderNo] = ?)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OrderNo" SessionField="CartID" Type="Int32" />
                                </SelectParameters>
                            </asp:AccessDataSource>
                        </div>
                    </div>                    
                    </div>
                </div>
                <hr />
                <div class="row">
                <div class="col-sm-12"><h2>User details:</h2><hr /></div>
                <div class="col-lg-8">
                <div class="row" style="line-height:1.7;font-weight:bold;font-size:16px">
                
                
                <div class="col-lg-1"></div>
                <div class="col-lg-5">
                <div class="row">
                    <div class="col-sm-4" style="text-align:right">User ID:</div>
                    <div class="col-sm-4"><asp:Label ID="lbluid" class="control-label" runat="server" Text="Label"></asp:Label></div>
             
                </div>
                <div class="row">
                    <div class="col-sm-4" style="text-align:right">First Name:</div>
                    <div class="col-sm-4"><asp:Label ID="lblFname" class="control-label" runat="server" Text="Label"></asp:Label></div>
                
                </div>
                <div class="row">                   
                    <div class="col-sm-4" style="text-align:right">Last Name:</div>
                    <div class="col-sm-4"><asp:Label ID="lbllname" class="control-label" runat="server" Text="Label"></asp:Label></div>
                
                </div>
                </div>
                <div class="col-lg-5">
                <div class="row">
                    <div class="col-sm-4" style="text-align:right">Contact No:</div>
                    <div class="col-sm-4"><asp:Label ID="lblContact" class="control-label" runat="server" Text="Label"></asp:Label></div>                
                </div>     
                <div class="row">
                    <div class="col-sm-4" style="text-align:right">Email:</div>
                    <div class="col-sm-4"><asp:Label ID="lblmail" class="control-label" runat="server" Text="Label"></asp:Label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4" style="text-align:right">Address:</div>
                    <div class="col-sm-4"><asp:Label ID="lblAddress" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        
                </div> 
                </div> 
                </div>  
                </div>
                </div>
                <hr />
               
                <div class="col-lg-2"><asp:Button ID="btnDeleteOrder" class="btn btn-danger" runat="server" Text="&#xf014; Remove Order" UseSubmitBehavior="False" style="width:100%"/></div>
                <div class="col-lg-2"><asp:Button ID="btnComp" class="btn btn-default" runat="server" Text="&#xf00c; Complete order" UseSubmitBehavior="False" style="width:100%"/></div>
                
            </asp:Panel>

            <div class="row">
                <div class="col-lg-12">
                     <asp:Panel ID="panelCompOrder" class="frm" runat="server">
                    <div class="row">
                        <div class="col-lg-2">
                            <h4> Select Employee ID:</h4>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList ID="EmpID" runat="server" class="form-control" DataSourceID="Emp" 
                                DataTextField="EmpID" DataValueField="EmpID">
                            </asp:DropDownList>
                            <asp:AccessDataSource ID="Emp" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                SelectCommand="SELECT [EmpID] FROM [Employee]"></asp:AccessDataSource>
                        </div>
                        <div class="col-lg-2"><asp:Button ID="btnSubmit" class="btn btn-default" runat="server" Text="&#xf1d8; Submit" UseSubmitBehavior="False" style="width:100%"/></div>
                    </div>
                </asp:Panel> 
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
