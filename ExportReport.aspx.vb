
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.UI.Control
Imports System.Web.UI.WebControls.DataControlFieldCell
Imports System.Data.DataTable


Public Class ExportReport
    Inherits System.Web.UI.Page
    Private grdTotal As Decimal = 0
    Private grdTotal1 As Decimal = 0
    Private grdTotal2 As Decimal = 0
    Dim obj As New ObjClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim vesselname, portname As String
        vesselname = Request.QueryString("vesselname")
        portname = Request.QueryString("portname")
        Me.vesselname.Text = "<b> MANIFEST GOODS EXPORTED PER " + vesselname + " OF 4644 TONS,UNDER COMMAND OF CAPT.LEU CHANG FU SAILED FROM  TUTICORIN ON " + Today + "  " + portname + " </b> "
        Dim dd As New DataTable
        dd = obj.getdatatable("select distinct b.sb_date,b.sb_no,b.packing_marks,count(a.blocknumber)as blocknumber," & _
"b.packing_description,b.packing_shippername,b.packing_consigneename," & _
"sum(convert(float,a.volumeofCBT))as VolumeofCBT, sum(convert (float,a.weightMT))as WeightMT  from granite_packinglistdetails a," & _
"granite_packinglistheader b where a.Refno =b.Refno and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'" & _
"group by a.Refno,b.sb_date,b.packing_marks,b.sb_no,b.packing_description,b.packing_shippername,b.packing_consigneename")
        gvDetails.DataSource = dd
        gvDetails.DataBind()

        gvDetails.FooterRow.Cells(0).Text = "Total"
        gvDetails.FooterRow.Cells(0).HorizontalAlign = HorizontalAlign.Right

        'Dim total As Double = 0
        'For i As Integer = 0 To gvDetails.Rows.Count - 1
        '    '    'For i As Integer = 0 To gvDetails.RowCount - 1
        '    total += Double.TryParse(gvDetails.Rows(i).Cells(6).Text, total)
        '    'total += Convert.ToInt32(gvDetails.Rows(i).Cells(3).Text)
        'Next
        'gvDetails.FooterRow.Cells(6).Text = total.ToString
        'gvDetails.FooterRow.Cells(6).Text = Math.Round(total, 0).ToString()
        'gvDetails.FooterRow.Cells(7).Text = Math.Round(total, 0).ToString()
        gvDetails.FooterRow.Cells(2).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(6).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(7).HorizontalAlign = HorizontalAlign.Right
        ' ''gvDetails.Rows.Add(Nothing, Nothing, "Total",total)
        'Me.Noofblocks1.Text = obj.GetOneValueFromQuery("select count(a.blocknumber)from granite_packinglistdetails a," & _
        '                     "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                      "and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'")
        'Me.cbm1.Text = obj.GetOneValueFromQuery("select sum(convert(float,a.volumeofCBT))from granite_packinglistdetails a," & _
        '                                         "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                          "and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'")

        'Me.weight1.Text = obj.GetOneValueFromQuery("select sum(convert(float,a.weightMT))from granite_packinglistdetails a," & _
        '                                             "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                                              "and packing_vesselname='" + vesselname + "'  and packing_portname='" + portname + "'")

        ''Me.blweight1.Text = obj.GetOneValueFromQuery("select sum(convert(float,b.tot_bl_wt))from granite_packinglistdetails a," & _
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

    Private Sub gvDetails_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvDetails.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim rowTotal As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "blocknumber"))
            Dim rowTotal1 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VolumeofCBT"))
            Dim rowTotal2 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "WeightMT"))
            grdTotal = grdTotal + rowTotal
            grdTotal1 = grdTotal1 + rowTotal1
            grdTotal2 = grdTotal2 + rowTotal2
        End If

        If e.Row.RowType = DataControlRowType.Footer Then

            Dim lbl As Label = DirectCast(e.Row.FindControl("lblTotal"), Label)

            lbl.Text = grdTotal.ToString()
            Dim lbl1 As Label = DirectCast(e.Row.FindControl("lblTotal1"), Label)

            lbl1.Text = grdTotal1.ToString()
            Dim lbl2 As Label = DirectCast(e.Row.FindControl("lblTotal2"), Label)

            lbl2.Text = grdTotal2.ToString()

        End If

    End Sub

End Class

