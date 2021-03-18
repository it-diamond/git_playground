Public Class WeightwiseReport
    Inherits System.Web.UI.Page
    Private grdTotal As Decimal = 0
    Private grdTotal1 As Decimal = 0
    Private grdTotal2 As Decimal = 0
    Private grdTotal3 As Decimal = 0
    Private grdTotal4 As Decimal = 0
    Private grdTotal5 As Decimal = 0
    Private grdTotal6 As Decimal = 0
    Private grdTotal7 As Decimal = 0
    Private grdTotal8 As Decimal = 0
    Private grdTotal9 As Decimal = 0
    Dim obj As New ObjClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim vesselname As String = Request.QueryString("vesname")
        Dim portname As String = Request.QueryString("portname")
        Me.Label2.Text = vesselname
        Me.Label3.Text = portname
        Dim getdatawtdtls As New List(Of String)
        getdatawtdtls = obj.GetMoreValueFromQuery("select crane_wt_bup1 ,crane_wt_bup2 ,crane_wt_bup3  from granite_vessel_master where vessel_name ='" + vesselname + "'", 3)
        Dim c1, c2, c3 As Double
        c1 = getdatawtdtls(0)
        c2 = getdatawtdtls(1)
        c3 = getdatawtdtls(2)
        Dim dd As New DataTable
        dd = obj.getdatatable("select distinct b.packing_shippername,b.packing_marks,count(a.blocknumber)as blocknumber " & _
",sum(convert (float,a.weightMT))as WeightMT ,a.Refno " & _
" from granite_packinglistdetails a, " & _
" granite_packinglistheader b where a.Refno =b.Refno  " & _
" and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "' " & _
" group  by b.packing_marks,b.packing_shippername,a.Refno")
        Dim table As New DataTable
        ' Create four typed columns in the DataTable.
        table.Columns.AddRange(New DataColumn() {New DataColumn("sno", GetType(String)), _
                                              New DataColumn("shippername", GetType(String)), _
                                              New DataColumn("marks", GetType(String)), _
                                                   New DataColumn("blockwt", GetType(String)), _
                                                        New DataColumn("totalcbm", GetType(String)), _
                                                  New DataColumn("wt1", GetType(String)), _
                                                  New DataColumn("cbm1", GetType(String)), _
                                                  New DataColumn("wt2", GetType(String)), _
                                                  New DataColumn("cbm2", GetType(String)), _
                                                  New DataColumn("wt3", GetType(String)), _
                                                   New DataColumn("cbm3", GetType(String)), _
                                                  New DataColumn("wt4", GetType(String)), _
                                                  New DataColumn("cbm4", GetType(String))})

        Dim typeg As Integer = 0
        If c1 <> 0 And c2 = 0 And c3 = 0 Then
         
            Dim wt1, wt2, wt3, wt4, cbm1, cbm2, cbm3, cbm4 As Double
            Dim listwt As New List(Of Double)

            For i = 0 To dd.Rows.Count - 1
                listwt = getwt(dd.Rows(i).Item(4).ToString, c1, c2, c3, 1)
                wt1 = listwt(0)
                cbm1 = listwt(1)
                wt2 = listwt(2)
                cbm2 = listwt(3)
                wt3 = listwt(4)
                cbm3 = listwt(5)
                wt4 = listwt(6)
                cbm4 = listwt(7)
                table.Rows.Add(i + 1, Server.HtmlDecode(dd.Rows(i).Item(0).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(1).ToString),
                              Server.HtmlDecode(dd.Rows(i).Item(2).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(3).ToString), wt1, cbm1, wt2, cbm2, wt3, cbm3, wt4, cbm4)

            Next
            typeg = 1

        ElseIf c1 <> 0 And c2 <> 0 And c3 = 0 Then
            Dim wt1, wt2, wt3, wt4, cbm1, cbm2, cbm3, cbm4 As Double
            Dim listwt As New List(Of Double)

            For i = 0 To dd.Rows.Count - 1
                listwt = getwt(dd.Rows(i).Item(4).ToString, c1, c2, c3, 2)
                wt1 = listwt(0)
                cbm1 = listwt(1)
                wt2 = listwt(2)
                cbm2 = listwt(3)
                wt3 = listwt(4)
                cbm3 = listwt(5)
                wt4 = listwt(6)
                cbm4 = listwt(7)
                table.Rows.Add(i + 1, Server.HtmlDecode(dd.Rows(i).Item(0).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(1).ToString),
                              Server.HtmlDecode(dd.Rows(i).Item(2).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(3).ToString), wt1, cbm1, wt2, cbm2, wt3, cbm3, wt4, cbm4)

            Next
            typeg = 2
        Else
            Dim wt1, wt2, wt3, wt4, cbm1, cbm2, cbm3, cbm4 As Double
            Dim listwt As New List(Of Double)

            For i = 0 To dd.Rows.Count - 1
                listwt = getwt(dd.Rows(i).Item(4).ToString, c1, c2, c3, 3)
                wt1 = listwt(0)
                cbm1 = listwt(1)
                wt2 = listwt(2)
                cbm2 = listwt(3)
                wt3 = listwt(4)
                cbm3 = listwt(5)
                wt4 = listwt(6)
                cbm4 = listwt(7)
                table.Rows.Add(i + 1, Server.HtmlDecode(dd.Rows(i).Item(0).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(1).ToString),
                              Server.HtmlDecode(dd.Rows(i).Item(2).ToString),
                               Server.HtmlDecode(dd.Rows(i).Item(3).ToString), wt1, cbm1, wt2, cbm2, wt3, cbm3, wt4, cbm4)

            Next
            typeg = 3
        End If

        gvDetails.DataSource = table
        gvDetails.DataBind()
        gvDetails.HeaderRow.Cells(5).Text = "Below " & c1 & " Blocks"
        gvDetails.HeaderRow.Cells(6).Text = "Below " & c1 & " Weight"
        gvDetails.FooterRow.Cells(1).Text = "Total"
        gvDetails.FooterRow.Cells(1).HorizontalAlign = HorizontalAlign.Right
        ''gvDetails.FooterRow.Cells(2).Text = grandTotal.ToString("N2")
       
        If typeg = 1 Then
            gvDetails.HeaderRow.Cells(7).Text = "Above " & c1 & " Blocks"
            gvDetails.HeaderRow.Cells(8).Text = "Above " & c1 & " Weight"
            gvDetails.Columns(9).Visible = False
            gvDetails.Columns(10).Visible = False
            gvDetails.Columns(11).Visible = False
            gvDetails.Columns(12).Visible = False

        End If
        If typeg = 2 Then
            gvDetails.HeaderRow.Cells(7).Text = "Below " & c1 & " Above " & c2 & " Blocks"
            gvDetails.HeaderRow.Cells(8).Text = "Below " & c1 & " Above " & c2 & " Weight"
            gvDetails.HeaderRow.Cells(9).Text = "Above " & c2 & " Blocks"
            gvDetails.HeaderRow.Cells(10).Text = "Above " & c2 & " Weight"
            gvDetails.Columns(11).Visible = False
            gvDetails.Columns(12).Visible = False
        End If
        If typeg = 3 Then
            gvDetails.HeaderRow.Cells(7).Text = "Below " & c1 & " Above " & c2 & " Blocks"
            gvDetails.HeaderRow.Cells(8).Text = "Below " & c1 & " Above " & c2 & " Weight"
            gvDetails.HeaderRow.Cells(9).Text = "Below " & c2 & " Above " & c3 & " Blocks"
            gvDetails.HeaderRow.Cells(10).Text = "Below " & c2 & " Above " & c3 & " Weight"
            gvDetails.HeaderRow.Cells(11).Text = "Above " & c3 & " Blocks"
            gvDetails.HeaderRow.Cells(12).Text = "Above " & c3 & " Weight"
            'gvDetails.FooterRow.Cells(7).Text = "Grand Total"
            'gvDetails.FooterRow.Cells(8).Text = "Grand Total"
            'gvDetails.FooterRow.Cells(9).Text = "Grand Total"
            'gvDetails.FooterRow.Cells(10).Text = "Grand Total"
            'gvDetails.FooterRow.Cells(11).Text = "Grand Total"
            'gvDetails.FooterRow.Cells(12).Text = "Grand Total"


        End If
        'Me.Noofblocks1.Text = obj.GetOneValueFromQuery("select count(a.blocknumber)from granite_packinglistdetails a," & _
        '                    "granite_packinglistheader b where a.Refno =b.Refno " & _
        '                     "and packing_vesselname='" + vesselname + "' and packing_portname='" + portname + "'")

    End Sub

    Private Function getwt(refno As String, c1 As Double, c2 As Double, c3 As Double, typeg As Integer) As List(Of Double)
        Dim listdata As New List(Of String)
        Dim listresult As New List(Of Double)
        listdata = obj.getcolumndatafromquery("select weightMT from granite_packinglistdetails where Refno ='" + refno + "'")
        Dim w1, w2, w3, w4, cb1, cb2, cb3, cb4 As Double
        w1 = 0
        w2 = 0
        w3 = 0
        w4 = 0
        cb1 = 0
        cb2 = 0
        cb3 = 0
        cb4 = 0
        If typeg = 1 Then
            For i = 0 To listdata.Count - 1
                If c1 >= CDbl(listdata(i)) Then
                    w1 = w1 + 1
                    cb1 = cb1 + CDbl(listdata(i))
                End If
                If c1 < CDbl(listdata(i)) Then
                    w2 = w2 + 1
                    cb2 = cb2 + CDbl(listdata(i))
                End If
            Next
        End If
        If typeg = 2 Then
            For i = 0 To listdata.Count - 1
                If c1 >= CDbl(listdata(i)) Then
                    w1 = w1 + 1
                    cb1 = cb1 + CDbl(listdata(i))
                End If
                If c1 < CDbl(listdata(i)) And CDbl(listdata(i)) <= c2 Then
                    w2 = w2 + 1
                    cb2 = cb2 + CDbl(listdata(i))
                End If
                If c2 < CDbl(listdata(i)) Then
                    w3 = w3 + 1
                    cb3 = cb3 + CDbl(listdata(i))
                End If
            Next
        End If
        If typeg = 3 Then
            For i = 0 To listdata.Count - 1
                If c1 >= CDbl(listdata(i)) Then
                    w1 = w1 + 1
                    cb1 = cb1 + CDbl(listdata(i))
                End If
                If c1 < CDbl(listdata(i)) And CDbl(listdata(i)) <= c2 Then
                    w2 = w2 + 1
                    cb2 = cb2 + CDbl(listdata(i))
                End If
                If c2 < CDbl(listdata(i)) And CDbl(listdata(i)) <= c3 Then
                    w3 = w3 + 1
                    cb3 = cb3 + CDbl(listdata(i))
                End If
                If c3 < CDbl(listdata(i)) Then
                    w4 = w4 + 1
                    cb4 = cb4 + CDbl(listdata(i))
                End If
            Next
        End If

        listresult.Add(w1)
        listresult.Add(cb1)
        listresult.Add(w2)
        listresult.Add(cb2)
        listresult.Add(w3)
        listresult.Add(cb3)
        listresult.Add(w4)
        listresult.Add(cb4)

        Return listresult

    End Function

    Private Sub gvDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDetails.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim rowTotal As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "blockwt"))
            Dim rowTotal1 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "totalcbm"))
            Dim rowTotal2 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "wt1"))
            Dim rowTotal3 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "cbm1"))
            Dim rowTotal4 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "wt2"))

            Dim rowTotal5 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "cbm2"))
            Dim rowTotal6 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "wt3"))
            Dim rowTotal7 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "cbm3"))
            Dim rowTotal8 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "wt4"))
            Dim rowTotal9 As Decimal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "cbm4"))

            grdTotal = grdTotal + rowTotal
            grdTotal1 = grdTotal1 + rowTotal1
            grdTotal2 = grdTotal2 + rowTotal2
            grdTotal3 = grdTotal3 + rowTotal3
            grdTotal4 = grdTotal4 + rowTotal4
            grdTotal5 = grdTotal5 + rowTotal5
            grdTotal6 = grdTotal6 + rowTotal6
            grdTotal7 = grdTotal7 + rowTotal7
            grdTotal8 = grdTotal8 + rowTotal8
            grdTotal9 = grdTotal9 + rowTotal9

        End If

        If e.Row.RowType = DataControlRowType.Footer Then

            Dim lbl As Label = DirectCast(e.Row.FindControl("lblTotal1"), Label)

            lbl.Text = grdTotal.ToString()
            Dim lbl1 As Label = DirectCast(e.Row.FindControl("lblTotal2"), Label)

            lbl1.Text = grdTotal1.ToString()
            Dim lbl2 As Label = DirectCast(e.Row.FindControl("lblTotal3"), Label)

            lbl2.Text = grdTotal2.ToString()

            Dim lbl3 As Label = DirectCast(e.Row.FindControl("lblTotal4"), Label)

            lbl3.Text = grdTotal3.ToString()

            Dim lbl4 As Label = DirectCast(e.Row.FindControl("lblTotal5"), Label)

            lbl4.Text = grdTotal4.ToString()

            Dim lbl5 As Label = DirectCast(e.Row.FindControl("lblTotal6"), Label)

            lbl5.Text = grdTotal5.ToString()

            Dim lbl6 As Label = DirectCast(e.Row.FindControl("lblTotal7"), Label)

            lbl6.Text = grdTotal6.ToString()
            Dim lbl7 As Label = DirectCast(e.Row.FindControl("lblTotal8"), Label)

            lbl7.Text = grdTotal7.ToString()
            Dim lbl8 As Label = DirectCast(e.Row.FindControl("lblTotal9"), Label)

            lbl8.Text = grdTotal8.ToString()

            Dim lbl9 As Label = DirectCast(e.Row.FindControl("lblTotal10"), Label)

            lbl9.Text = grdTotal9.ToString()
        End If
    End Sub


    Protected Sub gvDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gvDetails.SelectedIndexChanged

    End Sub
End Class