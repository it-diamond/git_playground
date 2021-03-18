<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HeavyBlockListReport.aspx.vb" Inherits="CnfGranite.HeavyBlockListReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 45%;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div id="div1" runat="server" style="width :100%; margin-right: 182px;">
    <table style="width:120%;">
    <tr>
    <td colspan="2">
    <center><font size="3"><b>DIAMOND SHIPPING AGENCIES P.LTD.,-TUTICORN</b></font></center>
    </td>
    </tr>
    <tr>
    <td class="style1">
    <p align="center" style="width: 806px"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPORT GENERAL MANIFEST</b></p>
    </td>
    <td style ="width :30%">
    <p align="center"> &nbsp;</p>
    </td>
    </tr>
    <tr>
    <td class="style1">
       <center><b><asp:Label ID="cranewt1" runat="server"></asp:Label> HEAVY BLOCKS OVER <asp:Label ID="cranewt" runat="server"></asp:Label> <asp:Label ID="vesselname" runat="server" Text=""></asp:Label>-TUTICORIN <asp:Label ID="docdate" runat="server"></asp:Label></b></center>
    </td>
    <td style ="width :30%">
    <p align="center">&nbsp;</p>
        <p align="center">&nbsp;</p>
    </td>
    </tr>
    </table>
       <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False"  EmptyDataText="No Data Found"
AllowSorting="true"  Width ="100%" CssClass="GridviewDiv" >
<HeaderStyle />
<Columns>
<asp:TemplateField HeaderText="SI Number">
    <ItemTemplate>
        <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="B/L NBR" >
<ItemTemplate>
<asp:Label ID="lblshipno" Text='<%#Eval("bl_number") %>' runat="server"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="MARKS" >
<ItemTemplate>
<asp:Label ID="lblmark" Text='<%# Eval("packing_marks") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PCS" >
<ItemTemplate>
<asp:Label ID="lblblocks" Text='<%# Eval("no_of_pcs") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="WT" >
<ItemTemplate>
<asp:Label ID="lblgoods" Text='<%# Eval("weightMT") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="BLOCK " >
<ItemTemplate>
<asp:Label ID="lblshippername" Text='<%# Eval("blocknumber") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField> 
<asp:TemplateField HeaderText="HATCH NBR" >
<ItemTemplate>
<asp:Label ID="lblConsignee" Text='<%# Eval("hatch_nbr") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
</form>
</body>

</html>
