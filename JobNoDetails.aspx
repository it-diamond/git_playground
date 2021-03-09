<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="JobNoDetails.aspx.vb" Inherits="CnfGranite.PackingListContainer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Packing List Container Details</title>
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
   <%--<script type="text/javascript" >
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
           var conname = document.getElementById("conname").value;
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
           if (conname == "") {
               alert("Enter the Consignee Name");
               return false;
           }
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
    </script>
    <script type="text/javascript" >
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

       </script>
    --%>
 <script type="text/javascript">
     $(function () {
         $('[id*=liner1]').typeahead({
             hint: true,
             highlight: true,
             minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("JobNoDetails.aspx/GetLiner") %>',
                    data: "{'prefix':'" + $("#liner1").val() + "'}",
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
        $('[id*=vname]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("JobNoDetails.aspx/Getvessel") %>',
                    data: "{'prefix':'" + $("#vname").val() + "'}",
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
                 $('[id*=marks]').typeahead({
                     hint: true,
                     highlight: true,
                     minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("JobNoDetails.aspx/Getconsignee") %>',
                    data: "{'prefix':'" + $("#marks").val() + "'}",
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
          $('[id*=portname]').typeahead({
              hint: true,
              highlight: true,
              minLength: 1
            , source: function (request, response) {

                $.ajax({
                    url: '<%=ResolveUrl("JobNoDetails.aspx/Getport") %>',
                    data: "{'prefix':'" + $("#portname").val() + "'}",
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
                    url: '<%=ResolveUrl("JobNoDetails.aspx/Getshipper") %>',
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

    <%--<script type="text/javascript" >
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
    </script>--%>
 <%--<script type="text/javascript">
     function show1() {
         document.getElementById('myDiv').style.display = 'none';
     }
     function show2() {
         document.getElementById('myDiv').style.display = 'block';
     }
</script>
--%>
</head>
<body>
    <form id="form2" runat="server" autocomplete="off">
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
                                    <li><a href="../Essentials/Port.aspx">Port</a></li>
									<li><a href="../Essentials/Cf.aspx">C & F Party</a></li>                                    									
								</ul>
							</div>
						</li>                        
                        <li>
							<a href="#subPages3" data-toggle="collapse" class="active"><i class="fas fa-globe"></i> <span>Transaction</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages3" class="collapse in ">
								<ul class="nav">
									<li><a href="../Transaction/PackingListVessel.aspx">Packing List Vessel </a></li>
                                    <li><a href="../Transaction/JobNoDetails.aspx" class="active">JobNo details</a></li>
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
                <div class="lead"><b>JobNo Creation</b></div>
					<div class="panel panel-profile">
                    <br />
                        <div class="row">
                        <div class="col-md-2">Vessel Name</div><div class="col-md-4"><asp:TextBox ID="vname" class="form-control " autocomplete="off" runat="server"></asp:TextBox>
                          <asp:HiddenField
                                ID="hdid" runat="server" /></div>
                        <div class="col-md-4"><asp:Button ID="NewJob" runat="server" Text="NewJob" class="btn btn-success"  OnClientClick="return validation()" /></div>
                        <div class="col-md-4"><asp:Button ID="Edit" runat="server" class="btn btn-danger" Text="Edit" /></div> 
                        </div>   
                        </div>    <br />                        
						<%--<div class="clearfix"></div>--%>
					</div>
                    <div class="panel panel-profile">
                    <asp:GridView ID="gvvessel" runat="server" AutoGenerateColumns ="False" 
                             EmptyDataText="No Data Found">
       <HeaderStyle BackColor="#df5015" />
       <Columns >
    <asp:TemplateField HeaderText="Refno" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="Refno" Text='<%# Eval("Refno") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Shipping Billno" HeaderStyle-BackColor="#00bfff">
<ItemTemplate>
<asp:Label ID="shbno" Text='<%# Eval("sb_no") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
       <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#00bfff">
       <ItemTemplate>
       <asp:ImageButton ID="imgedit" runat="server" CommandName="Edit" CssClass="mydelete"  ImageUrl="~/Images/edit.png" commandargument='<%#Eval("Refno")%>'  ToolTip="Edit" CausesValidation="false"/>
       </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#00bfff">
       <ItemTemplate>
       <asp:ImageButton ID="imgdelete" runat="server" CommandName="Remove" CssClass="mydelete"  ImageUrl="~/assets/img/deleteicon.bmp" commandargument='<%#Eval("Refno")%>'  ToolTip="Delete" CausesValidation="false"/>
       </ItemTemplate>
</asp:TemplateField>
       </Columns>
       </asp:GridView>
					</div>
                    <div class="panel panel-profile">
                    <center><h1><asp:Label ID="lbledit" runat="server">EDITING SHIPPING BILL NO:</asp:Label>
                    </h1></center>
                    <div class="row pading">
                        <div class="col-md-2">Refno</div>
                        <div class="col-md-1"><asp:Label ID="lblrefno" runat="server"></asp:Label>
                        </div>
                        <div class="col-md-4">Serial No in Booking List</div>
                        <div class="col-md-3"><asp:TextBox ID="snoblist" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        <div class="col-md-1"><asp:Label ID="lblvenam" runat="server"></asp:Label>
                        </div></div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">SB.No</div>
                        <div class="col-md-2"><asp:TextBox ID="sbno" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                         </div> 
                         <div class="col-md-2"><asp:TextBox ID="sbdate" class="tcal" autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">Shipper Name</div>
                        <div class="col-md-2"><asp:TextBox ID="shname" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>   
                        <div class="col-md-2">Port Name</div>
                        <div class="col-md-2"><asp:TextBox ID="portname" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">Marks</div>
                        <div class="col-md-2"><asp:TextBox ID="marks" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2">Description Of Goods</div>
                         <div class="col-md-6"><asp:TextBox ID="descgoods" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                         </div>
                        </div> 
                         <div class="row pading">
                         <div class="col-md-2">S.Bill Type</div>
                         <div class="col-md-2">
                        <asp:DropDownList ID="sbilltype" runat="server" class="form-control input-sm ">
                        <asp:ListItem Value="">Select Company Type</asp:ListItem>
                        <asp:ListItem Value="100% EOU">100% EOU</asp:ListItem>
                        <asp:ListItem Value="DEEC">DEEC</asp:ListItem>
                        <asp:ListItem Value="DEEC-CVM-EPCG">DEEC-CVM-EPCG</asp:ListItem>
                        <asp:ListItem Value="EPCG">EPCG</asp:ListItem>
                        <asp:ListItem Value="FREF">FREF</asp:ListItem>
                        </asp:DropDownList> </div>
                         <div class="col-md-1">Invoice No</div>
                         <div class="col-md-2"><asp:TextBox ID="invoiceno" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2"><asp:TextBox ID="invoicedate" class="tcal"  autocomplete="off" runat="server"></asp:TextBox> </div>
                        </div> 
                         <div class="row pading">
                         <div class="col-md-2">BL Number</div>
                         <div class="col-md-2"><asp:TextBox ID="blno" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2"><asp:TextBox ID="bldate" class="tcal" autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-1">Stuffing Date</div>
                         <div class="col-md-2"><asp:TextBox ID="stuffingdate" class="tcal" autocomplete="off" runat="server"></asp:TextBox> </div>
                         </div> 
                        <div class="row pading">
                         <div class="col-md-2">No of Blocks</div>
                         <div class="col-md-2"><asp:TextBox ID="nblocks" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2">Total CBM</div>
                         <div class="col-md-2"><asp:TextBox ID="totalcbm" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         </div>
                         <div class="row pading">
                         <div class="col-md-2">Total Weight</div>
                         <div class="col-md-2"><asp:TextBox ID="totalwt" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2">BL Confirmation Date</div>
                         <div class="col-md-2"><asp:TextBox ID="blconfdate" class="tcal"  autocomplete="off" runat="server"></asp:TextBox> </div>
                         </div>
                          <div class="row pading">
                         <div class="col-md-2">Document Despatch Date</div>
                         <div class="col-md-2"><asp:TextBox ID="docdate" class="tcal" autocomplete="off" runat="server"></asp:TextBox> </div>
                         <div class="col-md-2">Time Taken</div>
                         <div class="col-md-2"><asp:TextBox ID="timetaken" class="form-control " autocomplete="off" runat="server"></asp:TextBox> </div>
                         </div>
                         <div class="row pading">
                         <div class="col-md-2">Reasons for NCS if any </div>
                         <div class="col-md-2"><asp:TextBox ID="reasonncs" class="form-control"  PlaceHolder="NIL" autocomplete="off" runat="server"></asp:TextBox> </div>
                         <%--<div class="col-sm-2" > <asp:RadioButtonList ID="selectionlist" runat="server" RepeatDirection="Horizontal" CssClass="radioboxlist"> 
                         <asp:ListItem Value="vessel" onclick="show1()">Vessel</asp:ListItem>
                         <asp:ListItem Value="container" onclick="show2()">Container</asp:ListItem>
                         </asp:RadioButtonList>
                         </div>--%>
                         </div>
                        <%--<div class="panel panel-profile" ID="myDiv" runat="server">--%>
                        <center><h1><asp:Label ID="Label1" runat="server">ADD CONTAINER DETAILS</asp:Label>
                         </h1></center>
                        <div class="row pading">
                        <div class="col-md-2">Refno</div>
                        <div class="col-md-1"><asp:Label ID="confrno" runat="server"></asp:Label>
                        </div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">Container No</div>
                        <div class="col-md-2"><asp:TextBox ID="conno" CharacterCasing="Upper" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        <div class="col-md-2">Size</div>
                        <div class="col-md-3">
                        <asp:DropDownList ID="companytype" runat="server" class="form-control input-sm ">
                        <asp:ListItem Value="">Select Company Type</asp:ListItem>
                        <asp:ListItem Value="20 ftDry">20 ft Dry</asp:ListItem>
                        <asp:ListItem Value="20 ftReefer">20 ft Reefer</asp:ListItem>
                        </asp:DropDownList> </div>   
                       
                         </div>   
                        <div class="row pading">
                        <div class="col-md-2">Liner</div>
                        <div class="col-md-2">
                        <asp:TextBox ID="liner1" class="form-control " autocomplete="off" runat="server">
                        </asp:TextBox> 
                        </div>
                        <div class="col-md-2">Line Seal No</div>
                        <div class="col-md-2"><asp:TextBox ID="linersealno" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        </div>
                         <div class="row pading">
                        <div class="col-md-2">CustSeal No</div>
                        <div class="col-md-2"><asp:TextBox ID="custsno" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div><div class="col-md-2">Block No(s)</div>
                        <div class="col-md-2"><asp:TextBox ID="blockno1" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">No Of Blocks</div>
                        <div class="col-md-2"><asp:TextBox ID="noofblocks" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        <div class="col-md-2">CBM</div>
                        <div class="col-md-3"><asp:TextBox ID="cbm1" class="form-control " autocomplete="off" runat="server"></asp:TextBox> 
                        </div>
                        </div>
                        <div class="row pading">
                        <div class="col-md-2">Total Weight</div>
                        <div class="col-md-2">
                        <asp:TextBox ID="totalweight1" class="form-control " autocomplete="off" runat="server">
                        </asp:TextBox> 
                        </div>
                        </div>
                        
                        <div class="row ">
                        <div class="col-sm-6 ">
                        <asp:Button ID="addbutton" class="btn btn-primary" runat="server" Text="Add" />
                           </div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 text-right"><asp:Button ID="save" runat="server" Text="Submit" class="btn btn-success"  OnClientClick="return validation()" />
                        </div><div class="col-md-6"><asp:Button ID="Button1" runat="server" class="btn btn-danger" Text="Clear" /></div>                     
                        </div>

                        <div class="row">            
                        <div class="col-md-4 text-right"><asp:Button ID="delete" runat="server" class="btn btn-success" Text="Delete" /></div>
                        <div class="col-md-5"><asp:TextBox ID="detevess" class="form-control " runat="server"></asp:TextBox></div> 
                        </div>    
                        <br /> 
                        <div class="row">
                   <asp:Gridview ID="Gridview1" runat="server" AutoGenerateColumns="false" Width="95%" class="table-bordered ">

        <Columns>
        <asp:BoundField DataField="refno" HeaderText="Refno" ItemStyle-Width="30" />
        <asp:BoundField DataField="container_no" HeaderText="Container No" ItemStyle-Width="30" />
        <asp:BoundField DataField="size" HeaderText="Size" ItemStyle-Width="50" />
        <asp:BoundField DataField="liner" HeaderText="liner" ItemStyle-Width="50" />
         <asp:BoundField DataField="liner_sealno" HeaderText="LineSealNo" ItemStyle-Width="50" />
         <asp:BoundField DataField="cust_sealno" HeaderText="CustSealNo" ItemStyle-Width="30" />
        <asp:BoundField DataField="blockno" HeaderText="BlockNo(s)" ItemStyle-Width="50" />
         <asp:BoundField DataField="noof_blocks" HeaderText="Noofblocks" ItemStyle-Width="50" />
         <asp:BoundField DataField="cbm" HeaderText="CBM" ItemStyle-Width="50" />
        <asp:BoundField DataField="total_weight1" HeaderText="TotalWeight" ItemStyle-Width="50" />
         
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
</div>    
   </div>
   </div>
			</div>
			<!-- END MAIN CONTENT -->
		
		<!-- END MAIN -->
		<div class="clearfix"></div>
        <footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2019 <a href="http://diamondshipping.in" target="_blank">Designed & Maintained by IT dept</a>. All Rights Reserved.</p>
			</div>
		</footer>
    <%--<asp:SqlDataSource ID="portdsi" runat="server" ConnectionString="<%$ConnectionStrings:MydbConn%>"
SelectCommand="Select auto_id,sb_no from granite_packinglistheader" >
</asp:SqlDataSource>--%>
    </form>
    
</body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/jscript"></script>
    <script src="../assets/vendor/jquery/jquery.min.js" type="text/jscript"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js" type="text/jscript"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js" type="text/jscript"></script>
	<script src="../assets/scripts/klorofil-common.js" type="text/jscript"></script>
    <script src="../assets/scripts/klorofil-common.js" type="text/jscript"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/bassjobsen/Bootstrap-3-Typeahead/master/bootstrap3-typeahead.min.js" type="text/jscript"></script>
</html>