<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="Restaurant.admin1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300" rel="stylesheet" /> 
    <style>
        body
        {
            height:100%;
            font-family: 'Roboto Slab', serif;
            background: url(../images/admin_bg.jpg)no-repeat;
            background-size:100%;
            color:White;
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
        h1 
        {
            border-bottom:2px solid white; 
            font-weight:bold;
            padding:5px;
            
        }
        h2
        {
            margin-top:-5px;
            border-bottom:4px solid white;             
        }
        .frm
        {
            margin-top:150px;
            padding:15px;
            box-sizing: border-box;
	        overflow: hidden;
	        box-shadow: 0px 10px 25px 30px rgba(0,0,0,.7);	
        }
        #btnSubmit:hover
        {
            background-color:#ff9933;
            color:White;
            transition: 0.9s;
            border:none;
        }
        #loginError,#requirePass,#requireID
        {
            color:#ff3333;
            font-size:17px;  
            letter-spacing:1px;  
            font-style:italic;        
        }
        .form-group
        {
            margin:0;
        }
     
    </style>
   
</head>
<body  >
    <form id="form1" runat="server">
 
    <div class="container">
        <div class="row">
          
            
            <div class="col-sm-offset-4 col-sm-4 " style="padding:25px">
            <div class="frm">
            <h1> ADMIN LOGIN
                </h1><h2>
                    
                </h2>
            <div class="form-group">
                <asp:Label ID="loginError" runat="server"></asp:Label>
            </div>
            <div class="form-group">
                <asp:RequiredFieldValidator ID="requireID" runat="server" ControlToValidate="txtUID" ErrorMessage="Admin Id is required."></asp:RequiredFieldValidator>
            </div>
            <asp:Textbox id="txtUID" type="text" placeholder="&#xf007; User Id" class="form-control"  runat="server"/><br />
            <div class="form-group">
                <asp:RequiredFieldValidator ID="requirePass" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required."></asp:RequiredFieldValidator>
            </div>
            <asp:Textbox id="txtPass" type="password" placeholder="&#xf023; Password" class="form-control" runat="server" /><br />
            <div class="row" >
                <div class="col-sm-12">
                    <asp:Button id="btnSubmit" type="button" text="&#xf084; Log In"  class="btn btn-default" style="width:50%;border:none" runat="server" />
                    <div class="pull-right"><asp:HyperLink ID="HyperLink1" runat="server" style="text-decoration:none;color:white">Forgot Password?</asp:HyperLink></div>
                    <h2 style="margin-top:25px"></h2>
                </div>
            </div>
               
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
