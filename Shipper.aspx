
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Shipper.aspx.vb" Inherits="CnfGranite.Shipper" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipper Details</title>
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
        function validation() {
            var shipper = document.getElementById("shipper").value;
            var addr1 = document.getElementById("addr1").value;
            var addr2 = document.getElementById("addr2").value;
            var city = document.getElementById("city").value;
            var state = document.getElementById("state").value;
            var pincode = document.getElementById("pincode").value;
            var contact = document.getElementById("contact").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var mobile = document.getElementById("mobile").value;
            var iecode = document.getElementById("iecode").value;
            if (shipper == "") {
                alert("Enter the shipper Name");
                return false;
            }
            if (addr1 == "") {
                alert("Enter the shipper address1");
                return false;
            }
            if (addr2 == "") {
                alert("Enter the shipper address2");
                return false;
            }
            if (city == "") {
                alert("Enter the shipper city");
                return false;
            }
            if (state == "") {
                alert("Enter the shipper state");
                return false;
            }
            if (pincode == "") {
                alert("Enter the shipper pincode");
                return false;
            }
            if (contact == "") {
                alert("Enter the contactperson name");
                return false;
            }
            if (email == "") {
                alert("Enter the emailid");
                return false;

            }
            if (phone == "") {
                alert("Enter the phone number");
                return false;
            }
            if (mobile == "") {
                alert("Enter the mobile number");
                return false;
            }
            if (iecode == "") {
                alert("Enter the iecode");
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
                                <li ><a href="../Essentials/Vessel.aspx">Vessel</a></li>
									<li><a class="active" href="../Essentials/Shipper.aspx">Shipper</a></li>
									<li><a href="../Essentials/Consignee.aspx" >Consignee</a></li>									
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
                                    <li><a href="../Transaction/JobNoDetails.aspx" >JobNo Details</a></li>
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
                <div class="lead"><b>Shipper Details</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Shipper Name</div><div class="col-md-4"><asp:TextBox ID="shipper" class="form-control" autocomplete="off" runat="server">
                        </asp:TextBox>
                         </asp:TextBox><asp:HiddenField
                                ID="hdid" runat="server" /></div>
                        <div class="col-md-2">Address</div><div class="col-md-4"><asp:TextBox ID="addr1" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Address 2</div><div class="col-md-4"><asp:TextBox ID="addr2" class="form-control "  autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">City</div><div class="col-md-4"><asp:TextBox ID="city" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">State</div><div class="col-md-4"><asp:TextBox ID="state" class="form-control " autocomplete="false"   runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Pincode</div><div class="col-md-4"><asp:TextBox ID="pincode" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Contact Person</div><div class="col-md-4"><asp:TextBox ID="contact" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Email</div><div class="col-md-4"><asp:TextBox ID="email" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Phone No</div><div class="col-md-4"><asp:TextBox ID="phone" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Mobile No</div><div class="col-md-4"><asp:TextBox ID="mobile" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">IE Code</div><div class="col-md-4"><asp:TextBox ID="iecode" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2"></div><div class="col-md-4"></div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 text-right "><asp:Button ID="save" runat="server" Text="Submit" class="btn btn-success"/></div><div class="col-md-6"><asp:Button ID="Button1" runat="server" class="btn btn-danger" Text="Clear" /></div>                       
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
                            DataSourceID="shipperdsi" EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText="Shipper name" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="shipper1" Text='<%# Eval(" shipper_name") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText=" Shipper Address 1" HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="addr11" Text='<%# Eval("shipper_address") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Shipper Address 2"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="addr21" Text='<%# Eval("shipper_address2") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="City"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="city1" Text='<%# Eval("shipper_city") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="State"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="state1" Text='<%# Eval("shipper_state") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Pincode"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="pincode1" Text='<%# Eval("shipper_pincode") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Contact Person"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="contact1" Text='<%# Eval("shipper_contactperson" ) %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Email"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="email1" Text='<%# Eval("shipper_email") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Phone"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="phone1" Text='<%# Eval("shipper_phoneno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Mobile No"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="mobile1" Text='<%# Eval("shipper_mobileno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Shipper IEcode"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="iecode1" Text='<%# Eval("shipper_iecode") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#00bfff" >
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
    <asp:SqlDataSource ID="shipperdsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>"
SelectCommand="Select auto_id, shipper_name, shipper_address,shipper_address2, shipper_city, shipper_state, shipper_pincode,shipper_contactperson,shipper_email,shipper_phoneno,shipper_mobileno,shipper_iecode from granite_shipper_master" >
</asp:SqlDataSource>

    </form>
</body>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
</html>