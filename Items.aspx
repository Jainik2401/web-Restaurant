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
                <div class="col-lg-2"><asp:Button ID="btnAdd" class="btn btn-success" runat="server" Text="Add new Product" UseSubmitBehavior="False" style="width:100%" /></div>
                <div class="col-lg-2"><asp:Button ID="btnAddCat" class="btn btn-info" runat="server" Text="Add Category" UseSubmitBehavior="False" style="width:100%" /></div>
                <div class="col-lg-2"><asp:Button ID="btnDetails" class="btn btn-default" runat="server" Text="Product details" UseSubmitBehavior="False" style="width:100%" /></div>
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
                <div class="col-lg-2"><asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Edit Product details" UseSubmitBehavior="False" style="width:100%"/></div>
                <div class="col-lg-2"><asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Remove Product" UseSubmitBehavior="False" style="width:100%"/></div>

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
                        <div class="col-lg-9"><asp:TextBox ID="txtCat" placeholder="Enter Category" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>
                </div>
                <hr />
                <div class="col-lg-2"></div>
                <div class="col-lg-3"><asp:Button id="btnSubmit" type="button" text="Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="addCat" /></div>
        
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
                    <div class="col-lg-3"><asp:Button id="btnAddItem" type="button" text="Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="add" /></div>
                    <div class="col-lg-3"><input id="btnReset" type="reset" value="Reset" style="width:100%" class="btn btn-default"/></div>
                    
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
                    <div class="col-lg-3"><asp:Button id="btnEditSubmit" type="button" text="Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="edit" /></div>
                    <div class="col-lg-3"><input id="btnEditReset" type="reset" value="Reset" style="width:100%" class="btn btn-default"/></div>
                    
                </div>
            </asp:Panel>
        </div>
    </div>
     <div class="row">
        <div class="col-lg-12" >

            <asp:Panel ID="panelSelect" class ="frm" runat="server"> 
                <h1>Select Product ID to View</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >Product ID :</label>         
                        <div class="col-lg-2">
                            <asp:DropDownList ID="SelectItem" runat="server" class="form-control" 
                                DataSourceID="itemID" DataTextField="Item_ID" DataValueField="Item_ID"></asp:DropDownList>
                            <asp:AccessDataSource ID="itemID" runat="server" DataFile="~/App_Data/restaurant.accdb" SelectCommand="SELECT [Item_ID] FROM [Item]"></asp:AccessDataSource>
                        </div>
                        <div class="col-lg-2"><asp:Button id="btnView" type="button" text="Get Details" class="btn btn-default" style="width:100%" runat="server" UseSubmitBehavior="False" /></div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

</div>
</asp:Content>
