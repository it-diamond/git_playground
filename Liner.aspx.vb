Imports System.Data.SqlClient
Imports System.Configuration
Public Class Liner
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim liner_name, liner_address, liner_city, liner_agent, liner_conperson, liner_phoneno, liner_email, liner_pincode,
         sql, message, CheckSql, liner_id As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles save.Click
        Dim successid As Integer
        liner_name = Me.lname.Text
        liner_address = Me.laddress.Text
        liner_agent = Me.lagent.Text
        liner_city = Me.lcity.Text
        liner_conperson = Me.lcperson.Text
        liner_phoneno = Me.lphoneno.Text
        liner_email = Me.lemail.Text
        liner_pincode = Me.lpincode.Text
        message = ""

        Select Me.save.Text
            Case Is = "Submit"
                sql = "insert into granite_liner_master(liner_name,liner_address, liner_city  , liner_agent , liner_conperson, liner_phoneno ," & _
                            "liner_email, liner_pincode)values('" + liner_name + "','" + liner_address + "'," & _
                            "'" + liner_city + "','" + liner_agent + "','" + liner_conperson + "','" + liner_phoneno + "','" + liner_email + "'," & _
                            "'" + liner_pincode + "')"
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub
                End If
            Case Is = "Update"

                liner_id = Me.hdid.Value
                sql = "update granite_liner_master set liner_name ='" + liner_name + "' ,liner_address='" + liner_address + "', liner_agent='" + liner_agent + "' ,liner_city='" + liner_city +
                    "',liner_conperson ='" + liner_conperson + "',  liner_phoneno='" + liner_phoneno + "' ,  liner_email='" + liner_email + "',liner_pincode  ='" + liner_pincode +
                    "' where auto_id=" & liner_id
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.save.Text = "Submit"

        End Select
        Dim url As String = "liner.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        linerdsi.SelectCommand = "Select auto_id, liner_name, liner_address,liner_agent, liner_city, liner_conperson, liner_phoneno,liner_email,liner_pincode from granite_liner_master"
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        lname.Text = ""
        laddress.Text = ""
        lagent.Text = ""
        lcity.Text = ""
        lcperson.Text = ""
        lphoneno.Text = ""
        lemail.Text = ""
        lpincode.Text = ""
    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim liner_id As String
        liner_id = e.CommandArgument

        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String

                sql = "Select liner_name, liner_address,liner_agent, liner_city, liner_conperson, liner_phoneno,liner_email,liner_pincode from granite_liner_master where auto_id='" + liner_id + "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 8)

                Me.lname.Text = getdata.Item(0)
                Me.laddress.Text = getdata.Item(1)
                Me.lagent.Text = getdata.Item(2)
                Me.lcity.Text = getdata.Item(3)
                Me.lcperson.Text = getdata.Item(4)
                Me.lphoneno.Text = getdata.Item(5)
                Me.lemail.Text = getdata.Item(6)
                Me.lpincode.Text = getdata.Item(7)
                Me.hdid.Value = liner_id

                Me.save.Text = "Update"
            Case Is = "Remove"
                obj.QueryExecution("delete from granite_liner_master where auto_id=" + liner_id + "")
                Exit Sub
        End Select

        linerdsi.SelectCommand = "Select * from granite_liner_master"
    End Sub

    Protected Sub gvvessel_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvvessel.SelectedIndexChanged

    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        linerdsi.SelectCommand = "SELECT * from granite_liner_master WHERE liner_name LIKE '%" + TextBox1.Text + "%'"
    End Sub
End Class
