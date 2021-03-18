<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Vessel.aspx.vb" Inherits="CnfGranite.Vessel" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Vessel Details</title>
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
    <link href="../tcal.css" rel="stylesheet" type="text/css" />
    <script src="../tcal.js" type="text/javascript"></script>
     <link rel="Shortcut Icon" type="image/png" href="../Images/ic.png" />
    <link href="../assets/vendor/inputmask/css/inputmask.css" rel="stylesheet" type="text/css" />
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
    <%--<script  type="text/javascript">
        function validation() {
            var vesno = document.getElementById("vesno").value;
            var vesnam = document.getElementById("vesnam").value;
            var voyno = document.getElementById("voyno").value;
            var arrdt = document.getElementById("arrdt").value;
            var brtdt = document.getElementById("brtdt").value;
            var saildt = document.getElementById("saildt").value;
            var netton = document.getElementById("netton").value;
            var captain = document.getElementById("captain").value;
            var voydet = document.getElementById("voydet").value;
            var rotno = document.getElementById("rotno").value;
            var rotdt = document.getElementById("rotdt").value;

            var cranew1 = document.getElementById("cranew1").value;
            var cranew2 = document.getElementById("cranew2").value;
            var cranew3 = document.getElementById("cranew3").value;
            var ownhandle = document.getElementById("ownhandle").value;
        
            
            if (vesno == "") 
             {
            alert("Enter the vessel number");
            return false;
            }
           if (vesnam == "") 
           {
           alert("Enter the vessel name");
           return false;
           }
       if (voyno == "") 
          {
          alert("Enter the voyage number");
          return false;
          }
      if (arrdt == "") 
          {
          alert("Enter the arrival date");
         return false;
          }
      if (brtdt == "") 
      {
         alert("Enter the berthdate");
         return false;
     }

     if (saildt == "") {
         alert("Enter the saildate");
         return false;
     }
     if (netton == "") {
         alert("Enter the net tonnage");
         return false;
     }
     if (captain == "") {
         alert("Enter the captain name");
         return false;
     }
     if (voydet == "") {
         alert("Enter the voyage details");
         return false;
     }
     if (rotno == "") {
         alert("Enter the rotation no");
         return false;
     }
     if (rotdt == "") {
         alert("Enter the rotation date");
         return false;
     }
     if (cranew1 == "") {
         alert("Enter the crane weight breakups details1");
         return false;
     }
     if (cranew2 == "") {
         alert("Enter the crane weight breakups details2");
         return false;
     }
     if (cranew3 == "") {
         alert("Enter the crane weight breakups details3");
         return false;
     }
     if (ownhandle == "") {
         alert("Enter the ownhandling details");
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
                                    <li><a class="active" href="../Essentials/Vessel.aspx">Vessel</a></li>
									<li><a  href="../Essentials/Shipper.aspx">Shipper</a></li>
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
                                    <li><a href="../Transaction/JobNoDetails.aspx">JobNo Details </a></li>
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
                <div class="lead"><b>Vessel Details</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Vessel No</div><div class="col-md-4"><asp:TextBox ID="vesno" class="form-control " autocomplete="off" runat="server">
                        </asp:TextBox><asp:HiddenField
                                ID="hdid" runat="server" />
                        </div>
                        <div class="col-md-2">Vessel Name</div><div class="col-md-4"><asp:TextBox ID="vesnam" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Voyage No</div><div class="col-md-4"><asp:TextBox ID="voyno" class="form-control" autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Arrival Date</div><div class="col-md-4"><asp:TextBox ID="arrdt" class="form-control tcal" ReadOnly="true" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Berth Date</div><div class="col-md-4"><asp:TextBox ID="brtdt" class="tcal"  autocomplete="off"   runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Sail Date</div><div class="col-md-4"><asp:TextBox ID="saildt" class="tcal" runat="server"></asp:TextBox></div>
                        
                        </div>
                        <div class="row">
                        <div class="col-md-3">Crane Weight Breakups</div><div class="col-md-1">
                        <asp:TextBox ID="cranew1" class="form-control" autocomplete="off" runat="server" Height="25" Width="45"></asp:TextBox></div>
                        <div class="col-md-1"><asp:TextBox ID="cranew2" class="form-control" autocomplete="off" runat="server" Height="25" Width="45"></asp:TextBox></div>
                        <div class="col-md-1"><asp:TextBox ID="cranew3" class="form-control" autocomplete="off" runat="server" Height="25" Width="45"></asp:TextBox></div>
                        <div class="col-md-3">Own Handling</div>
                        <div class="col-md-1"><asp:TextBox ID="ownhandle" class="form-control" autocomplete="off" runat="server" ></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Net Tonnage</div><div class="col-md-4"><asp:TextBox ID="netton" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Gross Tonnage</div><div class="col-md-4"><asp:TextBox ID="grosston" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Voyage Details</div><div class="col-md-4"><asp:TextBox ID="voydet" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Captain Name</div><div class="col-md-4"><asp:TextBox ID="captain" class="form-control " runat="server"></asp:TextBox></div>
                        
                        </div>
                        <div class="row">
                        <div class="col-md-2">Rotation No</div><div class="col-md-4"><asp:TextBox ID="rotno" class="form-control" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Rotation Date</div>
                        <div class="col-md-4">
                        <asp:TextBox ID="rotdt"  autocomplete="off"  runat="server" class="form-control tcal" ReadOnly="true"></asp:TextBox></div>
                        <div class="col-md-2"></div><div class="col-md-4"></div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 text-right "><asp:Button ID="Save" runat="server" Text="Submit" class="btn btn-success"/></div>
                        <div class="col-md-6">
                            <asp:Button ID="clear" runat="server" class="btn btn-danger" Text="Clear" /></div>                       
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
                            DataSourceID="vesseldsi" EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText="Vessel No" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="vesno1" Text='<%# Eval("vessel_no") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="VesselName" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="vesname" Text='<%# Eval("vessel_name") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="VoyageNo"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="voyno" Text='<%# Eval("voyage_no") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<%--<asp:TemplateField HeaderText="Arrivaldate"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
<ItemTemplate>
<asp:Label ID="arrdate" Text='<%# Eval("arrival_date") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Berthdate"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="berthdate" Text='<%# Eval("berth_date") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="SailDate"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="saildate" Text='<%# Eval("saildate") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Craneweightbup1"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="cwb1" Text='<%# Eval("crane_wt_bup1") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Craneweightbup2"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="cwb2" Text='<%# Eval("crane_wt_bup2") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Craneweightbup2"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="cwb3" Text='<%# Eval("crane_wt_bup3") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="OwnHandling"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="ownh" Text='<%# Eval("ownhandling") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Nettonnage"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="netton" Text='<%# Eval("net_tonnage") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Captainname"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="capname" Text='<%# Eval("captain_name") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="VoyageDetails"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="voyde" Text='<%# Eval("voyage_details") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Rotation_no"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="rono" Text='<%# Eval("rotation_no") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="RotationDate"  HeaderStyle-BackColor="#00bfff" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
<ItemTemplate>
<asp:Label ID="rodate" Text='<%# Eval("rotation_date") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>--%>
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
    <asp:SqlDataSource ID="vesseldsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>"
 SelectCommand="select auto_id,vessel_no,vessel_name,voyage_no from granite_vessel_master">
</asp:SqlDataSource>

    </form>
</body>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
</html>