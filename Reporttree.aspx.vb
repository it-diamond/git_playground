Imports System.Web.Services
Imports System.Data.SqlClient

Public Class Reporttree
    Inherits System.Web.UI.Page
    <WebMethod()>
    Public Shared Function Getvessel(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT vessel_name FROM granite_vessel_master where vessel_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("vessel_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function
    <WebMethod()>
    Public Shared Function Getport(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT port_name FROM granite_portdetails_master where port_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("port_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function
    <WebMethod()>
    Public Shared Function Getcnfparty(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT cnf_name FROM granite_cnfdetails_master where cnf_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}{1}", sdr("cnf_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function

    <WebMethod()>
    Public Shared Function GetCashVno(ByVal prefix As String) As String()
        Dim Employee As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select top 15 voucher_no + ' - ' + emp_name+ ' - ' +convert(nvarchar,voucher_date,106),voucher_no from voucher_tbl where voucher_no like '%'+@prefix+'%'  and  department='GRANITE DEPARTMENT' and voucher_type = 'SUPPLEMENTARY' and approve_flg=1  order by voucher_date desc"
                cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Employee.Add(String.Format("{0}|{1}", sdr(0), sdr(1)))

                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Employee.ToArray()
    End Function
   
    Private Sub report_Click(sender As Object, e As System.EventArgs) Handles report.Click
        Dim vesselname, portname As String
        vesselname = Request.Form("vname")
        portname = Request.Form("pname")
        Dim pageurl = "ExportReport.aspx?vesselname=" + vesselname + "&portname=" + portname
        Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    End Sub

    Private Sub tim2report_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles tim2report.Click
        Dim vesselname, portname, pageurl, partyname As String
        'Dim label1 As String
        'Dim fn2 As New CNFPartywise
        'fn2.Visible = True
        'Dim count As Integer = ListBox1.Items.Count - 1
        'ReDim fn2.listitems(count)
        'For i As Integer = 0 To count
        '    fn2.listitems(i) = ListBox1.Items(i).ToString
        'Next
        Dim listdata As New List(Of String)
        Dim data As Integer = CInt(ListBox1.Items.Count - 1)
        'CInt(ListBox1.Items.Count - 1)
        'For i As Integer = 0 To ListBox1.SelectedItems.Count - 1
        For i As Integer = 0 To data
            ListBox1.SelectedIndex = i
            listdata.Add(ListBox1.Text)

        Next
        For i As Integer = 0 To listdata.Count - 1
            partyname = listdata(i)
            vesselname = Request.Form("vesname")
            portname = Request.Form("portname")
            partyname = Request.Form("ListBox1")
            pageurl = "CNFPartywiseReport.aspx?vesname=" + vesselname + "&portname=" + portname + "&partyname=" + listdata(i)

            Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
        Next

    End Sub

    Private Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim vouno As String
        vouno = Me.hdvnocash.Value
        Dim pageurl = "Cashvoc.aspx?vouno=" + vouno
        Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    End Sub

    Private Sub Weightwisereport_Click(sender As Object, e As System.EventArgs) Handles Weightwisereport.Click
        Dim vesselname, portname As String
        vesselname = Request.Form("vesnamewt")
        portname = Request.Form("portnamewt")
        'Cnfparty = Request.Form("cnfparty")
        Dim pageurl = "WeightwiseReport.aspx?vesname=" + vesselname + "&portname=" + portname
        Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    End Sub
    

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim vesselname, portname As String
        vesselname = Request.Form("TextBox1")
        portname = Request.Form("TextBox2")
        'Cnfparty = Request.Form("cnfparty")
        Dim pageurl = "ExportGeneralBLno.aspx?vesname1=" + vesselname + "&portname1=" + portname
        Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    End Sub

    ''Private Sub Report2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Report2.Click
    ''    Dim vesselname, portname, Cnfparty As String
    ''    vesselname = Request.Form("vesname")
    ''    portname = Request.Form("portname")
    ''    Cnfparty = Request.Form("cnfparty")
    ''    Dim pageurl = "CNFPartywiseReport.aspx?vesname=" + vesselname + "&portname=" + portname + "&cnfparty=" + Cnfparty
    ''    Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    'End Sub

    Private Sub Report1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Report1.Click
        Dim vesselname, portname, craneweight1, craneweight2, craneweight3 As String
        vesselname = Request.Form("vesname1")
        portname = Request.Form("portname1")
        craneweight1 = Request.Form("cranewt1")
        craneweight2 = Request.Form("cranewt2")
        craneweight3 = Request.Form("cranewt3")
        Dim pageurl = "HeavyBlockListReport.aspx?vesname1=" + vesselname + "&portname1=" + portname + "&cranewt1=" + craneweight1 + "&cranewt2=" + craneweight2 + "&cranewt3=" + craneweight3
        Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")
    End Sub

    Private Sub button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles button5.Click
        ListBox1.Items.Add(cnfparty.Text.Trim())
        cnfparty.Text = ""
        cnfparty.Focus()

    End Sub

    Private Sub cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cancel.Click
        vname.Text = ""
        pname.Text = ""
    End Sub

    Private Sub tim2cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles tim2cancel.Click
        vesname.Text = ""
        portname.Text = ""
        'ListBox1.Items.RemoveAt(ListBox1.SelectedIndex())
        ListBox1.Items.Clear()

        cnfparty.Text = ""
    End Sub

    Private Sub Cancel1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel1.Click
        vesname1.Text = ""
        portname1.Text = ""
        cranewt1.Text = ""
        cranewt3.Text = ""
        cranewt2.Text = ""

    End Sub

    Private Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        TextBox1.Text = ""
        TextBox2.Text = ""

    End Sub

    Private Sub Weightwisecancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Weightwisecancel.Click
        vesnamewt.Text = ""
        portnamewt.Text = ""
    End Sub
End Class