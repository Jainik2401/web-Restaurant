<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="queries.aspx.vb" Inherits="Restaurant.queries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        <div class="col-lg-12">
            <div class="frm">
            <div class="row"> 
                <div class="col-lg-2"> <asp:Button ID="btnViewpending" runat="server" class="btn btn-default" style="width:100%" Text="&#xf0f3; pending Queries" 
                        UseSubmitBehavior="False" /></div>              
                <div class="col-lg-2"> <asp:Button ID="btnViewSubmitted" runat="server" class="btn btn-default" style="width:100%" Text="&#xf00c; Completed Queries" 
                        UseSubmitBehavior="False" /></div>
            </div>
            </div>
        </div>
    </div>

    <asp:Panel ID="panelQueries" runat="server">
    <div class="row">
        <div class="col-lg-12">
        <div class="frm">
        <div class="col-lg-2"></div>      
       
        <div class="col-lg-8">
                <asp:GridView ID="tblQuery" runat="server" BackColor="White" 
                    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="5" 
                    DataSourceID="selectQuery" GridLines="Horizontal" 
                    AutoGenerateColumns="False" DataKeyNames="QueryID" 
                    style="width:100%;line-height:1.8" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="QueryID" HeaderText="QueryID" ReadOnly="True" 
                            SortExpression="QueryID" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" 
                            SortExpression="UserID" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" 
                            SortExpression="Subject" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Solution" HeaderText="Solution" 
                            SortExpression="Solution" />
                        <asp:BoundField DataField="SubmitedOn" HeaderText="SubmitedOn" 
                            SortExpression="SubmitedOn" />
                        <asp:CommandField ButtonType="Button" SelectText="&#xf06e; View" ShowSelectButton="True">
                        <ControlStyle CssClass="btn btn-default" />
                        </asp:CommandField>
                    </Columns>
                        <FooterStyle BackColor="#FF9933" ForeColor="Black" />
                        <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <asp:AccessDataSource ID="selectQuery" runat="server" 
                    DataFile="~/App_Data/restaurant.accdb" 
                    
                    
                    
                    SelectCommand="SELECT [QueryID], [UserID], [Subject], [Description], [Solution], [SubmitedOn] FROM [Queries] WHERE ([status] = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="status" SessionField="request" Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </div>
            
        </div>
        </div>
    </div>
    </asp:Panel>

    <asp:Panel ID="panelDetails" runat="server">
    <div class="frm">
    <div class="row">
        <div class="col-lg-12">
            
            <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Query Details:</h1><hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                            <div class="col-lg-4" style="text-align:right">
                                Query ID :
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="lblQid" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                            <div class="col-lg-4" style="text-align:right">
                                Subject :
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                            <div class="col-lg-4" style="text-align:right">
                                Description :
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>

                        <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                            <div class="col-lg-4" style="text-align:right">
                                Response :
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="lblresponse" runat="server" Text="N/A"></asp:Label>
                            </div>
                        </div>

                        <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                            <div class="col-lg-4" style="text-align:right">
                                Submitted On :
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>

            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>User Details:</h1><hr />                    
                    </div>                
                </div>
                <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                    <div class="col-lg-2" style="text-align:right">
                        User ID:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lblUid" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-lg-2" style="text-align:right">
                        Contact No:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lblContact" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                    <div class="col-lg-2" style="text-align:right">
                        First name:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lbFname" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-lg-2" style="text-align:right">
                        Email:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lblmail" runat="server" Text="Label"></asp:Label>
                    </div>
                </div> 
                <div class="row" style="font-weight:bold;line-height:1.7;font-size:18px">
                    <div class="col-lg-2" style="text-align:right">
                        Last name:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lblLname" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-lg-2" style="text-align:right">
                        Address:
                    </div>
                    <div class="col-lg-4">
                        <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
        </div> <hr />
        </div>
        </div>
        
        <div class="row">
        <div class="col-lg-2"><asp:Button ID="btnAddresponse" runat="server" class="btn btn-default" style="width:100%" Text="&#xf067; Add Response" UseSubmitBehavior="False" /></div>
        <div class="col-lg-2"><asp:Button ID="btnEditresponse" runat="server" class="btn btn-default" style="width:100%" Text="	&#xf044; Edit Response" UseSubmitBehavior="False" /></div>   
        </div>
    </div>

    </asp:Panel>

    <asp:Panel ID="panelAdd" runat="server">
    <div class="frm">
        <div class="row">
            <div class="col-lg-12">
                <h1>Your Response:</h1><hr />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <asp:RequiredFieldValidator ID="rqResponse" runat="server" 
                    ErrorMessage="Response is required." ControlToValidate="txtResponse" 
                    CssClass="error" ValidationGroup="response"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtResponse" class="form-control" 
                    placeholder="Enter your response here..." runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row" style="margin-top:15px">
            <div class="col-lg-2">
                <asp:Button ID="btnSubmit" class="btn btn-default" style="width:100%" 
                    runat="server" Text="&#xf1d8; Submit" ValidationGroup="response" />
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnCancel" class="btn btn-danger" style="width:100%" 
                    runat="server" Text="&#xf00d; Cancel" />
            </div>
        </div>
    </div>
    </asp:Panel>

</div>

</asp:Content>
