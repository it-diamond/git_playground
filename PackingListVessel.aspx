<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PackingListVessel.aspx.vb" Inherits="CnfGranite.PackingList" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Packing List  Vessel Details</title>
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
   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <link href="../tcal.css" rel="stylesheet" type="text/css" />
    <script src="../tcal.js" type="text/javascript"></script>
    <style>
    .footer
    {
       height:40px; width:100%; color:Blue; position :fixed; bottom:0px; z-index:-100;   
        }
        .row{padding:10px;}
    </style>
  <%-- <script type="text/javascript" >
       function validation() {
//           alert(document.getElementById("date").value);
//        
//           alert(document.getElementById("vesno").value);
//           alert(document.getElementById("packinglist").value);
//           alert(document.getElementById("shippername").value);
//           alert(document.getElementById("conname").value);
//           alert(document.getElementById("packingmarks").value);
//           alert(document.getElementById("packingcnfagent").value);
//           alert(document.getElementById("pportname").value);
//           alert(document.getElementById("pdesc").value);
//           alert(document.getElementById("pblocknumber").value);
//           alert(document.getElementById("volumeofcbm").value);
//           alert(document.getElementById("packingstatus").value);
//           alert(document.getElementById("weightMT").value);
      
           var date = document.getElementById("date").value;
           //var pcountry = document.getElementById("pcountry").value;
           var vesno = document.getElementById("vesno").value;
           var packinglist = document.getElementById("packinglist").value;
           var shippername = document.getElementById("shippername").value;
           //var conname = document.getElementById("conname").value;
           var packingmarks = document.getElementById("packingmarks").value;
           var packingcnfagent = document.getElementById("packingcnfagent").value;
           var pportname = document.getElementById("pportname").value;
           var pdesc = document.getElementById("pdesc").value;
           //var pblocknumber = document.getElementById("pblocknumber").value;
           //var volumeofcbm = document.getElementById("volumeofcbm").value;
           //var weightMT = document.getElementById("weightMT").value;
           //var packingstatus = document.getElementById("packingstatus").value;
           if (date == "") {
               alert("Enter the date");
               return false;
           }
           if (vesno == "") {
               alert("Enter the vessel Name");
               return false;
           }
           if (packinglist == "") {
               alert("Enter the packinglist");
               return false;
           }
           if (shippername == "") {
               alert("Enter the shippername");
               return false;
           }
//           if (conname == "") {
//               alert("Enter the Consignee Name");
//               return false;
//           }
           if (packingmarks == "") {
               alert("Enter the packing marks");
               return false;
           }
           if (packingcnfagent == "") {
               alert("Enter the Packing cnf Agent");
               return false;
           }
           if (pportname == "") {
               alert("Enter the Packing cnf Agent");
               return false;
           }
           if (pdesc == "") {
               alert("Enter the Packing Description");
               return false;
           }
           
           return true;
           
       }
    </script>--%>
   <%-- <script type="text/javascript" >
        function validation12() {
            var date = document.getElementById("pblocknumber").value;
            //var pcountry = document.getElementById("pcountry").value;
            var vesno = document.getElementById("volumeofcbm").value;
            var packinglist = document.getElementById("weightMT").value;
            var shippername = document.getElementById("packingstatus").value;
            if (pblocknumber == "") {
                alert("Enter the blocknumber");
                return false;
            }
            if (volumeofcbm == "") {
                alert("Enter the volumeofcbm");
                return false;
            }
            if (weightMT == "") {
                alert("Enter the weightMT");
                return false;
            }
            if (packingstatus == "") {
                alert("Enter the packingstatus");
                return false;
            }
            return true;
        }

       </script>--%>
    <script type="text/javascript">
        $(function () {
            $('[id*=pportname]').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            , source: function (request, response) {
               
                $.ajax({
                    url: '<%=ResolveUrl("PackingListVessel.aspx/Getport") %>',
                    data: "{'prefix':'" + $("#pportname").val() + "'}",
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
         $('[id*=vesno]').typeahead({
             hint: true,
             highlight: true,
             minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("PackingListVessel.aspx/Getvessel") %>',
                    data: "{'prefix':'" + $("#vesno").val() + "'}",
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
         $('[id*=shippername]').typeahead({
             hint: true,
             highlight: true,
             minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("PackingListVessel.aspx/Getshipper") %>',
                    data: "{'prefix':'" + $("#shippername").val() + "'}",
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
         $('[id*=conname]').typeahead({
             hint: true,
             highlight: true,
             minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("PackingListVessel.aspx/Getconsignee") %>',
                    data: "{'prefix':'" + $("#conname").val() + "'}",
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
        $('[id*=packingcnfagent]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("PackingListVessel.aspx/Getcnfparty") %>',
                    data: "{'prefix':'" + $("#packingcnfagent").val() + "'}",
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


            $('#form1').on('keyup keypress', function (e) {
                var keyCode = e.keyCode || e.which;
                if (keyCode === 13) {
                    e.preventDefault();
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
						<li ><a href="#subPages" data-toggle="collapse" class="collapsed"><i class="fas fa-database"></i> <span>Essentials</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse">
								<ul class="nav">
                                    <li><a href="../Essentials/Vessel.aspx">Vessel</a></li>
									<li><a href="../Essentials/Shipper.aspx">Shipper</a></li>
									<li><a href="../Essentials/Consignee.aspx" >Consignee</a></li>									
                                    <li><a href="../Essentials/Liner.aspx">Liner</a></li>
                                    <li><a href="../Essentials/Port.aspx" >Port</a></li>
									<li><a href="../Essentials/Cf.aspx" >C & F Party</a></li>                                    									
								</ul>
							</div>
						</li>                        
                        <li>
							<a href="#subPages3" data-toggle="collapse" class="active"><i class="fas fa-globe"></i> <span>Transaction</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages3" class="collapse in ">
								<ul class="nav">
									<li><a href="../Transaction/PackingListVessel.aspx" class="active">Packing List Vessel </a></li>
                                    <li><a href="../Transaction/JobNoDetails.aspx" >JobNo Details</a></li>
									<li><a href="../Transaction/ShippingBill.aspx">SB Details</a></li>
                                    <li><a href="../Transaction/Covering Letter.aspx">Covering Letter </a></li>
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
                <div class="lead"><b>Packing List Vessel Details</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Ref No: </div><div class="col-md-4"><asp:TextBox ID="Refno" class="form-control " autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                        <asp:HiddenField
                                ID="hdid" runat="server" /></div>
                        <div class="col-md-2">Date</div>  
                        <div class="col-md-4"><asp:TextBox ID="date" class="tcal" autocomplete="off" runat="server"></asp:TextBox></div>                     
                        </div>
                        <div class="row">
                        <div class="col-md-2">Vessel Name</div><div class="col-md-4"><asp:TextBox ID="vesno" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Packing List No</div><div class="col-md-4"><asp:TextBox ID="packinglist" class="form-control " autocomplete="off" runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Shipper Name</div><div class="col-md-4"><asp:TextBox ID="shippername" class="form-control "  autocomplete="off" runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Consignee Name</div><div class="col-md-4"><asp:TextBox ID="conname" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Marks</div><div class="col-md-4"><asp:TextBox ID="packingmarks" class="form-control " autocomplete="false"   runat="server"></asp:TextBox></div>
                        <div class="col-md-2">C & F Agent</div><div class="col-md-4"><asp:TextBox ID="packingcnfagent" class="form-control " autocomplete="off"  runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Port Name</div><div class="col-md-4"><asp:TextBox ID="pportname" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Description</div><div class="col-md-4"><asp:TextBox ID="pdesc" class="form-control " runat="server"></asp:TextBox></div>
                       <%-- <asp:Button ID="viewgrid" class="btn btn-primary center-block" runat="server" Text="View vessel Details" /></div>--%>
                        
                        </div>
                        <div class="row">
                        <div class="col-md-2">No Of PCS</div><div class="col-md-4"><asp:TextBox ID="noofpcs" class="form-control " runat="server"></asp:TextBox>
                        <asp:Button ID="viewgrid" class="btn btn-primary center-block" runat="server" Text="View vessel Details"/></div>
                        <div class="col-md-2">Hatch Nbr</div><div class="col-md-4"><asp:TextBox ID="hatchnbr" class="form-control " runat="server"></asp:TextBox></div>

                        </div>
                        <br /> 
                        <br /> 
                        <div class="row">
                        <div class="col-md-2">Block Number</div><div class="col-md-4"><asp:TextBox ID="pblocknumber" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Volume of CBM</div><div class="col-md-4"><asp:TextBox ID="volumeofcbm" class="form-control " runat="server"></asp:TextBox></div>
                        </div>
                        <div class="row">
                        <div class="col-md-2">Weight M.T</div><div class="col-md-4"><asp:TextBox ID="weightMT" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Status</div><div class="col-md-4"><asp:TextBox ID="packingstatus" class="form-control " Text="A" runat="server"></asp:TextBox></div>
                        </div>
     
                        <div class="row">
                        <div class="col-md-12"><asp:Button ID="add" class="btn btn-primary center-block" runat="server" Text="Add" /></div>
                        </div>
                        <br />   
                        <br /> 
                        <div class="row">

        <asp:Gridview ID="Gridview1" runat="server" AutoGenerateColumns="false" Width="100%" class="table-bordered ">

        <Columns>
        <asp:BoundField DataField="Blocknumber" HeaderText="Block Number" ItemStyle-Width="30" />
        <asp:BoundField DataField="Volumeofcbm" HeaderText="Volume of CBM" ItemStyle-Width="150" />
        <asp:BoundField DataField="weightMT" HeaderText="Weight MT" ItemStyle-Width="150" />
         <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-Width="150" />
               <asp:TemplateField headertext="Edit" HeaderStyle-Width ="5">
             <ItemTemplate >              
              <asp:ImageButton ID="Editcargo" runat="server" CommandName="change" ImageUrl="~/assets/img/edit.png" CommandArgument="<%# Container.DataItemIndex%>"  ToolTip="Edit"  CausesValidation="false" />
                  </ItemTemplate>
              </asp:TemplateField>
                <asp:TemplateField headertext="delete" HeaderStyle-Width ="5">
              <ItemTemplate>
              <asp:ImageButton id="deletecargo"  ImageUrl="~/assets/img/deleteicon.bmp" CommandName="remove" runat="server" CommandArgument="<%# Container.DataItemIndex%>" ToolTip="Remove" CausesValidation="false"  />
            </ItemTemplate>
              </asp:TemplateField>
        </Columns>

</asp:Gridview>     
   </div> 
                        <div class="row">            
                        <div class="col-md-6 text-right "><asp:Button ID="save" runat="server" Text="Submit" class="btn btn-success" /></div>
                        <div class="col-md-6"><asp:Button ID="clear" runat="server" class="btn btn-danger" Text="Clear" /></div> 
                        </div>    <br /> 
                        <br /> 
                                 <div class="row"> 
                                   <div class="col-md-3"><asp:Label ID="totalblocknumber" runat="server" ></asp:Label></div>
                                   <div class="col-md-4"><asp:Label ID="totalvolumeofCBM" runat="server"  ></asp:Label></div>
                                   <div class="col-md-5"><asp:Label ID="totalweightMT"  runat="server"  ></asp:Label></div>
                                   
                                 </div>             
						<div class="clearfix"></div>
					<%--</div>--%>
                    <%--<div class="row">--%>
                  
    <%--<div class="col-md-2">Block Number</div><div class="col-md-4"><asp:TextBox ID="pblocknumber" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Volume of CBM</div><div class="col-md-4"><asp:TextBox ID="volumeofcbm" class="form-control " runat="server"></asp:TextBox></div>
  <div class="col-md-2">Weight M.T</div><div class="col-md-4"><asp:TextBox ID="weightMT" class="form-control " runat="server"></asp:TextBox></div>
                        <div class="col-md-2">Status</div><div class="col-md-4"><asp:TextBox ID="packingstatus" class="form-control " runat="server"></asp:TextBox></div>--%>
                        <%--<div class="row">
                        <div class="col-md-6 text-right "><asp:Button ID="Button2" runat="server" Text="Submit" class="btn btn-success"  OnClientClick="return validation()" /></div>
                        <div class="col-md-6"><asp:Button ID="Button3" runat="server" class="btn btn-danger" Text="Clear" /></div>                       
                        </div>--%>
   <%--</div>--%>
   
   <br />
   <%--<div class="row text-right">

           <%--<div class="col-sm-12"><asp:Button ID="add"  OnClientClick="return validation12()" class="btn btn-primary" runat="server" Text="Add" /></div>--%>
           <%--<div class="col-sm-12"><asp:Button ID="add" class="btn btn-primary" runat="server" Text="Add" /></div>
   </div>
      <br />--%>
   
                    <div class="panel panel-profile">

                  <asp:GridView ID="gvvessel" runat="server" AutoGenerateColumns ="False" 
                            DataSourceID="listdsi" EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText=" Refno" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblRefno" Text='<%# Eval("Refno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PDate" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlbldate" Text='<%# Eval("packing_date") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PVName"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblvesno" Text='<%# Eval("packing_vesselname") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PList"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblpackinglist" Text='<%# Eval("packing_listno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Pshippername"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblshippername" Text='<%# Eval("packing_shippername") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Pconsiname"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblconname" Text='<%# Eval("packing_consigneename") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Packingmarks"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblpackingmarks" Text='<%# Eval("packing_marks" ) %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PcnfAgent"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblpackingcnfagent" Text='<%# Eval("packing_cnfagent") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PPortname"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblpportname" Text='<%# Eval("packing_portname") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Pdesc"  HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="gvlblpdesc" Text='<%# Eval("packing_description") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
       <asp:ImageButton ID="imgEdit" runat="server" CommandName="Edit"  ImageUrl="~/assets/img/edit.png"  ToolTip="Edit" commandargument='<%#Eval("autoid")%>' CausesValidation="false"/>
       </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#00bfff">
       <ItemTemplate>
       <asp:ImageButton ID="imgdelete" runat="server" CommandName="Remove" CssClass="mydelete"  ImageUrl="~/assets/img/deleteicon.bmp"  ToolTip="Remove" commandargument='<%#Eval("autoid")%>' CausesValidation="false"/>
       </ItemTemplate>
</asp:TemplateField>
       </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="listdsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>">
</asp:SqlDataSource>
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
    </form>
</body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/bassjobsen/Bootstrap-3-Typeahead/master/bootstrap3-typeahead.min.js"></script>




</html>