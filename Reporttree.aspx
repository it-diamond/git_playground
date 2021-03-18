<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reporttree.aspx.vb" Inherits="CnfGranite.Reporttree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CNF - Granite Report Tree</title>
    	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" type="text/javascript"></script>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="../assets/vendor/chartist/css/chartist-custom.css">
	<link rel="stylesheet" href="../assets/css/main.css">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
     <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
       <link rel="Shortcut Icon" type="image/png" href="../Images/ic.png" />
        <link href="../tcal.css" rel="stylesheet" type="text/css" />
    <script src="../tcal.js" type="text/javascript"></script>
    
     <style type="text/javascript">
    .clsegm,.clscnf,.clsweight,.cashcls,.clshblock
    {
        display :none ;
    }
    </style>
    <script type="text/javascript">
        $(function () {
            $('.clsegm').hide();
            $('.clscnf').hide();
            $('.clsweight').hide();
            $('.cashcls').hide();
            $('.clsblno').hide();
            $('.clshblock').hide();

            ahbp

            $('#aegm').click(function () {
                $('.clsegm').show();
                $('.clscnf').hide();
                $('.clsweight').hide();
                $('.cashcls').hide();
                $('.clsblno').hide();
                $('.clshblock').hide();

            });
            $('#a1').click(function () {
                $('.clsegm').hide();
                $('.clscnf').hide();
                $('.clsweight').hide();
                $('.cashcls').hide();
                $('.clsblno').show();
                $('.clshblock').hide();

            });
            $('#acnf').click(function () {
                $('.clsegm').hide();
                $('.clscnf').show();
                $('.clsweight').hide();
                $('.cashcls').hide();
                $('.clsblno').hide();
                $('.clshblock').hide();

            });
            $('#aweight').click(function () {
                $('.clsegm').hide();
                $('.clscnf').hide();
                $('.clsweight').show();
                $('.cashcls').hide();
                $('.clsblno').hide();
                $('.clshblock').hide();

            });
            $('#avoucher').click(function () {
                $('.clsegm').hide();
                $('.clscnf').hide();
                $('.clsweight').hide();
                $('.cashcls').show();
                $('.clsblno').hide();
                $('.clshblock').hide();

            });
            $('#ahbp').click(function () {
                $('.clsegm').hide();
                $('.clscnf').hide();
                $('.clsweight').hide();
                $('.cashcls').hide();
                $('.clsblno').hide();
                $('.clshblock').show();

            }); 
        });
    </script>


<script type="text/javascript">
    $(function () {
        $('.clsautovessel').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Reporttree.aspx/Getvessel") %>',
                    data: "{'prefix':'" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        items = [];
                        map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            updater: function (item) {

                return item;
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('.clsautoport').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Reporttree.aspx/Getport") %>',
                    data: "{'prefix':'" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        items = [];
                        map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            updater: function (item) {

                return item;
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('.clsautocnf').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Reporttree.aspx/Getcnfparty") %>',
                    data: "{'prefix':'" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        items = [];
                        map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            updater: function (item) {

                return item;
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('#cashvocno').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("Reporttree.aspx/GetCashVno") %>',
                    data: "{ 'prefix': '" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        items = [];
                        map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('|')[1];
                            var name = item.split('|')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");



                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            updater: function (item) {

            }
        });
    });
</script>
<style type="text/css">
     .radioboxlist radioboxlistStyle
{
font-size:x-large;
padding-right: 20px;
}
.radioboxlist label {

white-space: nowrap;
clear: left;
margin-right: 10px;
margin-left: 10px;
}
.radioboxlist label:hover
{
color: #0097FF;

}
input:checked + label {
color: #0097FF;
}
</style>
<style type="text/css">
    .pading
    {
        padding :6px;
    }
    </style>
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
						<li ><a href="#subPages" data-toggle="collapse" class="collapsed"><i class="fas fa-database"></i> <span>Essentials</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
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
									<li><a href="../Transaction/PackingListVessel.aspx">Packing List Vessel </a></li>
                                    <li><a href="../Transaction/JobNoDetails.aspx">JobNo Details </a></li>
									 <li><a href="../Transaction/ShippingBill.aspx">SB Details</a></li>
                                     <li><a href="../Transaction/Covering Letter.aspx">Covering Letter </a></li>
                                    <li><a href="../Transaction/Allocation.aspx">Allocate Job</a></li>
                                    <li><a href="../Transaction/Search.aspx">Search </a></li>                                    
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
						<div class="clearfix">
                      

                      <div class="clearfix">
                        
                        <div class="panel panel-default">
<div class="panel-heading" style ="background-color:#ffd182;">
<font style="font-weight:bold;font-size:medium;">Reports</font>
</div>
    <div class="panel-body" style="height:70%;">
      <div class="row">
     <div class="col-sm-4">
      <div class="container" style ="width :85%;margin-left:10px;">
  <ul class="file-tree">
    <li><a href="#">General</a></li>
      <ul>
        <li><a href="#" id="aegm">Export General Manifest</a></li>
        <li><a href="#" id="a1">Export General Manifest BL No</a></li>
        <li><a href="#" id="acnf">CNF Partywise Booking List Report</a></li>
        <li><a href="#" id="aweight">Weightwise Booking List Report</a></li>
        <li><a href="#" id="ahbp">Heavy Block List Report</a></li>
        <li><a href="#" id="avoucher">Voucher</a></li>
  </ul>
  </ul>
</div>
</div>
 <div class="col-sm-8">
               <div class="clsegm">
                <div class="row">
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>Export General Manifest</u></div>
<br />
<br />
                 <div class="col-sm-2">Vessel Name</div> <div class="col-sm-4"><asp:TextBox ID="vname" runat="server" CssClass="clsautovessel" Width="200px" /></div>
                  <div class="col-sm-2">Port Name</div> <div class="col-sm-4"><asp:TextBox ID="pname" CssClass="clsautoport" runat="server" Width="200px"/></div>
             <br />
                <br />
                   <br />
                   <div class="col-sm-3"> </div>
                   <div class="col-sm-3"> </div>

                   <div class="col-sm-3"> <asp:Button ID="report" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="cancel" runat="server" Text="Clear" class="btn btn-secondary"/></div>
                </div>
               </div>
               <div class="clsblno">
               <div class="row">
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>Export General Manifest BL No</u></div>
                <br />
                <br />
                 <div class="col-sm-2">Vessel Name</div> <div class="col-sm-4"><asp:TextBox ID="TextBox1" runat="server" CssClass="clsautovessel" Width="200px" /></div>
                  <div class="col-sm-2">Port Name</div> <div class="col-sm-4"><asp:TextBox ID="TextBox2" CssClass="clsautoport" runat="server" Width="200px"/></div>
             <br />
                <br />
                   <br />
                   <div class="col-sm-3"> </div>
                   <div class="col-sm-3"> </div>

                   <div class="col-sm-3"> <asp:Button ID="Button3" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="Button4" runat="server" Text="Clear" class="btn btn-secondary"/></div>
                </div>
               </div>
               <div class="clscnf">
                <div class="row" >
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>CNF Partywise Booking List Report</u></div>
                  <br />
                  <br />
                 <div class="col-sm-2">Vessel Name</div> 
                  <div class="col-sm-4"><asp:TextBox ID="vesname" runat="server" CssClass="clsautovessel" Width="200px" /></div>
                  <div class="col-sm-2">Port Name</div> 
                  <div class="col-sm-4"><asp:TextBox ID="portname" CssClass="clsautoport" runat="server" Width="200px"/></div>
                  <br />
                  <br />
                  <div class="col-sm-2">CNF Party</div> 
                  <div class="col-sm-4">
                  
                  <asp:TextBox ID="cnfparty"  CssClass="clsautocnf" runat="server" Width="200px"/>
                  <div class="col-sm-3"><asp:ListBox ID="ListBox1" runat="server" Height="150" Width="125" SelectionMode="Multiple" AutoPostBack="False"></asp:ListBox> 
                  </div>
                  </div>
                  <div class="col-sm-3"> <asp:Button ID="button5" runat="server" Text="add" class="btn btn-primary"/></div>
                  
                 </div>
             <br />
                <br />
                   <br />

                   <div class="col-sm-3"> <asp:Button ID="tim2report" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="tim2cancel" runat="server" Text="Cancel" class="btn btn-secondary"/></div>

                </div>
               

                

                <div class="clshblock">
                <div class="row">
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>Heavy Block List Report</u></div>
   
                  <br />
                  <br />
                 <div class="col-sm-2">Vessel Name</div> <div class="col-sm-4"><asp:TextBox ID="vesname1" runat="server" CssClass="clsautovessel" Width="200px" /></div>
                  <div class="col-sm-2">Port Name</div> <div class="col-sm-4"><asp:TextBox ID="portname1" CssClass="clsautoport" runat="server" Width="200px"/></div>
                  <br />
                  <br />
                  <div class="col-sm-2">Crane Weight1</div> <div class="col-sm-4"><asp:TextBox ID="cranewt1"  CssClass="clsautocnf" runat="server" Width="200px"/></div>
                  <br />
                  <div class="col-sm-2">Crane Weight3</div> <div class="col-sm-4"><asp:TextBox ID="cranewt3"  CssClass="clsautocnf" runat="server" Width="200px"/></div>
                  <br />
                  <div class="col-sm-2">Crane Weight2</div> <div class="col-sm-4"><asp:TextBox ID="cranewt2"  CssClass="clsautocnf" runat="server" Width="200px"/></div>
                  <br />
                    
                  <br />
                   <br />
                 <div class="col-sm-3"><asp:Button ID="Report1" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="Cancel1" runat="server" Text="Clear" class="btn btn-secondary"/></div>
                </div>
                </div>
               <div class="clsweight">
                <div class="row" >
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>Weightwise Booking List Report</u></div>
                   <br />
                <br />
                 <div class="col-sm-2">Vessel Name</div> <div class="col-sm-4"><asp:TextBox ID="vesnamewt" CssClass="clsautovessel" runat="server" Width="200px" /></div>
                  <div class="col-sm-2">Port Name</div> <div class="col-sm-4"><asp:TextBox ID="portnamewt" CssClass="clsautoport" runat="server" Width="200px"/></div>
                 <br />
                 <br />
              <div class="col-sm-3"> <asp:Button ID="Weightwisereport" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="Weightwisecancel" runat="server" Text="Clear" class="btn btn-secondary"/></div>
                </div>
                </div>
             <div class="cashcls">
                <div class="row" >
                <div class="col-sm-12 text-danger text-center" style="font-size:16px;"><u>Cash</u></div>
                         <br />
                   <br />
                     <div class="col-sm-2">Voucher No</div> 
                     <div class="col-sm-4">
                     <asp:TextBox ID="cashvocno" runat="server" class="form-control "   MaxLength ="10" Width="200px" AutoComplete="off"/>
                     </div> 
                     <asp:HiddenField ID="hdvnocash" runat="server" />  
             <div class="col-sm-3"> <asp:Button ID="Button1" runat="server" Text="Report" class="btn btn-primary"/></div>
                <div class="col-sm-3"><asp:Button ID="Button2" runat="server" Text="Cancel" class="btn btn-secondary"/></div>
            
             </div>
                     </div>
                      </div>
     </div>
    </div>

    </div>
    </div>
      
     </div>
     </div>
      </div>
		</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
    </form>
</body>

	<%--<script src="../assets/vendor/jquery/jquery.min.js"></script>--%>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/bassjobsen/Bootstrap-3-Typeahead/master/bootstrap3-typeahead.min.js"></script>
        <script src="../assets/scripts/file-explore.js" type="text/javascript"></script>
    <link href="../assets/css/jquerysctiptop.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/file-explore.css" rel="stylesheet" type="text/css" />
</html>
