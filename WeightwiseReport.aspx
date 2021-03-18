<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WeightwiseReport.aspx.vb" Inherits="CnfGranite.WeightwiseReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div id="div1" runat="server" style="width :100%; margin-right: 182px;">
    <table style="width:120%;">
    <tr>
    <td colspan="2">
    <center><font size="3"><b>DIAMOND SHIPPING AGENCIES P.LTD</b></font></center>
    </td>
    </tr>
    <tr>
    <td style ="width :40%">
    <p align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WEIGHTWISE 
        REPORT</b></p>
    </td>
    <td style ="width :30%">
    <p align="center"> <asp:Label ID="lbldt" runat="server"></asp:Label></p>
    </td>
    </tr>
    <tr>
    <td style ="width :40%">
        <p>VESSEL NAME:</p>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <p>PORT OF DESTINATION:</p>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    </td>
    <td style ="width :30%">
        <p align="center">&nbsp;</p>
    </td>
    </tr>
    </table>
       <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False"  EmptyDataText="No Data Found"
AllowSorting="true"  Width ="100%" CssClass="GridviewDiv"  ShowFooter="true" >
<HeaderStyle  />
<Columns >
<asp:TemplateField HeaderText="S No" >
<ItemTemplate>
<asp:Label ID="lblshipno" Text='<%#Eval("sno") %>' runat="server"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Shipper">
<ItemTemplate>
<asp:Label ID="lblshipno" Text='<%#Eval("shippername") %>' runat="server"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Mark" >
<ItemTemplate>
<asp:Label ID="lblmark" Text='<%# Eval("marks") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="No Of Blocks">
<ItemTemplate>
<asp:Label ID="lblblocks" Text='<%# Eval("blockwt").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal1" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Total Wt">
<ItemTemplate>
<asp:Label ID="lblgoods" Text='<%# Eval("totalcbm").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal2" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Wt1" >
<ItemTemplate>
<asp:Label ID="lblshippername" Text='<%# Eval("wt1").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal3" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField> 
<asp:TemplateField HeaderText="CBM1" >
<ItemTemplate>
<asp:Label ID="lblConsignee" Text='<%# Eval("cbm1").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal4" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Wt2">
<ItemTemplate>
<asp:Label ID="cpm" Text='<%# Eval("wt2").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal5" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
 <asp:TemplateField HeaderText="CBM2" >
<ItemTemplate>
<asp:Label ID="crossweight" Text='<%# Eval("cbm2").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal6" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Wt3" >
<ItemTemplate>
<asp:Label ID="cpm" Text='<%# Eval("wt3").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal7" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="CBM3" >
<ItemTemplate>
<asp:Label ID="cpm" Text='<%# Eval("cbm3").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal8" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Wt4">
<ItemTemplate>
<asp:Label ID="cpm" Text='<%# Eval("wt4").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal9" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="CBM4" >
<ItemTemplate>
<asp:Label ID="cpm" Text='<%# Eval("cbm4").ToString %>' runat="server" ItemStyle-HorizontalAlign="Right"/>
</ItemTemplate>
<FooterTemplate>
     <asp:Label ID="lblTotal10" runat="server"></asp:Label>
     </FooterTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
<asp:ImageButton ID="export" Text="Export To Excel" runat ="server" 
        ImageUrl ="~/Images/Excelicon.png" Height="32px" Width="50px" />
        
   <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Label ID="Noofblocks1" runat="server" Text=""></asp:Label>--%>
        
    </form>
</body>
</html>
