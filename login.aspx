<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="login.aspx.vb" Inherits="Restaurant.login1" %>
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
        <div class="row" style="padding:150px">
            
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="form">		            				
			        <div class="login-form" style="border-radius:5px;">				
					    <div class="col-sm-12">
                            <h2 style="color:White">Log In</h2><hr />
                        </div>
                        <div class="col-sm-12">
                            <asp:Label ID="lblErr" runat="server" Text="Invalid email or Password." style="color:#ff3333;font-size:16px;"></asp:Label>
					    </div>
                        <div class="col-sm-12">
                             <asp:RequiredFieldValidator ID="rqmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email is Required." 
                                ForeColor="#FF3333" ValidationGroup="logIn"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-12">
                            <asp:TextBox ID="txtEmail" placeholder="Email" class="form-control" runat="server" style="width:100%"></asp:TextBox>
                        </div>
                        <div class="col-sm-12" style="margin-top:25px">
                            <asp:RequiredFieldValidator ID="rqPass" runat="server" 
                                ControlToValidate="txtPass" ErrorMessage="Password is Required." 
                                ForeColor="#FF3333" ValidationGroup="logIn"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-12">   
                            <asp:TextBox ID="txtPass" type="password" placeholder="Password" 
                                class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-12"><hr /></div>
                        <div class="col-sm-6">
                            <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-default" 
                                style="width:100%" Text="Log In" ValidationGroup="logIn" />
                        </div>
                        <div class="col-sm-6">
                            <asp:HyperLink ID="forgot" runat="server" class="forgot" NavigateUrl="forgot.aspx">Forgot Password?</asp:HyperLink>
                        </div>
                        <div class="col-sm-12" style="margin-top:25px">
                            <asp:Button ID="btnRegister" runat="server" class="btn btn-default" style="width:100%" Text="New User ! Sign up here." />
                        </div>
                    </div>
		        </div>
            </div>

        </div>
    </div>
</asp:Content>

