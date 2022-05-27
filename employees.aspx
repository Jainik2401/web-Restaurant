<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin.Master" CodeBehind="employees.aspx.vb" Inherits="Restaurant.employees" %>
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
    
</style>


<div class="container" style="margin:0;width:100%">
    
    <div class="row">      
        <div class="col-lg-12">
            <div class="frm">
                <div class="col-lg-2"><asp:Button ID="btnAdd" class="btn btn-success" runat="server" Text="Add new" UseSubmitBehavior="False" style="width:100%" /></div>
                <div class="col-lg-2"><asp:Button ID="btnDetails" class="btn btn-default" runat="server" Text="View details" UseSubmitBehavior="False" style="width:100%" /></div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12" >
            <asp:Panel ID="paneldetails" class ="frm" runat="server">
                <h1>Employee Details</h1><hr />
               
                <div class="row" >
                    <div class="col-lg-2">
                        <asp:Image ID="profileImage" class="img-circle" style="height:180px;width:180px" runat="server" />
                    </div>
                   
                    <div class="row" style="line-height:1.7;font-weight:bold;font-size:16px">
                        <div class="col-lg-2" style="text-align:right">Employee ID:</div>
                        <div class="col-lg-2"><asp:Label ID="lblEmpID" class="control-label" runat="server" Text="Label"></asp:Label></div>
               
                        <br />

                        <div class="col-lg-2" style="text-align:right">Employee Name:</div>
                        <div class="col-lg-2"><asp:Label ID="lblEname" class="control-label" runat="server" Text="Label"></asp:Label></div>
                  
                        <br />

                        <div class="col-lg-2" style="text-align:right">Contact number:</div>
                        <div class="col-lg-2"><asp:Label ID="lblContact" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />

                        <div class="col-lg-2" style="text-align:right">E-Mail:</div>
                        <div class="col-lg-2"><asp:Label ID="lblMail" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />

                        <div class="col-lg-2" style="text-align:right">Date of Birth:</div>
                        <div class="col-lg-2"><asp:Label ID="lblDOB" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />

                        <div class="col-lg-2" style="text-align:right">Gender:</div>
                        <div class="col-lg-2"><asp:Label ID="lblGender" class="control-label" runat="server" Text="Label"></asp:Label></div>
                        <br />

                        <div class="col-lg-2" style="text-align:right">Date of Join:</div>
                        <div class="col-lg-2"><asp:Label ID="lblDOJ" class="control-label" runat="server" Text="Label"></asp:Label></div>
                    </div>
             
                </div>   
              
                <hr />
                <div class="col-lg-4"></div>        
                <div class="col-lg-2"><asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Edit details" UseSubmitBehavior="False" style="width:100%"/></div>
                <div class="col-lg-2"><asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Remove Employee" UseSubmitBehavior="False" style="width:100%"/></div>

            </asp:Panel>
        </div>
    </div>
        
    <div class="row">
        <div class="col-lg-12" >

           <asp:Panel ID="panelAdd" class ="frm" runat="server">
                <h1>Enter Employee Details</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >Employee ID :</label>                       
                        <div class="col-lg-2"><asp:TextBox ID="txtID" class="form-control" runat="server" ReadOnly="True"></asp:TextBox></div>
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqname" 
                        class="error" runat="server" ControlToValidate="txtEmpName" 
                        ErrorMessage="Employee name is required." ValidationGroup="addDetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Employee Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtEmpName" placeholder="Employee name" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqcontact" 
                        class="error" runat="server" ErrorMessage="Contact no. is required." 
                        ControlToValidate="txtContact" ValidationGroup="addDetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Contact number :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtContact" placeholder="Contact No." 
                                class="form-control" runat="server" TextMode="Number"></asp:TextBox></div>
                    </div>

                    <div class="col-lg-2"></div> 
                    <asp:RegularExpressionValidator ID="valEmail" runat="server" ErrorMessage="Invalid Email." 
                        ControlToValidate="txtMail" CssClass="error" ValidateEmptyText="True" 
                        ValidationGroup="addDetails" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>               
             
                    <div class="form-group"><label class="control-label col-lg-2" >Email Address :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txtMail" placeholder="Email Address" class="form-control" runat="server"></asp:TextBox></div>
                    </div>
                    
                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqDob" 
                        class="error" runat="server" ErrorMessage="DOB is required." 
                        ControlToValidate="dob" ValidationGroup="addDetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Date of Birth :</label>
                        <div class="col-lg-2"><asp:TextBox ID="dob" runat="server" TextMode="Date" class="form-control"></asp:TextBox></div>
                    </div>
                   
                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqDoj" 
                        class="error" runat="server" ErrorMessage="DOJ is required." 
                        ControlToValidate="doj" ValidationGroup="addDetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Date of Join :</label>
                        <div class="col-lg-2"><asp:TextBox ID="doj" runat="server" TextMode="Date" class="form-control"></asp:TextBox></div>
                    </div>

                    <div class="form-group" style="margin-top:15px" ><label class="control-label col-lg-2" >Gender :</label> 
                        <div class="col-lg-9"><asp:RadioButton ID="rdbuttonMale" class="radio" runat="server"  GroupName="Gender" Text="Male" Checked="True" />
                        <asp:RadioButton ID="rdbuttonFemale" runat="server"  class="radio" GroupName="Gender" Text="Female" /></div>
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqImg" 
                        class="error" runat="server" controlToValidate="profileImg" 
                        ErrorMessage="Profile is Image is required." ValidationGroup="addDetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Profile Image :</label> 
                        <div class="col-lg-2"><asp:FileUpload ID="profileImg" runat="server" /></div>
                    </div>
                    <hr />
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3"><asp:Button id="btnSubmit" type="button" text="Submit"  
                            class="btn btn-default" style="width:100%" runat="server" 
                            ValidationGroup="addDetails" /></div>
                    <div class="col-lg-3"><input id="btnreset" type="reset" value="Reset" style="width:100%" class="btn btn-default"/></div>
                </div>               
            </asp:Panel>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12" > 

            <asp:Panel ID="panelEdit" class ="frm" runat="server">               
                <h1>Edit Employee Details</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >Employee ID :</label>         
                        <div class="col-lg-2">
                            <asp:TextBox ID="txteditID" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                DataFile="~/App_Data/restaurant.accdb" 
                                SelectCommand="SELECT [EmpID], [EmpName] FROM [Employee]"></asp:AccessDataSource>
                        </div>
                    </div>

                   
                   <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqEditName" 
                        class="error" runat="server" ControlToValidate="txteditname" 
                        ErrorMessage="Employee name is required." ValidationGroup="editdetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Employee Name :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txteditname" placeholder="Employee name" class="form-control" runat="server"></asp:TextBox></div>                 
                    </div>

                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqeditcontact" 
                        class="error" runat="server" ErrorMessage="Contact no. is required." 
                        ControlToValidate="txteditcontact" ValidationGroup="editdetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Contact number :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txteditcontact" placeholder="Contact No." 
                                class="form-control" runat="server" TextMode="Number"></asp:TextBox></div>
                    </div>

                    <div class="col-lg-2"></div> 
                    <asp:RequiredFieldValidator ID="rqeditmail" 
                        class="error" runat="server" ControlToValidate="txteditmail" 
                        ErrorMessage="Email is required." ValidationGroup="editdetails"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valEditMail" runat="server" 
                        ControlToValidate="txteditmail" CssClass="error" ErrorMessage="Envalid Email." 
                        ValidateEmptyText="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="editdetails"></asp:RegularExpressionValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Email Address :</label>         
                        <div class="col-lg-9"><asp:TextBox ID="txteditmail" placeholder="Email Address" class="form-control" runat="server"></asp:TextBox></div>
                    </div>
                    
                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqeditdob" 
                        class="error" runat="server" ErrorMessage="DOB is required." 
                        ControlToValidate="editdob" ValidationGroup="editdetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Date of Birth :</label>
                        <div class="col-lg-2"><asp:TextBox ID="editdob" runat="server" class="form-control"></asp:TextBox></div>
                    </div>
                   
                    <div class="col-lg-2"></div>
                    <asp:RequiredFieldValidator ID="rqeditdoj" 
                        class="error" runat="server" ErrorMessage="DOJ is required." 
                        ControlToValidate="editdoj" ValidationGroup="editdetails"></asp:RequiredFieldValidator>
                    <div class="form-group"><label class="control-label col-lg-2" >Date of Join :</label>
                        <div class="col-lg-2"><asp:TextBox ID="editdoj" runat="server" TextMode="SingleLine" class="form-control"></asp:TextBox></div>
                    </div>

                    <div class="form-group" style="margin-top:15px" ><label class="control-label col-lg-2" >Gender :</label> 
                        <div class="col-lg-9"><asp:RadioButton ID="rdeditM" class="radio" runat="server"  GroupName="Gender" Text="Male" Checked="True" />
                        <asp:RadioButton ID="rdeditF" runat="server"  class="radio" GroupName="Gender" Text="Female" /></div>
                    </div>

                 
                    <div class="form-group" ><label class="control-label col-lg-2" >Update Profile Image :</label> 
                        <div class="col-lg-2"><asp:FileUpload ID="editImg" runat="server" /></div>
                    </div>
                    <hr />
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3"><asp:Button id="editSubmit" type="button" text="Submit" class="btn btn-default" style="width:100%" runat="server" validationGroup="editdetails" /></div>
                    <div class="col-lg-3"><input id="editReset" type="reset" value="Reset" style="width:100%" class="btn btn-default"/></div>
                </div>               
             </asp:Panel>
          </div>
     </div>

     <div class="row">
        <div class="col-lg-12" >

            <asp:Panel ID="panelSelect" class ="frm" runat="server"> 
                <h1>Select Employee ID to View</h1><hr />
                <div class="form-horizontal">
                    <div class="form-group"><label class="control-label col-lg-2" >Employee ID :</label>         
                        <div class="col-lg-2"><asp:DropDownList ID="selectID" runat="server" 
                                class="form-control" DataSourceID="AccessDataSource1" DataTextField="EmpID" 
                                DataValueField="EmpID"></asp:DropDownList>
                        </div>
                        <div class="col-lg-2"><asp:Button id="btnView" type="button" text="Get Details"  
                            class="btn btn-default" style="width:100%" runat="server" 
                                UseSubmitBehavior="False" /></div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</div>

   
</asp:Content>
