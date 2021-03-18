Public Class HeavyBlockListReport
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim vesselname, portname As String
        Dim cw1, cw2, cw3 As Double
        vesselname = Request.QueryString("vesname1")
        portname = Request.QueryString("portname1")
        cw1 = Request.QueryString("cranewt1")
        cw2 = Request.QueryString("cranewt2")
        cw3 = Request.QueryString("cranewt3")
        'craneweight = Request.Form("craneweight2")
        Dim entrydate As String = obj.ConvDtFrmt(Now, "yyyy-MM-dd")
        Me.vesselname.Text = vesselname
        'Me.cranewt.Text = craneweight
        Me.docdate.Text = obj.ConvDtFrmt(entrydate, "dd/MM/yyyy")
        Dim getdatawtdtls As New List(Of String)
        getdatawtdtls = obj.GetMoreValueFromQuery("select crane_wt_bup1 ,crane_wt_bup2,crane_wt_bup3  from granite_vessel_master where vessel_name ='" + vesselname + "'", 3)
        Dim c1, c2, c3 As Double
        c1 = getdatawtdtls(0)
        c2 = getdatawtdtls(1)
        c3 = getdatawtdtls(2)
        'Me.cranewt.Text = c1                                          
        'Me.cranewt1.Text = c2
        If cw1 = c1 And cw2 = c2 And cw3 = c3 Then
            Dim dd As New DataTable
            dd = obj.getdatatable("select a.bl_number,a.packing_marks,a.no_of_pcs,a.hatch_nbr,b.weightMT,b.blocknumber from granite_packinglistheader a,granite_packinglistdetails b where" & _
              "  a.Refno =b.Refno and a.packing_vesselname='" + vesselname + "' and a.packing_portname='" + portname + "'")
            gvDetails.DataSource = dd
            gvDetails.DataBind()
            'ElseIf cw1 = c1 And cw2 = c2 And cw3 = c3 Then
            '    Dim dd As New DataTable
            '    dd = obj.getdatatable("select a.bl_number,a.packing_marks,a.no_of_pcs,a.hatch_nbr,b.weightMT,b.blocknumber from granite_packinglistheader a,granite_packinglistdetails b where a.Refno =b.Refno" & _
            '      " and a.packing_vesselname='" + vesselname + "' and a.packing_portname='" + portname + "'")
            '    gvDetails.DataSource = dd
            '    gvDetails.DataBind()
        End If

    End Sub

End Class