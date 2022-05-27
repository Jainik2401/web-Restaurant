<%@ Page Title="About Us" Language="vb" MasterPageFile="~/Site1.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="Restaurant.About" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <div class="container" style="background: url(../images/about_bg.jpg);background-size:100% 100%;margin:0;width:100%">
        <div class="row" >
            <div class="col-sm-12">
                <div class="team-info">
			        <div class="team">
				        <h1>MEET OUR EXPERTS</h1>
			    </div>
			    <div class="ga">
				    <div class="box">
					    <div class="img">
					        <asp:Image ID="Image2" imageurl="~\images\founder.jpg" Height="220px" Width="220px" runat="server" />
					    </div>
				    </div>
				    <div class="box">
					    <div class="img">
					        <asp:Image ID="Image1" imageurl="~\images\manager.jpg" Height="220px" Width="220px" runat="server" />
					    </div>
				    </div>
				    <div class="box">
                        <div class="img">
					        <asp:Image ID="Image3" imageurl="~\images\master.jpg" Height="220px" Width="220px" runat="server" />
					    </div>
				    </div>
				    <div class="box">
					    <div class="img">
					        <asp:Image ID="Image4" imageurl="~\images\lady-cook.jpg" Height="220px" Width="220px" runat="server" />
					    </div>
				    </div>
			    </div>
		      </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
				<div class="main">
					<div class="content">
						<h2>A Few Words About Us</h2><br>
						<div class="info">
						<b>Junky is an award-winning Restaurant in Surat. We provides healthy and tasty food to our customers. Hence they can order their favorite food from home or they can visit us.</b>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="main1">
					<div class="content">
						<h2>This is how it's began</h2><br>
						<div class="info">
						<b>Steve Rogers you probably haven’t heard of him. He started this restaurant in 1998. At that time we are not so popular but as time passes customers are attracted because of our Services. We provide our best to our Customers.</b>
						</div>
					</div>
				</div>
			</div>
		</div>
   </div>
</asp:Content>
