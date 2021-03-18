<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Cashvoc.aspx.vb" Inherits="CnfGranite.Cashvoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CNF - Cash Voucher</title>
      <link rel="Shortcut Icon" type="image/png" href="../Images/ic.png" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
    <style >
    .Authorised
    {
        position :relative ;
       
    }
        .Authorised1
    {
        position :relative ;
       
    }
    .watermark {
    opacity: 0.5;
    color: BLACK;
    position: absolute;
    top: 100px;
    left: 20px;
    font-size :100px;
      transform: rotate(-20deg);
     
}
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div style ="width:210mm; height:auto; border:1px solid black; position:absolute; top:0mm; left:0mm; font-family:Arial;font-size:13px;">
    <div id ="divwatmar" class="watermark" runat ="server" >Supplementary</div>
   
    <div style ="position :absolute ; top:30px; left :5px;">
   <img src="../Images/logo.png" width='140' height='50' alt="" />
   </div>
    <div style="font-family:Arial;"> 
   <center>
          <font style="font-size:medium"><b><u> DIAMOND SHIPPING AGENCIES PVT LTD </u></b></font><br /><br />
        A-4 World Trade Avenue,<br />
        Harbour Estate,<br />
         Tuticorin - 628005.   <br />
         <br />
         <br />

       <font style="font-size:16px"><b>Cash Payment Voucher 
         </b></font>
       <b></b>
    </center>
    </div>
 <table id="Table1" width ="100%" style ='border: 1px solid black;' runat="server">
     <tr style ='border: 1px solid black;'>
			<td style="font-size:small"><font style="font-weight :bold ;">Employee Name </font>:<asp:Label ID="empname1" runat="server"  Text="Label"></asp:Label> </td>
			<td align="right" style="font-size:small"><font style="font-weight :bold ">Voucher No </font><asp:Label ID="voucherno" runat="server"  Text="Label"></asp:Label></td>
		</tr>
        <tr style ='border: 1px solid black;'>
			<td style="font-size:small">:<asp:Label ID="voctype" runat="server"  Text="Label"></asp:Label> </td>
			<td align="right" style="font-size:small"><font style="font-weight :bold ">Voucher Date </font>: <asp:Label ID="voucherdt" runat="server"  Text="Label"></asp:Label></td>
		</tr>
     </table>
    <br />
    <asp:GridView ID="gvvoucher" runat="server" AutoGenerateColumns="false" Font-Size="12px" Width="100%">
    <Columns>
        <asp:BoundField HeaderStyle-Width="30px" DataField="SNo" HeaderText="S No " />
        <asp:BoundField HeaderStyle-Width="350px" DataField="Description" HeaderText="Description" />
       <asp:BoundField HeaderStyle-Width="100px" DataField="Amt" HeaderText="Amount" />
    </Columns>
</asp:GridView>
    
     <br />
<%--<b style ="text-align :left ;">Amount In Words: &nbsp; &nbsp;<asp:Label ID="lblnumwords" runat ="server" /></b>
<div style ="text-align :right ;"><b>Total Amount:</b> &nbsp; &nbsp;<asp:Label ID="lbltotamt" runat ="server" /></div>--%>

        <table id="Table3" width ="100%" style ='border:none;' runat="server" class="Authorised1">
     <tr style ='border: none;'>
			<td style="text-align:left;"><font style="font-weight :bold ;">Amount In Words: &nbsp; &nbsp;<asp:Label ID="lblnumwords" runat ="server" /> </font> </td>
			<td style="text-align:right;"><font style="font-weight :bold ;"><b>Total Amount:</b> &nbsp; &nbsp;<asp:Label ID="lbltotamt" runat ="server" /> </font> </td>
     
		</tr>
        
     </table>
        <br />
        <br />
        <br />
        <br />
        <br />

<table id="Table2" width ="100%" style ='border:none;' runat="server" class="Authorised">
     <tr style ='border: none;'>
			<td style="text-align:center;"><font style="font-weight :bold ;">Entered by </font> </td>
			<td style="text-align:center;"><font style="font-weight :bold ;">Section Inchrge  </font> </td>
            <td style="text-align:center;"><font style="font-weight :bold ;"> Accounts </font> </td>
            <td style="text-align:center;"><font style="font-weight :bold ;">MD/JMD</font> </td>
            <td style="text-align:center;"><font style="font-weight :bold ;">Received by </font> </td>
		</tr>
        
     </table>
   
 </div>
        
    </form>
</body>
</html>
