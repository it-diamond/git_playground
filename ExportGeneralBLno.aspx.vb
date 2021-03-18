Imports System.Data.SqlClient
Imports System.IO
Public Class ExportGeneralBLno
    Inherits System.Web.UI.Page
    Private grdTotal As Decimal = 0
    Private grdTotal1 As Decimal = 0
    Private grdTotal2 As Decimal = 0
    Private grdTotal3 As Decimal = 0
    Private grdTotal4 As Decimal = 0

    Dim obj As New ObjClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim vesselname, portname As String
        vesselname = Request.QueryString("vesname1")
        portname = Request.QueryString("portname1")
        Dim getdata = obj.GetMoreValueFromQuery("select arrival_date,berth_date,saildate from granite_vessel_master where vessel_name='" + vesselname + "'", 3)
        Me.Label1.Text = getdata(0)
        Me.Label2.Text = getdata(1)
        Me.Label3.Text = getdata(2)
        Me.vesselname2.Text = vesselname
        Me.portname2.Text = portname
        Dim dd As New DataTable
        dd = obj.getdatatable("select distinct b.bl_number, Convert(varchar(10),CONVERT(date,b.bl_date,106),103) as bl_date,b.packing_marks,count(a.blocknumber)as blocknumber," & _
   "b.packing_description,b.packing_shippername,b.packing_consigneename," & _
   "sum(convert(float,a.volumeofCBT))as VolumeofCBT,sum(convert(float,a.weightMT))as WeightMT,sum(convert(float,b.tot_bl_wt))as tot_bl_wt,sum(convert(float,b.freight))as freight  from granite_packinglistdetails a," & _
   "granite_packinglistheader b where a.Refno =b.Refno and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'" & _
   "group  by a.Refno,b.bl_date,b.packing_marks,b.bl_number,b.packing_description,b.packing_shippername, b.packing_consigneename, b.bl_number,b.tot_bl_wt")
        gvDetails.DataSource = dd
        gvDetails.DataBind()

        gvDetails.FooterRow.Cells(0).Text = "Total"
        gvDetails.FooterRow.Cells(0).HorizontalAlign = HorizontalAlign.Right

        'Dim total As Double = 0
        'For i As Integer = 0 To gvDetails.Rows.Count - 1
        '    '    'For i As Integer = 0 To gvDetails.RowCount - 1,l
        '    total += Double.TryParse(gvDetails.Rows(i).Cells(6).Text, total)
        '    total += Double.TryParse(gvDetails.Rows(i).Cells(7).Text, total)
        '    total += Double.TryParse(gvDetails.Rows(i).Cells(8).Text, total)
        '    total += Double.TryParse(gvDetails.Rows(i).Cells(9).Text, total)
        '    'total += Convert.ToInt32(gvDetails.Rows(i).Cells(3).Text)
        'Next
        ''gvDetails.FooterRow.Cells(6).Text = total.ToString
        'gvDetails.FooterRow.Cells(6).Text = Math.Round(total, 0).ToString()
        'gvDetails.FooterRow.Cells(7).Text = Math.Round(total, 0).ToString()
        'gvDetails.FooterRow.Cells(8).Text = Math.Round(total, 0).ToString()
        'gvDetails.FooterRow.Cells(9).Text = Math.Round(total, 0).ToString()
        gvDetails.FooterRow.Cells(2).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(6).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(7).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(8).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(9).HorizontalAlign = HorizontalAlign.Right


        'Me.Noofblocks.Text = obj.GetOneValueFromQuery("select count(a.blocknumber)from granite_packinglistdetails a," & _
        '                      "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                       "and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'")

        'Me.cbm.Text = obj.GetOneValueFromQuery("select sum(convert(float,a.volumeofCBT))from granite_packinglistdetails a," & _
        '                                          "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                           "and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'")

        'Me.weight.Text = obj.GetOneValueFromQuery("select sum(convert(float,a.weightMT))from granite_packinglistdetails a," & _
        '                                             "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                              "and packing_vesselname='" + vesselname + "'  and packing_portname='" + portname + "'")

        'Me.blweight.Text = obj.GetOneValueFromQuery("select sum(convert(float,b.tot_bl_wt))from granite_packinglistdetails a," & _
        '                                             "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                              "and packing_vesselname='" + vesselname + "'and packing_portname='" + portname + "'")
        'Me.Lblfright.Text = obj.GetOneValueFromQuery("select sum(convert(float,b.freight))from granite_packinglistdetails a," & _
        '                                             "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                              "and packing_vesselname='" + vesselname + "'and packing_portname='" + portname + "'")


    End Sub
    Sub exporttoexcel()
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=ArrivalDtls.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            div1.RenderControl(hw)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()
        End Using
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

    Private Sub export_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles export.Click
        exporttoexcel()
    End Sub

    Private Sub gvDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDetails.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim rowTotal As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "blocknumber"))
            Dim rowTotal1 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VolumeofCBT"))
            Dim rowTotal2 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "WeightMT"))
            Dim rowTotal3 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "tot_bl_wt"))
            Dim rowTotal4 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "freight"))
            grdTotal = grdTotal + rowTotal
            grdTotal1 = grdTotal1 + rowTotal1
            grdTotal2 = grdTotal2 + rowTotal2
            grdTotal3 = grdTotal3 + rowTotal3
            grdTotal4 = grdTotal4 + rowTotal4
        End If


        If e.Row.RowType = DataControlRowType.Footer Then

            Dim lbl As Label = DirectCast(e.Row.FindControl("lblTotal"), Label)

            lbl.Text = grdTotal.ToString()
            Dim lbl1 As Label = DirectCast(e.Row.FindControl("lblTotal1"), Label)

            lbl1.Text = grdTotal1.ToString()
            Dim lbl2 As Label = DirectCast(e.Row.FindControl("lblTotal2"), Label)

            lbl2.Text = grdTotal2.ToString()

            Dim lbl3 As Label = DirectCast(e.Row.FindControl("lblTotal3"), Label)

            lbl3.Text = grdTotal3.ToString()

            Dim lbl4 As Label = DirectCast(e.Row.FindControl("lblTotal4"), Label)

            lbl4.Text = grdTotal4.ToString()



        End If

    End Sub
End Class