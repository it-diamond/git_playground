<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Repcoveringletter.aspx.vb" Inherits="CnfGranite.Repcoringletter" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Granite Covering Letter</title>
      <link rel="Shortcut Icon" type="image/png" href="../Images/ic.png" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
    <style runat="server">
      .page_layout{width:210mm; height:277mm; border:none; position:absolute; top:0mm; left:0mm; font-family:Arial;font-size:14px;line-height:1.8;}
    </style>
</head>
<body >
    <form id="form1" runat="server" class="page_layout">
    <div style ="position :absolute ; top:50px; left :0px;">
   <img src="../Images/logo.png" width='120' height='30' alt="" />
   </div>
   <div style ="position :absolute ; top:50px; right :0px;">
   <img src="../Images/dnvlogo.jpg" width='120' height='50' alt="" />
   </div>
    <div style="font-family:Arial;"> 
   <center>
          <font style="font-size:medium"><b><u> DIAMOND SHIPPING AGENCIES PVT LTD </u></b></font><br />
        A-4 World Trade Avenue, Harbour Estate, Tuticorin - 628005.<br />
      Phone:0461-403 3333(6 Lines) Fax:0461-403 3311/3322 <br/>
      Web:www.diamondshipping.in&nbsp;&nbsp;&nbsp; Email:info@diamondshipping.in<br />
      CIN:U63090TN1992PTC02228<br />
    </center>
    </div>
    <hr />
    <b>Messers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dt.<asp:Label ID="docdate" runat="server"></asp:Label></b><br />
   
     <p><b><asp:Label ID="cusname" runat="server" ></asp:Label></b><br /></p>
      <p><asp:Label ID="city" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    KIND ATTENTION : <asp:Label ID="contact" runat="server" ></asp:Label></p>
    <div style ="text-align :right;"></div>
    <p style="text-align: justify; text-justify: inter-word;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><u>Vessel: M.V 
       <asp:Label ID="vesselname" runat="server" ></asp:Label></u></b>&nbsp;</p>
    <br />
    Dear Sirs,<br />
    <center></center>
    <p><asp:Label ID="content" runat="server" ></asp:Label></p>
    we are enclosing herewith the following documents for the shipment effected
    <br />
    <asp:PlaceHolder ID="format" runat="server"></asp:PlaceHolder>
       <br />
       <asp:Label ID="content1" runat="server"></asp:Label>
    Kindly acknowledge and confirm safe receipt
    <br />
    Thanking you,

         <br />
    <br />
    Yours Faithfully,<br />
    <b>Diamond Shipping Agencies Pvt.Ltd</b>
    <br />
    <br />
      <br />
    <br />
    Authorised Signatory<br />
    Enc:as above


    </form>
</body>
</html>
