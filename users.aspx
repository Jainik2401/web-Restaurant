<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="users.aspx.vb" Inherits="Restaurant.users" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        <div class="col-lg-12" >

            <asp:Panel ID="panelSelect" class ="frm" runat="server"> 
                <h1>Select User ID to View</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >User ID :</label>         
                        <div class="col-lg-2">
                            <asp:DropDownList ID="selectUser" runat="server" class="form-control" 
                                DataSourceID="UserId" DataTextField="UserID" DataValueField="UserID"></asp:DropDownList>
                            <asp:AccessDataSource ID="UserId" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                SelectCommand="SELECT [UserID] FROM [User_data]"></asp:AccessDataSource>
                        </div>
                        <div class="col-lg-2"><asp:Button id="btnView" type="button" text="Get Details" class="btn btn-default" style="width:100%" runat="server" UseSubmitBehavior="False" /></div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        </div>

        <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="paneldetails" class ="frm" runat="server">
                <h1>User Details:</h1><hr />
               
                <div class="row">
                    <div class="col-sm-2">
                        <asp:Image ID="userImg" class="img-circle" height="200px" Width="200px" 
                            runat="server" />
                    </div>
                   
                    <div class="row" style="line-height:1.7;font-weight:bold;font-size:16px">
                        <div class="col-sm-2" style="text-align:right">User ID:</div>
                        <div class="col-sm-2"><asp:Label ID="lbluid" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">First Name:</div>
                        <div class="col-sm-2"><asp:Label ID="lblFname" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Last Name:</div>
                        <div class="col-sm-2"><asp:Label ID="lbllname" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Email:</div>
                        <div class="col-sm-2"><asp:Label ID="lblmail" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Contact No:</div>
                        <div class="col-sm-2"><asp:Label ID="lblContact" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />
                        <div class="col-sm-2" style="text-align:right">Address:</div>
                        <div class="col-sm-2"><asp:Label ID="lblAddress" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        
                    </div>                        
               
                </div>   
              
                <hr />
                <div class="col-lg-4"></div>        
                <div class="col-lg-2"><asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Edit User details" UseSubmitBehavior="False" style="width:100%"/></div>
                <div class="col-lg-2"><asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Remove User" UseSubmitBehavior="False" style="width:100%"/></div>

            </asp:Panel>
        </div>
        </div>

       


        <div class="row">
        <div class="col-lg-12">
            <asp:Panel ID="panelEdit" class ="frm" runat="server">
                <h1>Edit User details</h1><hr />
                <div class="form-horizontal">
                     <div class="form-group"><label class="control-label col-lg-2" >User ID :</label>                       
                        <div class="col-lg-2"><asp:TextBox ID="txtEditId" class="form-control" runat="server" ReadOnly="True"></asp:TextBox></div>
                     </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqfname" class="error" runat="server" ControlToValidate="txtEditFName" ErrorMessage="First name is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >First Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditFName" placeholder="Enter First name" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqlname" class="error" runat="server" ControlToValidate="txtEditLname" ErrorMessage="Last name is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Last Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditLname" placeholder="Enter Last name" class="form-control" runat="server" ></asp:TextBox></div>                 
                    </div>

                     <div class="col-lg-2"></div>
                     <asp:RequiredFieldValidator ID="rqmail" class="error" runat="server" ControlToValidate="txtEditmail" ErrorMessage="Email is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="valEmail" runat="server" ErrorMessage="Invalid Email." ControlToValidate="txtEditmail" CssClass="error" ValidateEmptyText="True" 
                        ValidationGroup="edit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                    <div class="form-group" ><label class="control-label col-lg-2" >Email :</label>         
                          <div class="col-lg-9"><asp:TextBox ID="txtEditmail" placeholder="Enter Email" class="form-control" runat="server" ></asp:TextBox></div>                            
                    </div>

                    <div class="col-lg-2"> </div>
                    <asp:RequiredFieldValidator ID="rqcon" class="error" runat="server" ControlToValidate="txtEditContact" ErrorMessage="Contact no. is required." ValidationGroup="edit"></asp:RequiredFieldValidator>               
                    <div class="form-group"><label class="control-label col-lg-2" >Contact No :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditContact" placeholder="Enter Contact No." class="form-control" runat="server" TextMode="Number"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqadd" class="error" runat="server" ControlToValidate="txtEditAdd" ErrorMessage="Address is required." ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Address :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEditAdd" placeholder="Enter Address" 
                                class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox></div>                 
                    </div>
                                        
                    <div class="form-group" style="margin-top:15px" ><label class="control-label col-lg-2" >Profile Image :</label> 
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
    

    </div>
</asp:Content>
