<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="reports.aspx.vb" Inherits="Restaurant.reports" %>
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
                        <div class="col-lg-2">
                            <asp:Button ID="btnCust" runat="server" Text="Customer Report" class="btn btn-default" style="width:100%" />
                        </div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnOrder" runat="server" Text="Order Report" class="btn btn-default" style="width:100%" />
                        </div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnQueries" runat="server" Text="Query Report" class="btn btn-default" style="width:100%" />
                        </div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnitem" runat="server" Text="Item Report" class="btn btn-default" style="width:100%" />
                        </div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnEmp" runat="server" Text="Employee Report" class="btn btn-default" style="width:100%" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <asp:Panel ID="panelCust" class="frm" runat="server">
                    
                        <div class="col-lg-12">
                            <asp:GridView ID="tblCust" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="UserID" DataSourceID="tblCustomer" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                                        SortExpression="UserID" />
                                    <asp:BoundField DataField="fname" HeaderText="First name" 
                                        SortExpression="fname" />
                                    <asp:BoundField DataField="lname" HeaderText="Last Name" 
                                        SortExpression="lname" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact No." 
                                        SortExpression="contact_no" />
                                    <asp:BoundField DataField="address" HeaderText="Address" 
                                        SortExpression="address" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblCustomer" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                SelectCommand="SELECT * FROM [User_data]"></asp:AccessDataSource>
                        </div>
     
                </asp:Panel>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <asp:Panel ID="panelorder" class="frm" runat="server">
                    
                        <div class="col-lg-12">
                            <asp:GridView ID="tblOrder" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="OrderID" DataSourceID="tblOrders" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                                        SortExpression="OrderID" />
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                        SortExpression="UserID" />
                                    <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" 
                                        SortExpression="OrderNo" />
                                    <asp:BoundField DataField="Total Price" HeaderText="Total Price" 
                                        SortExpression="Total Price" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                    <asp:BoundField DataField="Employee" HeaderText="Employee" 
                                        SortExpression="Employee" />
                                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                                        SortExpression="OrderDate" />
                                    <asp:BoundField DataField="payment" HeaderText="payment" 
                                        SortExpression="payment" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblOrders" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                SelectCommand="SELECT * FROM [Order_details]"></asp:AccessDataSource>
                        </div>
     
                </asp:Panel>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <asp:Panel ID="panelItem" class="frm" runat="server">
                    
                        <div class="col-lg-12">
                            <asp:GridView ID="tblItem" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="Item_ID" DataSourceID="tblItems" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" ReadOnly="True" 
                                        SortExpression="Item_ID" />
                                    <asp:BoundField DataField="Item_Name" HeaderText="Item_Name" 
                                        SortExpression="Item_Name" />
                                    <asp:BoundField DataField="Item_price" HeaderText="Item_price" 
                                        SortExpression="Item_price" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" 
                                        SortExpression="Category" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblItems" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT * FROM [Item]">
                            </asp:AccessDataSource>
                        </div>
     
                </asp:Panel>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <asp:Panel ID="panelEmp" class="frm" runat="server">
                    
                        <div class="col-lg-12">
                            <asp:GridView ID="tblEmp" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="EmpID" DataSourceID="tblEmployees" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" ReadOnly="True" 
                                        SortExpression="EmpID" />
                                    <asp:BoundField DataField="EmpName" HeaderText="Employee Name" 
                                        SortExpression="EmpName" />
                                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No." 
                                        SortExpression="ContactNo" />
                                    <asp:BoundField DataField="mail" HeaderText="Email" SortExpression="mail" />
                                    <asp:BoundField DataField="DOB" HeaderText="DOB" 
                                        SortExpression="DOB" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" 
                                        SortExpression="Gender" />
                                    <asp:BoundField DataField="DOJ" HeaderText="DOJ" SortExpression="DOJ" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblEmployees" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT * FROM [Employee]">
                            </asp:AccessDataSource>
                        </div>
     
                </asp:Panel>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <asp:Panel ID="panelQue" class="frm" runat="server">
                    
                        <div class="col-lg-12">
                            <asp:GridView ID="tblQue" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="QueryID" DataSourceID="tblQueries" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="QueryID" HeaderText="QueryID" ReadOnly="True" 
                                        SortExpression="QueryID" />
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                        SortExpression="UserID" />
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" 
                                        SortExpression="Subject" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description" />
                                    <asp:BoundField DataField="Solution" HeaderText="Solution" 
                                        SortExpression="Solution" />
                                    <asp:BoundField DataField="status" HeaderText="status" 
                                        SortExpression="status" />
                                    <asp:BoundField DataField="SubmitedOn" HeaderText="SubmitedOn" 
                                        SortExpression="SubmitedOn" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblQueries" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT * FROM [Queries]">
                            </asp:AccessDataSource>
                        </div>
     
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
