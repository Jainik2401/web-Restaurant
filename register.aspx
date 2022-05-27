<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="register.aspx.vb" Inherits="Restaurant.register1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .btn-default{
        background-color:#ff9933;
        color:White;
        border-color:#ff9933;
    }
    .btn-default:hover{
        background-color:white;
        color:#ff9933;
        border-color:#ff9933;
        transition:0.9s;
    }
    .forgot
    {
        font-size:16px;
        color:White;
    }
    .forgot:hover
    {
        cursor:pointer;
        font-size:16px;
        color:#ff9933;
        text-decoration:none;
    }
    </style>
    <div class="container" style="margin:0;width:100%;background:url(images/login_bg.jpg)100% no-repeat">
        <div class="row" style="padding:15px">
            
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="form">		            				
			        <div class="login-form" style="border-radius:5px;height:860px">				
					    <div class="col-sm-12">
                            <h2 style="color:White">Register</h2><hr />
                        </div>       
                        <div class="col-sm-12">
                             
                            <asp:RequiredFieldValidator ID="rqFname" runat="server" 
                                ControlToValidate="txtFname" CssClass="error" 
                                ErrorMessage="First name is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                             
                        </div>
                        <div class="col-sm-12">
                            <asp:TextBox ID="txtFname" placeholder="First Name" class="form-control" runat="server" style="width:100%"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqLname" runat="server" 
                                ControlToValidate="txtlname" CssClass="error" 
                                ErrorMessage="Last name is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtlname" placeholder="Last Name" 
                                class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqmail" runat="server" 
                                ControlToValidate="txtmail" CssClass="error" ErrorMessage="Email is required." 
                                ValidationGroup="reg"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valEmail" runat="server" ErrorMessage="Invalid Email." 
                        ControlToValidate="txtmail" CssClass="error" ValidateEmptyText="True" 
                        ValidationGroup="reg" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtmail"  placeholder="Email" 
                                class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqContact" runat="server" 
                                ControlToValidate="txtContact" CssClass="error" 
                                ErrorMessage="Contact no. is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                            ID="valcontact" runat="server" 
                        ErrorMessage="Enter 10 digit in Contact number." ValidationGroup="reg" 
                        CssClass="error" ControlToValidate="txtContact" 
                        ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtContact" type="number" placeholder="Contact No." 
                                class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqAdd" runat="server" 
                                ControlToValidate="txtAdd" CssClass="error" ErrorMessage="Address is required." 
                                ValidationGroup="reg"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtAdd" placeholder="Address" 
                                class="form-control" style="width:100%" runat="server" 
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqPass" runat="server" 
                                ControlToValidate="txtPass" CssClass="error" 
                                ErrorMessage="Password is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtPass"  placeholder="Password" 
                                class="form-control" type="password" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqCpass" runat="server" 
                                ControlToValidate="txtCpass" CssClass="error" 
                                ErrorMessage="Confirm Password is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                            
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtPass" ControlToValidate="txtCpass" CssClass="error" 
                                ErrorMessage="Both Password shuold be same." ValidationGroup="reg"></asp:CompareValidator>
                            
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtCpass"  placeholder="Confirm Password" 
                                class="form-control" type="password" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:15px">
                            
                            <asp:RequiredFieldValidator ID="rqimg" runat="server" 
                                ControlToValidate="proImg" CssClass="error" 
                                ErrorMessage="Profile Image is required." ValidationGroup="reg"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="col-sm-12 form-group">   
                            <label style="color:White">Profile Image:</label><asp:FileUpload ID="proImg" class="form-control" runat="server" />
                        </div>
                        
                        <div class="col-sm-12"><hr /></div>
                        <div class="col-sm-6">
                            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-default" 
                                style="width:100%" Text="Register" ValidationGroup="reg" />
                        </div>
                        <div class="col-sm-6">
                            <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default" 
                                style="width:100%" Text="Reset" />
                        </div>
                        
                        <div class="col-sm-12" style="margin-top:20px">
                            <asp:Button ID="btnlogin" runat="server" class="btn btn-default" style="width:100%" Text="Already Have an Account ! Log In here." />
                        </div>
                    </div>
		        </div>
            </div>

        </div>
    </div>
</asp:Content>
