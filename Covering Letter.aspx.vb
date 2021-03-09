Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Services

Public Class Covering_Letter
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <WebMethod()>
    Public Shared Function Getvessel(ByVal prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT packing_vesselname FROM granite_packinglistheader where packing_vesselname LIKE '%'+@pre+'%' and job_completion_flag=0"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("packing_vesselname"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using

        Return Liner.ToArray()
    End Function
    <WebMethod()>
    Public Shared Function Getshipper(ByVal prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT shipper_name FROM granite_shipper_master where shipper_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("shipper_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function
    <WebMethod()>
    Public Shared Function Getsbno(ByVal prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select Refno from granite_packinglistheader where Refno LIKE '%'+@pre+'%' and job_completion_flag=0"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("Refno"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function
    Private Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim SNo, Refno, covering_desc, job_desc, covering_no As String

        Dim table As New DataTable
        ' Create four typed columns in the DataTable.
        table.Columns.AddRange(New DataColumn() {New DataColumn("SNo", GetType(Integer)), _
                                              New DataColumn("coveringdesc", GetType(String)), _
                                              New DataColumn("jobdesc", GetType(String))
                                             })
        Dim SerialNum As Integer = 0
        If Me.chkinvcopy.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divinvoicecopy.InnerText, Me.invoicecopy.Text)
        End If

        If Me.chkpackinglist.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divpackinglist.InnerText, Me.packinglist.Text)
        End If
        If Me.chkexportercopy.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divexportercopy.InnerText, Me.exportercopy.Text)
        End If
        If Me.chkforwardingbill.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divforwardingbill.InnerText, Me.forwardingbill.Text)
        End If
        If Me.chkcertioforigin.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divcertioforigin.InnerText, Me.certioforigin.Text)
        End If
        If Me.chksurveyreport.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divsurveyreport.InnerText, Me.surveyreport.Text)
        End If
        If Me.chkfumigation.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divfumigation.InnerText, Me.fumigation.Text)
        End If
        If Me.chkbilloflading.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divsdfform.InnerText, Me.billladinig.Text)
        End If
        If Me.chkforwardingbill.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divforwardingbill.InnerText, Me.forwardingbill.Text)
        End If
        If Me.chkcertioforigin.Checked = True Then
            SerialNum = SerialNum + 1
            table.Rows.Add(SerialNum, Me.divcertioforigin.InnerText, Me.certioforigin.Text)
        End If

        Dim QueryList As New List(Of String)

        Dim entrydate As String = obj.ConvDtFrmt(Now, "yyyy-MM-dd")
        'If (obj.FindDuplicate("select count(*) from granite_detailtable where Refno='" + Refno + "' and entrydate='" + entrydate + "'") = 0) Then
        'Else
        '    obj.QueryExecution("delete from covering_letter where Refno='" + Refno + "' and entrydate='" + entrydate + "'")
        'End If
        Refno = obj.GetOneValueFromQuery("select Refno from granite_packinglistheader where packing_vesselname='" & vessel.Text & "'")
        covering_no = obj.GetOneValueFromQuery("select granite_covering_no from control_mast")
        Dim vessel_name = Me.vessel.Text
        Dim shipper_name = Me.shname.Text
        'Dim shipping_billno = Me.sbilno.Text
        'Dim marks = Me.marks.Text
        'Dim si_no = Me.sino.Text
        Dim courier_type = Me.couriertype.SelectedValue
        
        For i = 0 To table.Rows.Count - 1

            SNo = table.Rows(i).Item(0).ToString
            covering_desc = table.Rows(i).Item(1).ToString
            job_desc = table.Rows(i).Item(2).ToString

            QueryList.Add("insert into granite_detailtable(SNo,Refno,covering_desc,job_desc,covering_no,courier_type,entrydate)" & _
                          " values('" + SNo + "','" + Refno + "','" + covering_desc + "','" + job_desc + "','" + covering_no + "','" + courier_type + "','" + entrydate + "')")

        Next


        QueryList.Add("insert into granite_headercoveringletter(entrydate,vessel_name,covering_no,shipper_name)" & _
                          " values('" + entrydate + "','" + vessel_name + "','" + covering_no + "','" + shipper_name + "')")


        QueryList.Add("update control_mast set granite_covering_no=granite_covering_no+1")

        'QueryList.Add("update granite_packinglistheader set job_completion_flag=1 where packing_vesselname='" + vessel_name + "' ")

        'QueryList.Add("update granite_vessel_master set job_completion_flag=1 where vessel_name='" + vessel_name + "' ")


        Select Case obj.TransactionInsert(QueryList)
            Case Is = True
                Dim pageurl = "../Reports/RepCoveringLetter.aspx?coverno=" + covering_no + "&entrydate=" + entrydate
                Response.Write("<script> window.open( '" + pageurl + "','_blank' ); </script>")

                Dim message As String = "Covering Letter Details  Created for " & covering_no & ""
                Dim url As String = "Covering Letter.aspx"
                Dim script As String = "window.onload = function(){ alert('"
                script += message
                script += "');"
                script += "window.location = '"
                script += url
                script += "'; }"
                ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
            Case Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Something went wrong')", True)
        End Select
    End Sub

    'Private Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Dim Refno, covering_no As String
    '    Dim msg As String
    '    Dim QueryList As New List(Of String)
    '    Dim sh_billno = Me.shippingbilno.Text
    '    Dim shp_sno = Me.sino.Text
    '    Dim entrydate As String = obj.ConvDtFrmt(Now, "yyyy-MM-dd")
    '    Refno = obj.GetOneValueFromQuery("select Refno from granite_packinglistheader where packing_vesselname='" & vessel.Text & "'")
    '    covering_no = obj.GetOneValueFromQuery("select granite_covering_no from control_mast")
    '    For i = 0 To sh_billno.Count - 1
    '        QueryList.Add("insert into granite_shippingdetail(shp_sno,Refno,entrydate,covering_no,sh_billno)" & _
    '          " values('" + shp_sno + "','" + Refno + "','" + entrydate + "','" + covering_no + "','" + sh_billno + "')")
    '        msg = "added"
    '    Next
    'End Sub

    Private Sub new_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles [new].Click
        vessel.Text = ""
        shname.Text = ""
        sbilno.Text = ""
        'marks.Text = ""
        'shippingbilno.Text = ""
        invoicecopy.Text = ""
        'shippingbilno.Text = ""
        'TextBox5.Text = ""
        packinglist.Text = ""
        exportercopy.Text = ""
        forwardingbill.Text = ""
        surveyreport.Text = ""
        fumigation.Text = ""
        billladinig.Text = ""
        certioforigin.Text = ""
        chkinvcopy.Checked = False
        chkpackinglist.Checked = False
        chkexportercopy.Checked = False
        chkforwardingbill.Checked = False
        chksurveyreport.Checked = False
        chkfumigation.Checked = False
        chkbilloflading.Checked = False
        chkcertioforigin.Checked = False
        'information.Text = ""

    End Sub

    Private Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim constr As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("select sb_no,packing_marks,sb_date from granite_packinglistheader where Refno='" & sbilno.Text & "'")
                cmd.Connection = con
                Using sda As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    GridView1.DataSource = dt
                    GridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Private Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Refno, message, sql As String
        Dim successid As Integer
        Dim QueryList As New List(Of String)
        Dim sno1 = Me.snotxt.Text
        Dim entrydate As String = obj.ConvDtFrmt(Now, "yyyy-MM-dd")
        Dim vessel_name = Me.vessel.Text
        Dim shipper_name = Me.shname.Text
        Dim covering_no = obj.GetOneValueFromQuery("select granite_covering_no from control_mast")
        Refno = obj.GetOneValueFromQuery("select Refno from granite_packinglistheader where packing_vesselname='" & vessel.Text & "'")
        If e.CommandName = "Insert" Then
            'Determine the RowIndex of the Row whose Button was clicked.
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

            'Reference the GridView Row.
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            'Fetch value of Name.
            Dim sib_no As String = TryCast(row.FindControl("txtsb_no"), TextBox).Text
            Dim marks As String = TryCast(row.FindControl("txtpacking_marks"), TextBox).Text
            Dim sb_date As String = TryCast(row.FindControl("txtsb_date"), TextBox).Text
            'Fetch value of Country.
            'Dim sib_no1 As String = row.Cells(0).Text
            'Dim marks1 As String = row.Cells(1).Text


            sql = "insert into granitecoveringletter_shippingdetails(sno1,entrydate,vessel_name,shipper_name,Refno,sib_no,marks,covering_no,sb_date)" & _
             " values('" + sno1 + "','" + entrydate + "','" + vessel_name + "','" + shipper_name + "','" + Refno + "','" + sib_no + "','" + marks + "','" + covering_no + "','" + sb_date + "')"
            successid = obj.QueryExecution(sql)
            sno1 = sno1 + 1


            If (successid) Then
                message = "Record Inserted Successfully"
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                Exit Sub
            End If
            'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Refno: " & Refno & "\n marks: " & marks & "');", True)

        End If
    End Sub
End Class