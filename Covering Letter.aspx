 <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Covering Letter.aspx.vb" Inherits="CnfGranite.Covering_Letter" %>

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
    
        <style >
    .clsegm,.clscnf,.clsweight
    
    {
        display :none ;
    }
    </style>
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
    <script type="text/javascript">
        $(function () {
            $('[id*=vessel]').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Covering Letter.aspx/Getvessel") %>',
                    data: "{'prefix':'" + $("#vessel").val() + "'}",
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
         $('[id*=shname]').typeahead({
             hint: true,
             highlight: true,
             minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Covering Letter.aspx/Getshipper") %>',
                    data: "{'prefix':'" + $("#shname").val() + "'}",
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
        $('[id*=sbilno]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("Covering Letter.aspx/Getsbno") %>',
                  data: "{'prefix':'" + $("#sbilno").val() + "'}",
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
									<li><a  href="../Essentials/Consignee.aspx" >Consignee</a></li>									
                                    <li><a  href="../Essentials/Liner.aspx">Liner</a></li>
                                    <li><a  href="../Essentials/Port.aspx">Port</a></li>
									<li><a  href="../Essentials/Cf.aspx">C & F Party</a></li>                                    									
								</ul>
							</div>
						</li>                        
                        <li>
							<a href="#subPages3" data-toggle="collapse" class="active"><i class="fas fa-globe"></i> <span>Transaction</span> 
                            <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages3" class="collapse ">
								<ul class="nav">
									<li><a href="../Transaction/PackingListVessel.aspx">Packing List Vessel </a></li>
                                    <li><a href="../Transaction/JobNoDetails.aspx">JobNo Details</a></li>
                                    <li><a href="../Transaction/Covering Letter.aspx" class="active">Covering Letter</a></li>
									<li><a href="../Transaction/ShippingBill.aspx">SB Details</a></li>
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
                        <li><a href="../Reports/ReportTree.aspx"><i class="fas fa-chart-pie"></i><span>Reports</span></a></li>                        
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
                        
                        <div class="panel panel-default" >
<div class="panel-heading" style ="background-color:#ffd182;">
<font style="font-weight:bold;font-size:medium;">Covering Letter</font>
</div>
    <div class="panel-body">
     <div class="row">
            <div class="row pading">
            <div class="col-sm-3" >Date</div>
            <div class="col-sm-2"><asp:TextBox ID="date" runat="server" class="form-control tcal"></asp:TextBox>
           </div>
           <div class="col-sm-3" ><asp:Button ID="new"  class="basic" runat="server" Text="New"/></div>
           </div>
            </div>
            <div class="row pading">
           <div class="col-sm-3" >Sno</div>
            <div class="col-sm-2"><asp:TextBox ID="snotxt" runat="server" class="form-control"></asp:TextBox>
           </div>
           
   </div>
   
   </br>
    <div class="row">
             <div class="col-sm-3">Vessel Name</div>
            <div class="col-sm-2"><asp:TextBox ID="vessel" runat="server" class="form-control"></asp:TextBox>
           </div>
           </div>
           </br>
           <div class="row">
             <div class="col-sm-3">Shipper Name</div>
            <div class="col-sm-2"><asp:TextBox ID="shname" runat="server" class="form-control"></asp:TextBox>
           </div>
           </div>
           </br>
           <div class="row">
             <div class="col-sm-3">Job No</div>
            <div class="col-sm-2"><asp:TextBox ID="sbilno" runat="server" class="form-control"></asp:TextBox>

            </div>  
            <div class="col-sm left"></div><asp:Button ID="Button1"  class="basic" runat="server" Text="Add S.Bill"/>
            <br />
            <br />
            <br />
            </div>
            <div class="row">
            <div class="col-sm-3 left">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
        <Columns>
        <asp:TemplateField HeaderText="ShippingBillNo" ItemStyle-Width="30">
            <ItemTemplate>
                <asp:TextBox ID="txtsb_no" runat="server" Text='<%# Eval("sb_no") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Marks" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtpacking_marks" runat="server" Text='<%# Eval("packing_marks") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="date" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtsb_date" runat="server" Text='<%# Eval("sb_date") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="Button3" Text="Insert" runat="server" CommandName="Insert" CommandArgument="<%# Container.DataItemIndex %>" />
            </ItemTemplate>
        </asp:TemplateField>
      </Columns>
</asp:GridView>
             </br>
            </div> 
            </div>                                                                                                                                                                                                                                                                                                           
       
           </br>
            
             <div class="col-sm-2" > 
            <asp:RadioButtonList ID="couriertype" runat="server" RepeatDirection="Horizontal" CssClass="radioboxlist">
            <asp:ListItem Value="professional" Selected="True" onclick="repcusname()">Professional</asp:ListItem>
            <asp:ListItem Value="bluedot" onclick="repdate()">Blue Dot</asp:ListItem>
            <asp:ListItem Value="dhl" onclick="repdate()">DHL</asp:ListItem>
           </asp:RadioButtonList>
           </div>
           </br>
           </br>
           </br>
           <%--<div class="row">
             <div class="col-sm-3"><p class="text-danger">Party Name Against the S.Bill</p></div>
            <div class="col-sm-2"><asp:TextBox ID="shippingbilno" runat="server" class="form-control"></asp:TextBox></div>
             <div class="col-sm-3"><asp:Button ID="Button1"  class="basic" runat="server" Text="Add S.Bill"/></div>
           </div>--%>

            <div class="col-sm-6" >
          <div class="row pading"> 
      <div class="col-sm-6" id="divinvoicecopy" runat="server">1. Invoice</div>
         <div class="col-sm-1"><asp:CheckBox ID="chkinvcopy" runat="server" /></div>
          <div class="col-sm-5"><asp:TextBox ID="invoicecopy" runat="server" class="form-control"></asp:TextBox></div>
         </div>
      <%--<div class="row pading"> 
         <div class="col-sm-6" id="Div1" runat="server"><p class="text-primary">Remarks if any</p></div>
          <div class="col-sm-3"><asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox></div>
          </div>--%>
              <div class="row pading"> 
                 <div class="col-sm-6" id="divpackinglist" runat="server">2. Packing List </div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkpackinglist" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="packinglist" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divexportercopy" runat="server">3. Exporter Copy </div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkexportercopy" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="exportercopy" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divforwardingbill" runat="server">4. Forwarding Bill</div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkforwardingbill" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="forwardingbill" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divsurveyreport" runat="server">5. Survey Report with Photos</div>
         <div class="col-sm-1" ><asp:CheckBox ID="chksurveyreport" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="surveyreport" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divfumigation" runat="server" >6.Fumigation Certificate </div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkfumigation" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="fumigation" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divsdfform" runat="server">7. Bill of Lading</div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkbilloflading" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="billladinig" runat="server" class="form-control"></asp:TextBox></div>
         </div>
         <div class="row pading"> 
                 <div class="col-sm-6" id="divcertioforigin" runat="server">8. Certificate of Origin</div>
         <div class="col-sm-1" ><asp:CheckBox ID="chkcertioforigin" runat="server" /></div>
         <div class="col-sm-5" > <asp:TextBox ID="certioforigin" runat="server" class="form-control"></asp:TextBox></div>
         </div>

         <div class="row">
           <asp:TextBox ID="TextBox5" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            <%--<asp:TextBox ID="information" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>--%>
        </div>
         <center ><asp:Button ID="Button2"  class="basic" runat="server" Text="Submit"/></center>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/bassjobsen/Bootstrap-3-Typeahead/master/bootstrap3-typeahead.min.js"></script>
    <script src="../assets/scripts/file-explore.js" type="text/javascript"></script>
    <link href="../assets/css/jquerysctiptop.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/file-explore.css" rel="stylesheet" type="text/css" />
</html>

