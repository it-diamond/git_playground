Imports System.Data.SqlClient
Imports System.Configuration
Public Class Port
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim port_name, port_country, port_code, sql, message, CheckSql, port_id As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles save.Click
        Dim successid As Integer
        port_name = Me.pname.Text
        port_country = Me.pcountry.Text
        port_code = Me.pcode1.Text
        message = ""
         Select Me.save.Text
            Case Is = "Submit"
                sql = "insert into granite_portdetails_master(port_name,port_country,port_code)values('" + port_name + "','" + port_country + "','" + port_code + "')"
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub
                End If
            Case Is = "Update"

                port_id = Me.hdid.Value
                sql = "update granite_portdetails_master set port_name ='" + port_name + "' ,port_country='" + port_country + "',port_code='" + port_code + "' where auto_id=" & port_id
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.save.Text = "Submit"

        End Select
        Dim url As String = "port.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        'linerdsi.SelectCommand = "Select auto_id, liner_name, liner_address from granite_port_master"
    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim port_id As String
        port_id = e.CommandArgument

        Select e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String
                sql = "Select port_name, port_country,port_code from granite_portdetails_master"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 3)

                Me.pname.Text = getdata.Item(0)
                Me.pcountry.Text = getdata.Item(1)
                Me.pcode1.Text = getdata.Item(2)
                Me.hdid.Value = port_id

                Me.save.Text = "Update"
            Case Is = "Remove"
                obj.QueryExecution("delete from granite_portdetails_master where auto_id=" + port_id + "")
        End Select

        portdsi.SelectCommand = "Select * from granite_portdetails_master"
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        pname.Text = ""
        pcountry.Text = ""
        pcode1.Text = ""

    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        portdsi.SelectCommand = "SELECT * from granite_portdetails_master WHERE port_name LIKE '%" + TextBox1.Text + "%'"
    End Sub

   

End Class