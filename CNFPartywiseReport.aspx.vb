Imports System.Data.SqlClient
Imports System.IO

Public Class CNFPartywise
    Inherits System.Web.UI.Page
    'Public listitems As String()
    Private grdTotal As Decimal = 0
    Private grdTotal1 As Decimal = 0
    Private grdTotal2 As Decimal = 0
    'Private grdTotal3 As Decimal = 0
    'Private grdTotal4 As Decimal = 0

    Dim obj As New ObjClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim vesselname, portname, CNFparty As String
        vesselname = Request.QueryString("vesname")
        portname = Request.QueryString("portname")
        CNFparty = Request.QueryString("partyname")

        Me.Label2.Text = vesselname
        Me.Label3.Text = portname

        '1. Get the party name as list ['Diamond','Hari','Sri Jeyam']
        '2. Pass the party name into the for loop
        '3. Pass the datatable to bind gridview
        'Dim cnfparty As New List(Of String)
        Dim dd As New DataTable
        Dim query
        'For i = 0 To CNFparty.Count - 1
        query = "select distinct b.packing_cnfagent,b.packing_shippername,b.packing_marks,sum(convert(float, a.blocknumber))as blocknumber," & _
                "sum(convert(float,a.volumeofCBT))as VolumeofCBT,sum(convert (float,a.weightMT))as WeightMT  from granite_packinglistdetails a," & _
                "granite_packinglistheader b where a.Refno =b.Refno and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "' and packing_cnfagent='" + CNFparty + "' " & _
                "group  by b.packing_shippername,b.packing_marks,b.packing_cnfagent"
        dd = obj.getdatatable(query)
        gvDetails.DataSource = dd
        gvDetails.DataBind()

        'Next
        gvDetails.FooterRow.Cells(0).Text = "Total"
        gvDetails.FooterRow.Cells(0).HorizontalAlign = HorizontalAlign.Right

        gvDetails.FooterRow.Cells(4).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(5).HorizontalAlign = HorizontalAlign.Right
        gvDetails.FooterRow.Cells(6).HorizontalAlign = HorizontalAlign.Right
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

    Protected Sub export_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles export.Click
        exporttoexcel()
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

    Private Sub gvDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDetails.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim rowTotal As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "blocknumber"))
            Dim rowTotal1 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VolumeofCBT"))
            Dim rowTotal2 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "WeightMT"))
            grdTotal = grdTotal + rowTotal
            grdTotal1 = grdTotal1 + rowTotal1
            grdTotal2 = grdTotal2 + rowTotal2
        End If

        If e.Row.RowType = DataControlRowType.Footer Then

            Dim lbl As Label = DirectCast(e.Row.FindControl("lblTotal1"), Label)

            lbl.Text = grdTotal.ToString()
            Dim lbl1 As Label = DirectCast(e.Row.FindControl("lblTotal2"), Label)

            lbl1.Text = grdTotal1.ToString()
            Dim lbl2 As Label = DirectCast(e.Row.FindControl("lblTotal3"), Label)

            lbl2.Text = grdTotal2.ToString()
        End If
    End Sub
End Class
