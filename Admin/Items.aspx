<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="Items.aspx.vb" Inherits="Restaurant.Items" %>
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
                <div class="col-lg-2"><asp:Button ID="btnAdd" class="btn btn-default" runat="server" Text="&#xf067; Add new Product" UseSubmitBehavior="False" style="width:100%" /></div>
                <div class="col-lg-2"><asp:Button ID="btnAddCat" class="btn btn-default" runat="server" Text="&#xf067; Add Category" UseSubmitBehavior="False" style="width:100%" /></div>
                <div class="col-lg-2"><asp:Button ID="btnDetails" class="btn btn-default" runat="server" Text="&#xf06e; Product details" UseSubmitBehavior="False" style="width:100%" /></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="paneldetails" class ="frm" runat="server">
                <h1>Product Details</h1><hr />
               
                <div class="row">
                    <div class="col-sm-2">
                        <asp:Image ID="ItemImg" class="img-rounded" height="200px" Width="200px" 
                            runat="server" />
                    </div>
                  
                    <div class="row" style="line-height:1.7;font-weight:bold;font-size:16px">
                        <div class="col-sm-2" style="text-align:right">Product ID:</div>
                        <div class="col-sm-2"><asp:Label ID="lblItemID" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Product Name:</div>
                        <div class="col-sm-2"><asp:Label ID="lblProname" class="control-label" 
                                runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Product Category:</div>
                        <div class="col-sm-2"><asp:Label ID="lblCat" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Price:</div>
                        <div class="col-sm-2"><asp:Label ID="lblPrice" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        
                    </div>                        
             
                </div>   
              
                <hr />
                <div class="col-lg-4"></div>        
                <div class="col-lg-2"><asp:Button ID="btnUpdate" class="btn btn-default" runat="server" Text="&#xf044; Edit Product details" UseSubmitBehavior="False" style="width:100%"/></div>
                <div class="col-lg-2"><asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="&#xf014; Remove Product" UseSubmitBehavior="False" style="width:100%"/></div>

            </asp:Panel>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="panelAddCat" class ="frm" runat="server">
                <h1>Enter Category</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >Category ID :</label>                       
                        <div class="col-lg-2"><asp:TextBox ID="txtCID" class="form-control" runat="server" 
                                ReadOnly="True"></asp:TextBox></div>
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqCat" class="error" runat="server" ControlToValidate="txtCat" 
                        ErrorMessage="Category required." ValidationGroup="addCat"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Category :</label>         
                        <div class="col-lg-6"><asp:TextBox ID="txtCat" placeholder="Enter Category" class="form-control" runat="server"></asp:TextBox></div>                 
                        <div class="col-lg-3"><asp:Button id="btnSubmit" type="button" text="&#xf1d8; Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="addCat" /></div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="CatID" DataSourceID="tblCat" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:BoundField DataField="CatID" HeaderText="CatID" ReadOnly="True" 
                                        SortExpression="CatID" />
                                    <asp:BoundField DataField="CatName" HeaderText="CatName" 
                                        SortExpression="CatName" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                               
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:AccessDataSource ID="tblCat" runat="server" 
                            DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT * FROM [Category]">
                        </asp:AccessDataSource>
                    </div>
                </div> 
            </asp:Panel>
        </div>
    </div>



    <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="panelAdd" class ="frm" runat="server">
                <h1>Enter Product details</h1><hr />
                <div class="form-horizontal">
                     <div class="form-group"><label class="control-label col-lg-2" >Product ID :</label>                       
                        <div class="col-lg-2"><asp:TextBox ID="txtProId" class="form-control" runat="server" ReadOnly="True"></asp:TextBox></div>
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqname" class="error" runat="server" ControlToValidate="txtPname" ErrorMessage="Product name is required." ValidationGroup="add"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Product Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtPname" placeholder="Product name" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqPrice" class="error" runat="server" ControlToValidate="txtPrice" ErrorMessage="Product price is required." ValidationGroup="add"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Product Price :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtPrice" placeholder="Product price" class="form-control" runat="server" TextMode="Number"></asp:TextBox></div>                 
                    </div>

                    
                    <div class="form-group" style="margin-top:18px"><label class="control-label col-lg-2" >Product Category :</label>         
                        <div class="col-lg-3"><asp:DropDownList ID="selectID" runat="server" class="form-control" DataSourceID="category" DataTextField="CatName" DataValueField="CatName"></asp:DropDownList>
                            <asp:AccessDataSource ID="category" runat="server" DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT [CatName] FROM [Category]"></asp:AccessDataSource>                            
                        </div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqImage" class="error" runat="server" ControlToValidate="proimg" ErrorMessage="Please select Product Image." ValidationGroup="add"></asp:RequiredFieldValidator>
                    <div class="form-group" ><label class="control-label col-lg-2" >Product Image :</label> 
                        <div class="col-lg-2"><asp:FileUpload ID="proImg" runat="server" /></div>
                    </div>

                    <hr />
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3"><asp:Button id="btnAddItem" type="button" text="&#xf1d8; Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="add" /></div>
                    <div class="col-lg-3"><asp:Button id="btnCancel" runat="server" type="button"  
                            style="width:100%" class="btn btn-danger" Text="&#xf00d; Cancel"/></div>
                    
                </div>
            </asp:Panel>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="panelEdit" class ="frm" runat="server">
                <h1>Edit Product details</h1><hr />
                <div class="form-horizontal">
                     <div class="form-group"><label class="control-label col-lg-2" >Product ID :</label>                       
                        <div class="col-lg-2"><asp:TextBox ID="txtEditId" class="form-control" runat="server" ReadOnly="True"></asp:TextBox></div>
                     </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqEditPname" class="error" runat="server" ControlToValidate="txtEditName" ErrorMessage="Product name is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Product Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditName" placeholder="Product name" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqEditPeice" class="error" runat="server" ControlToValidate="txtEditPrice" ErrorMessage="Product price is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Product Price :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditPrice" placeholder="Product price" class="form-control" runat="server" TextMode="Number"></asp:TextBox></div>                 
                    </div>

                    
                    <div class="form-group" style="margin-top:18px"><label class="control-label col-lg-2" >Product Category :</label>         
                        <div class="col-lg-3"><asp:DropDownList ID="selectEditcat" runat="server" class="form-control" DataSourceID="category" DataTextField="CatName" DataValueField="CatName"></asp:DropDownList>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT [CatName] FROM [Category]"></asp:AccessDataSource>                            
                        </div>                 
                    </div>

                                        
                    <div class="form-group" style="margin-top:15px" ><label class="control-label col-lg-2" >Product Image :</label> 
                        <div class="col-lg-2"><asp:FileUpload ID="editImage" runat="server" /></div>
                    </div>

                    <hr />
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3"><asp:Button id="btnEditSubmit" type="button" text="&#xf1d8; Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="edit" /></div>
                    <div class="col-lg-3"><asp:Button id="btnEditCancel" runat="server" type="reset" style="width:100%" class="btn btn-danger" Text="&#xf00d; Cancel" /></div>
                    
                </div>
            </asp:Panel>
        </div>
    </div>
     <div class="row">
        <div class="col-lg-12" >

            <asp:Panel ID="panelSelect" class ="frm" runat="server"> 
                <h1>Select Product to View</h1><hr />
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <asp:GridView ID="tblItem" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="Item_ID" DataSourceID="tblItems" 
                                ForeColor="Black" GridLines="Horizontal" style="width:100%" 
                                Font-Size="Large">
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-default" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" ReadOnly="True" 
                                        SortExpression="Item_ID" />
                                    <asp:ImageField DataImageUrlField="Img">
                                        <ControlStyle CssClass="img img-rounded" Height="100px" Width="100px" />
                                    </asp:ImageField>
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

</div>
    

</asp:Content>
