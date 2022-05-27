<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="contact.aspx.vb" Inherits="Restaurant.contact" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="container" style="background: url(../images/contact_bg.jpg);background-size:100% 100%;margin:0;width:100%">
    <div class="row">
		<div class="form-group col-sm-7" >
			<h1 style="color:#262626">Contact us today to solve your Query.</h1>
			<h2 style="color:#262626">Tell us About Yourself</h2>
			<h3 style="color:#262626">Contact us today to discuss how Big Data can help you!</h3>
            <div class="row">
                <div class="col-sm-12">
                    <asp:RequiredFieldValidator ID="rqSub" runat="server" 
                        ErrorMessage="Please Enter Subject." ValidationGroup="req" 
                        ControlToValidate="txtSub" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSub" runat="server" placeholder="Subject" class="form-control" width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"><asp:RequiredFieldValidator ID="rqDetail" runat="server" 
                        ErrorMessage="Please Enter Details." ValidationGroup="req" 
                        ControlToValidate="txtdetail" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtdetail" placeholder="Details..." runat="server" class="form-control" width="100%" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="margin-top:25px">
                <div class="pull-right col-sm-3">
                    <asp:Button ID="BubtnSubmit" runat="server" Text="Submit" 
                        class="btn btn-default" style="width:100%" ValidationGroup="req"/>
                </div>
            </div>
		</div>
        <div class="col-sm-5 contact-right-info">
				<h1 style="color:#262626">Address:</h1><hr />
				<h3 style="color:#262626">SDJ International College<br>
					Vesu, Surat<br /></h3>
                <h1 style="color:#262626">Timings:</h1><hr />
                <h3>9 AM - 10:30 PM</h3><br />
				<h1 style="color:#262626">E-Mail:</h1><hr /><h3>
				<a href="https://www.shriyank161@gmail.com" style="color:#262626">shriyank161@gmail.com</a></h3><br />
				</p>
				<h1 style="color:#262626">Follow us on:</h1>
				<div class="basic_info" style="margin-top:-25px">
                     <ul class="list-inline social">
                          <li><a href="https://www.facebook.com" class="fa fa-facebook"></a></li>
                          <li><a href="https://www.twitter.com" class="fa fa-twitter"></a></li>
                          <li><a href="https://www.instagram.com" class="fa fa-instagram"></a></li>
                     </ul>					
               </div>
        </div>
    </div>
    </div>
</asp:Content>
