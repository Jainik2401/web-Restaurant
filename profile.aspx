<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="profile.aspx.vb" Inherits="Restaurant.profile" %>
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
    <asp:Panel ID="panelmain" runat="server">
       
    <div class="col-sm-10">
        <div class="row">
            <div class="col-sm-10">
                <h3>
                    Personal details:
                </h3>
            </div>
            <div class="col-sm-2">                
                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-default" style="width:100%;margin-top:20px" Text="Edit Profile" />
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-2" style="overflow:hidden;border-right:1px solid #ff9933">
                <center><asp:Image ID="proImg" class="img-circle" runat="server" width="150px" Height="150px"/></center>
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-2">
                        First Name:
                    </div>
                    <div class="col-sm-3" style="border-bottom:1px solid #ff9933">
                        <asp:Label ID="lblFname" runat="server" Text="Label"></asp:Label>
                        
                    </div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2">
                        Last Name:
                    </div>
                    <div class="col-sm-3" style="border-bottom:1px solid #ff9933">
                        <asp:Label ID="lblLname" runat="server" Text="Label"></asp:Label>
                        
                    </div>
                </div>
                <div class="row" style="margin-top:30px">
                    <div class="col-sm-2">
                        Address:
                    </div>
                    <div class="col-sm-3" style="border-bottom:1px solid #ff9933">
                        <asp:Label ID="lblAdd" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
            
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12">
                <h3>Contact details:</h3>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                Email:
            </div>
            <div class="col-sm-3" style="border-bottom:1px solid #ff9933">
                <asp:Label ID="lblMail" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-2">
                Contact No:
            </div>
            <div class="col-sm-3" style="border-bottom:1px solid #ff9933">
                <asp:Label ID="lblContact" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <hr />
    </div>
    </asp:Panel>



    <asp:Panel ID="panelEdit" runat="server">
        <div class="col-sm-11">
        <div class="row">
            <div class="col-sm-10">
                <h3>
                    Personal details:
                </h3>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-2" style="overflow:hidden;border-right:1px solid #ff9933">
                <center><asp:Image ID="editImg" class="img-circle" runat="server" width="150px" Height="150px"/></center>
                <asp:FileUpload ID="editProimg" runat="server" />
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-2">
                        First Name:
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtFname" runat="server" class="form-control" style="width:100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqfname" runat="server" 
                            ErrorMessage="First Name is required." ControlToValidate="txtFname" 
                            CssClass="error" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                                
                    </div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2">
                        Last Name:
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtLname" runat="server" class="form-control" style="width:100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqLname" runat="server" 
                            ErrorMessage="Last Name is required." ControlToValidate="txtLname" 
                            CssClass="error" ValidationGroup="edit"></asp:RequiredFieldValidator>
                         
                        
                    </div>
                </div>
                <div class="row" style="margin-top:30px">
                    <div class="col-sm-2">
                        Address:
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtAdd" runat="server" class="form-control" style="width:100%" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqAdd" runat="server" 
                            ErrorMessage="Address is required." ControlToValidate="txtAdd" 
                            CssClass="error" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        
                    </div>
                </div>
            </div>
            
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12">
                <h3>Contact details:</h3>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                Email:
            </div>
            <div class="col-sm-3">
                <asp:TextBox ID="txtmail" runat="server" class="form-control" style="width:100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqmail" runat="server" 
                            ErrorMessage="Email is required." ControlToValidate="txtmail" 
                            CssClass="error" ValidationGroup="edit"></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="valEmail" runat="server" 
                    ControlToValidate="txtmail" CssClass="error" ErrorMessage="Invalid Email." 
                    ValidateEmptyText="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="edit"></asp:RegularExpressionValidator>
                
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-2">
                Contact No:
            </div>
            <div class="col-sm-3" >
                <asp:TextBox ID="txtContact" runat="server" class="form-control" style="width:100%" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqCon" runat="server" 
                            ErrorMessage="Contact No. is required." ControlToValidate="txtContact" 
                            CssClass="error" ValidationGroup="edit"></asp:RequiredFieldValidator> <br />               
                <asp:RegularExpressionValidator ID="valcontact" runat="server" 
                    ControlToValidate="txtContact" CssClass="error" 
                    ErrorMessage="Enter 10 digit in Contact number." 
                    ValidationExpression="^[0-9]{10}$" ValidationGroup="edit"></asp:RegularExpressionValidator>
            </div>
        </div>
        <hr />
        <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-3">
            <asp:Button ID="btnSave" runat="server" style="width:100%" 
                CssClass="btn btn-default" Text="Save" ValidationGroup="edit" />
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btncancel" runat="server" style="width:100%" 
                CssClass="btn btn-default" Text="Cancel"/>
        </div>       
        
        </div>
        <hr />
        </div> 
    </asp:Panel>
    </div>
    </div>
</asp:Content>
