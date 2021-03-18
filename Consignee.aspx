<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Consignee.aspx.vb" Inherits="CnfGranite.Consignee" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Consignee Details</title>
    	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" type="text/javascript"></script>
	<!-- VENDOR CSS -->
	 <link rel="Shortcut Icon" href="../Lassets/images/favicon.png"  />
    <link href="../assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="../assets/vendor/linearicons/style.css" />
	<link rel="stylesheet" href="../assets/vendor/chartist/css/chartist-custom.css" />
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../assets/css/main.css">	
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    .footer
    {
       height:40px; width:100%; color:Blue; position :fixed; bottom:0px; z-index:-100;   
        }
        .row{padding:10px;}
    .hidden
    {
        display:none;
        
    }
    </style>
    <%-- <script type="text/javascript">
        function validation() 
        {
            var conname = document.getElementById("conname").value;
            var conmarks= document.getElementById("conmarks").value;
            var conaddr1 = document.getElementById("conaddr1").value;
            var conaddr2= document.getElementById("conaddr2").value;
            var concity= document.getElementById("concity").value;
            var concountry = document.getElementById("concountry").value;
            var conpincode = document.getElementById("conpincode").value;
            var conphoneno= document.getElementById("conphoneno").value;
            var concperson= document.getElementById("concperson").value;
            var conemailid= document.getElementById("conemailid").value;
            
            if (conname == "") 
             {
            alert("Enter the consignee Name");
            return false;
            }
           if (conmarks == "") 
           {
           alert("Enter the consignee marks");
           return false;
           }
            if (conaddr1== "") 
             {
            alert("Enter the consignee address1");
            return false;
            }
           if (conaddr2 == "") 
           {
           alert("Enter the consignee address2");
           return false;
           }
            if (concity == "") 
             {
            alert("Enter the consignee city");
            return false;
            }
           if (concountry == "") 
           {
           alert("Enter the consignee country");
           return false;
           }
            if (conpincode == "") 
             {
            alert("Enter the consignee pincode");
            return false;
            }
           if (conphoneno == "") 
           {
           alert("Enter the consignee phone number");
           return false;
           }
           if (concperson == "") 
           {
           alert("Enter the consignee person ");
           return false;
           }
            if (conemailid == "") 
           {
           alert("Enter the consignee email id");
           return false;
           }
           return true;
           }
    </script>--%>
    <script type="text/javascript" >
        $(document).ready(function () {

            $('.mydelete').click(function () {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Do you want to Delte this Row?")) {
                    //                confirm_value.value = "Yes";
                    return true;

                } else {
                    return false;
                }
            });

        })
        $(document).ready(function () { $("input").attr("autocomplete", "off"); }); 
    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
    <div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div  style ="padding :20px 30px; float:left;">
				<a href="#"><img src="../Lassets/images/logo.png" style="height:40px;" alt="Logo" class="img-responsive logo" /></a>                               
			</div>
			<div class="container-fluid">
				
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">						
						<li >
							<a href="#"  style="color:#6d6d6d ;font-size:20px;"><b>Diamond CNF Granite</b> <span></span> </a>							
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../Lassets/images/favicon.png" class="img-circle" alt="icon"> <span><label  id="lbluser"  /><label  id="dpt"  /></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">								
								<li><a href="../login.aspx"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>						
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li class="hidden"><a href="../DashBoard.aspx" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
						<li ><a href="#subPages" data-toggle="collapse" class="active"><i class="fas fa-database"></i> <span>Essentials</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
                                    <li><a  href="../Essentials/Vessel.aspx">Vessel</a></li>
									<li><a  href="../Essentials/Shipper.aspx">Shipper</a></li>
									<li><a class="active" href="../Essentials/Consignee.aspx" >Consignee</a></li>									
                                    <li><a href="../Essentials/Liner.aspx">Liner</a></li>
                                    <li><a href="../Essentials/Port.aspx" >Port</a></li>
									<li><a href="../Essentials/Cf.aspx" >C & F Party</a></li>                                    									
								</ul>
							</div>
						</li>                        
                        <li>
							<a href="#subPages3" data-toggle="collapse" class="collapsed"><i class="fas fa-globe"></i> <span>Transaction</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages3" class="collapse ">
								<ul class="nav">
									<li><a href="../Transaction/PackingListVessel.aspx" >Packing List Vessel </a></li>
                                    <li><a href="../Transaction/JobNoDetails.aspx" >JobNo Details </a></li>
									<li><a href="../Transaction/ShippingBill.aspx">SB Details</a></li>
                                    <li><a href="../Transaction/Covering Letter.aspx" >Covering Letter</a></li>
                                    <li><a href="../Transaction/Allocation.aspx">Allocate Job</a></li>
                                    <li><a href="../Transaction/Search.aspx" >Search </a></li>                                    
								</ul>
							</div>
						</li>
                        <li>
							<a href="#subPages2" data-toggle="collapse" class="collapsed"><i class=" fa fa-file"></i> <span>Voucher</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse">
								<ul class="nav">
			                        <li><a href="../Voucher/Supplementary.aspx">Supplementary</a></li>            
								</ul>
							</div>
						</li>
                        <li><a href="../Reports/ReportTree.aspx"><i class="fas fa-chart-pie"></i> <span>Reports</span></a></li>                        
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
                <div class="lead"><b>Consignee Details</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Consignee Name</div><div class="col-md-4"><asp:TextBox ID="conname" class="form-control " autocomplete="off" runat="server">
                        </asp:TextBox><asp:HiddenField
                                ID="hdid" runat="server" />
                        </div>
                        <div class="col-md-2">Marks</div><div class="col-md-4"><asp:TextBox ID="conmarks" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Address 1</div><div class="col-md-4"><asp:TextBox ID="conaddr1" class="form-control "  autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Address 2</div><div class="col-md-4"><asp:TextBox ID="conaddr2" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">City</div><div class="col-md-4"><asp:TextBox ID="concity" class="form-control " autocomplete="false"   runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Country</div><div class="col-md-4"><asp:TextBox ID="concountry" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Pincode</div><div class="col-md-4"><asp:TextBox ID="conpincode" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Phone No</div><div class="col-md-4"><asp:TextBox ID="conphoneno" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Contact Person</div><div class="col-md-4"><asp:TextBox ID="concperson" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Email Id</div><div class="col-md-4"><asp:TextBox ID="conemailid" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 text-right"><asp:Button ID="save" runat="server" Text="Submit" class="btn btn-success" OnClientClick="return validation()" /></div><div class="col-md-6"><asp:Button ID="Button1" runat="server" class="btn btn-danger" Text="Clear" /></div>                       
                        </div>    <br />                        
						<div class="clearfix"></div>
					</div>
                    <div class="panel panel-profile">
                     <div class="row">
                        <div class="col-md-6 text-right "><asp:TextBox ID="TextBox1" class="form-control " runat="server"></asp:TextBox></div>
                           <div class="col-md-6">
                            <asp:Button ID="Button2" runat="server" class="btn btn-danger" Text="Search" /></div>                       
                        </div>
                     <asp:GridView ID="gvvessel" runat="server" AutoGenerateColumns ="False" 
                            DataSourceID="consigneedsi" EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText="Conname" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="conname1" Text='<%# Eval("consignee_name") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conmarks" HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="conmarks1" Text='<%# Eval("consignee_marks") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conaddress1"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="conaddr11" Text='<%# Eval("consignee_address1") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conaddress2 "  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="conaddr21" Text='<%# Eval("consignee_address2 ") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Concity "  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="concity1" Text='<%# Eval("consignee_city ") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Concountry"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="concountry1" Text='<%# Eval("consignee_country") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conpincode"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="conpincode1" Text='<%# Eval("consignee_pincode") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conphoneno "  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="conphoneno1" Text='<%# Eval("consignee_phoneno ") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText=" Concontactperson"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="concperson1" Text='<%# Eval(" consignee_contactperson") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Conemailid "  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="conemailid1" Text='<%# Eval("consignee_emailid ") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
       <asp:ImageButton ID="imgEdit" runat="server" CommandName="Edit"  ImageUrl="~/assets/img/edit.png"  ToolTip="Edit" commandargument='<%#Eval("auto_id")%>' CausesValidation="false"/>
       </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#00bfff">
       <ItemTemplate>
       <asp:ImageButton ID="imgdelete" runat="server" CommandName="Remove" CssClass="mydelete"  ImageUrl="~/assets/img/deleteicon.bmp"  ToolTip="Remove" commandargument='<%#Eval("auto_id")%>' CausesValidation="false"/>
       </ItemTemplate>
</asp:TemplateField>
       </Columns>
       </asp:GridView>      

                    <br />
						<div class="clearfix"></div>
					</div>


				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
        <footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2019 <a href="http://diamondshipping.in" target="_blank">Designed & Maintained by IT dept</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
    <asp:SqlDataSource ID="consigneedsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>"
SelectCommand="Select auto_id, consignee_name , consignee_marks, consignee_address1, consignee_address2 , consignee_city, consignee_country,consignee_pincode ,consignee_phoneno , consignee_contactperson, consignee_emailid from granite_consigneedetails_master" >
</asp:SqlDataSource>

    </form>
</body>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
</html>