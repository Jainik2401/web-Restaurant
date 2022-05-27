<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="forgot.aspx.vb" Inherits="Restaurant.forgot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Forgot Password
    </title>
    <link href="~/Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="margin:0;width:100%">
        <asp:Panel ID="pnlmain" runat="server">
        
        <div class="row" style="margin-top:10%">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="poster" style="padding:25px">
                    <div class="row">
                    <div class="col-sm-12">
                     <h3>Forgot Password</h3>
                        <hr />
                        <asp:Label ID="lblErr" runat="server" Text="Invalid details." CssClass="error"></asp:Label>
                        <asp:TextBox ID="txtmail" class="form-control" style="width:100%" placeholder="Email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqmail" runat="server" 
                            ErrorMessage="Email is required." ControlToValidate="txtmail" CssClass="error" 
                            ValidationGroup="main"></asp:RequiredFieldValidator></div>
                    </div>

                    <div class="row"  style="margin-top:15px">
                    <div class="col-sm-12">
                       
                        <asp:TextBox ID="txtCon" class="form-control" style="width:100%" placeholder="Contact No." runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqcon" runat="server" 
                            ErrorMessage="Contact No. is required." ControlToValidate="txtCon" CssClass="error" 
                            ValidationGroup="main"></asp:RequiredFieldValidator>
                    </div>
                    </div>

                    <div class="row" style="margin-top:15px">
                        <div class="col-sm-6">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-default" 
                                style="width:100%" Text="Submit" ValidationGroup="main" />
                        </div>
                        <div class="col-sm-6">
                            <asp:Button ID="btnCancel" runat="server" class="btn btn-default" style="width:100%" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </asp:Panel>
        <asp:Panel ID="pnlSub" runat="server">
        
        <div class="row" style="margin-top:10%">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="poster" style="padding:25px">
                    <div class="row">
                    <div class="col-sm-12">
                        <asp:TextBox ID="txtPass" type="password" class="form-control" style="width:100%" placeholder="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqpass" runat="server" 
                            ErrorMessage="Enter Password." ControlToValidate="txtPass" CssClass="error" 
                            ValidationGroup="pass"></asp:RequiredFieldValidator>
                    </div>
                    </div>

                    <div class="row" style="margin-top:15px">
                    <div class="col-sm-12">
                        <asp:TextBox ID="txtConf" type="password" class="form-control" style="width:100%" placeholder="Confirm Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqCpass" runat="server" 
                            ErrorMessage="Enter Confirm Password." ControlToValidate="txtConf" CssClass="error" 
                            ValidationGroup="pass"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1"
                                runat="server" ErrorMessage="Both Password must be Same." ControlToCompare="txtPass" 
                            ControlToValidate="txtConf" CssClass="error" ValidationGroup="pass"></asp:CompareValidator>
                    </div>
                    </div>

                    <div class="row" style="margin-top:15px">
                        <div class="col-sm-6">
                            <asp:Button ID="btnChange" runat="server" class="btn btn-default" 
                                style="width:100%" Text="Submit" ValidationGroup="pass" />
                        </div>
                        <div class="col-sm-6">
                            <asp:Button ID="btnCancel1" runat="server" class="btn btn-default" style="width:100%" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
