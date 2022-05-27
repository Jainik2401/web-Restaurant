<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="changepass.aspx.vb" Inherits="Restaurant.changepass" %>
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
            <div class="col-sm-3"></div>
            <div class="col-sm-4" style="padding:15px">
                <div class="poster" style="padding:25px">
                    <div class="row">
                    <div class="col-sm-12">
                        <asp:Label ID="lblerror" runat="server" Text="You Entered wrong Password." 
                            CssClass="error"></asp:Label><br />
                        Current Password:
                        <asp:TextBox ID="txtold" type="password" class="form-control" style="width:100%" placeholder="Current Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqold" runat="server" 
                            ErrorMessage="Enter Current Password." ControlToValidate="txtold" CssClass="error" 
                            ValidationGroup="pass"></asp:RequiredFieldValidator>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-sm-12">
                        New Password:
                        <asp:TextBox ID="txtPass" type="password" class="form-control" style="width:100%" placeholder="New Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqpass" runat="server" 
                            ErrorMessage="Enter Password." ControlToValidate="txtPass" CssClass="error" 
                            ValidationGroup="pass"></asp:RequiredFieldValidator>
                    </div>
                    </div>

                    <div class="row" style="margin-top:15px">
                    <div class="col-sm-12">
                        Confirm Password:
                        <asp:TextBox ID="txtConf" type="password" class="form-control" style="width:100%" placeholder="Confirm Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqCpass" runat="server" 
                            ErrorMessage="Enter Confirm Password." ControlToValidate="txtConf" CssClass="error" 
                            ValidationGroup="pass"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1"
                                runat="server" ErrorMessage="Both Password must be Same." ControlToCompare="txtPass" 
                            ControlToValidate="txtConf" CssClass="error" ValidationGroup="pass"></asp:CompareValidator>
                    </div>
                    </div>

                    <div class="row" style="margin-top:15px">
                        <div class="pull-right col-sm-6">
                            <asp:Button ID="btnChange" runat="server" class="btn btn-default" 
                                style="width:100%" Text="Submit" ValidationGroup="pass" />
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
</div>
</asp:Content>
