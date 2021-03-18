<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Liner.aspx.vb" Inherits="CnfGranite.Liner" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Liner Details</title>
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
    <%--<script type="text/javascript">
        function validation() {
            var lname = document.getElementById("lname").value;
            var laddress = document.getElementById("laddress").value;
            var lcity = document.getElementById("lcity").value;
            var lagent = document.getElementById("lagent").value;
            var lcperson = document.getElementById("lcperson").value;
            var lphoneno = document.getElementById("lphoneno").value;
            var lemail = document.getElementById("lemail").value;
            var lpincode = document.getElementById("lpincode").value;
             if (lname == "") {
                alert("Enter the Liner Name");
                return false;
            }
            if (laddress == "") {
                alert("Enter the liner address");
                return false;
            }
            if (lcity  == "") {
                alert("Enter the liner city");
                return false;
            }
            if (lagent== "") {
                alert("Enter the liner agent");
                return false;
            }
             if (lcperson == "") {
                alert("Enter the liner contact person name");
                return false;
            }
            if ( lphoneno== "") {
                alert("Enter the liner phone number");
                return false;
            }
            if (lemail == "") 
            {
                alert("Enter the liner emailid ");
                return false;
            }
            if (lpincode == "") 
            {
                alert("Enter the liner pin code number");
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
                                    <li><a href="../Essentials/Vessel.aspx">Vessel</a></li>
									<li><a href="../Essentials/Shipper.aspx">Shipper</a></li>
									<li><a href="../Essentials/Consignee.aspx" >Consignee</a></li>									
                                    <li><a class="active" href="../Essentials/Liner.aspx">Liner</a></li>
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
                <div class="lead"><b>Liner Details</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Liner Name</div><div class="col-md-4"><asp:TextBox ID="lname" class="form-control " autocomplete="off" runat="server"></asp:TextBox>
                        <asp:HiddenField
                                ID="hdid" runat="server" /></div>
                        <div class="col-md-2">Address</div><div class="col-md-4"><asp:TextBox ID="laddress" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">City</div><div class="col-md-4"><asp:TextBox ID="lcity" class="form-control "  autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Agent</div><div class="col-md-4"><asp:TextBox ID="lagent" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Contact Person</div><div class="col-md-4"><asp:TextBox ID="lcperson" class="form-control " autocomplete="false"   runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Phone No</div><div class="col-md-4"><asp:TextBox ID="lphoneno" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Email</div><div class="col-md-4"><asp:TextBox ID="lemail" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Pincode</div><div class="col-md-4"><asp:TextBox ID="lpincode" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 text-right "><asp:Button ID="save" runat="server" Text="Submit" class="btn btn-success"  OnClientClick="return validation()" /></div><div class="col-md-6"><asp:Button ID="Button1" runat="server" class="btn btn-danger" Text="Clear" /></div>                       
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
                            DataSourceID="linerdsi" EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText="Liner Name" HeaderStyle-BackColor="#00bfff" >
<ItemTemplate>
<asp:Label ID="lname" Text='<%# Eval(" liner_name ") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText=" Liner Address" HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="laddress" Text='<%# Eval("liner_address") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner City"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="lcity" Text='<%# Eval(" liner_city") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner Agent"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="lagent" Text='<%# Eval(" liner_agent") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner contactperson"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="lcperson" Text='<%# Eval("liner_conperson") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner phoneno"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="lphoneno" Text='<%# Eval(" liner_phoneno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner email"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="contact" Text='<%# Eval(" liner_email" ) %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Liner pincode"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="lpincode" Text='<%# Eval("liner_pincode") %>' runat="server"/>
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
    <asp:SqlDataSource ID="linerdsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>"
SelectCommand="Select auto_id, liner_name, liner_address,liner_city, liner_agent, liner_conperson, liner_phoneno,liner_email,liner_pincode from granite_liner_master" >
</asp:SqlDataSource>
    </form>
</body>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
</html>