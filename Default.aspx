<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site1.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="Restaurant._Default" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">  
   <div class="container">
    <div class="row">
                    <div class="col-sm-8">
                        <div class="feature">
                            <div class="shack_burger">
                                <div class="chicken">
                                    <asp:Image runat="server" src="Images/chicken.png" />
                                </div>
                                <h2 style="color:white">Shack Burger </h2>
                                <p style="color:white">Black Angus beef patty topped with American cheese, tomato, lettuce, and “Shack Sauce,” served in a grilled potato bun</p>
                            </div>
                            <p class="caption">*Limited Time Only</p>
                        </div>
                    </div>
					<div class="col-sm-4">
                        <div class="signature">
                            <div class="shape">
                                <p>signature</p>
                            </div>
                            <div class="signature_content">
                                <p>It used to be a Secret but not any more! Our tribute to the King is a Cheddar Beef Patty,</p>
                            </div>
                        </div>
                    </div>
         </div>
        <div class="row">
            <div class="col-sm-12">
                <asp:Image ID="Image2" runat="server" height="500px" Width="1140px" ImageUrl="~/Images/large_slider_img.jpg" />
                <div class="carousel-caption">
                    <h2>Cheddar JUnky</h2>
                    <h3>Stuffed Burgers</h3>
                    <p>Chef Wesley Genovart makes this over-the-top, Shake Shack–inspired burger with two thin stacked patties, thick-cut bacon, kimchi and a spicy homemade sauce.</p>
                </div>
            </div>
        </div>
         <div class="row">
                    <div class="col-sm-6">
                        <div class="classic">
                            <p class="classic_btn">classic</p>

                            <div class="overlay">
                                <h3>House-ground hamburger</h3>
                                <p>(served in a grilled rosemary focaccia).</p>
                                <p class="overlay_content">Instead of traditional cucumber pickles, legendary chef-owner Judy Rodgers accents her burgers with thin-cut zucchini strips pickled in apple cider vinegar, mustard seeds and turmeric.</p>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-sm-6" >
                            <div class="inner">
                            </div>
                    </div>                        
        </div>
        <div class="row">
            <div class="col-sm-12" style="margin-top:25px; margin-bottom:25px;">
                <asp:Image ID="Image1" runat="server" height="500px" Width="1140px" ImageUrl="~/Images/Summer-Drink.jpg" />
                <div class="carousel-caption">
                    <h2>Enjoy Summer Drink</h2>
	                <h3>- Tasty Shakes</h3>
					<h3>- Cold Drinks</h3>
                    <h3>- Mocktails</h3>
                </div>
            </div>
        </div>
    </div>
    <section id="lock">
        <h2>SERVING MORE THAN JUST BURGERS SINCE 1998</h2>
        <p>Check out our opening hours and location address below.</p>
    </section>
</asp:Content>
