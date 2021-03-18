Imports System.Data.SqlClient
Imports System.Configuration
Public Class Cf
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim cnf_name, cnf_address1, cnf_address2, cnf_city, cnf_pincode, cnf_phoneno, cnf_conperson, cnf_emailid, sql, message, CheckSql, cnf_id As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles save.Click
        Dim successid As Integer
        cnf_name = Me.cfname.Text
        cnf_address1 = Me.cfaddress1.Text
        cnf_address2 = Me.cfaddress2.Text
        cnf_city = Me.cfcity.Text
        cnf_pincode = Me.cfpincode.Text
        cnf_phoneno = Me.cfphoneno.Text
        cnf_conperson = Me.cfconperson.Text
        cnf_emailid = Me.cfemailid.Text
        message = ""

        Select Case Me.save.Text
            Case Is = "Submit"
                sql = "insert into granite_cnfdetails_master(cnf_name,  cnf_address1, cnf_address2 , cnf_city , cnf_pincode , cnf_phoneno ," & _
                            " cnf_conperson,  cnf_emailid) values('" + cnf_name + "','" + cnf_address1 + "'," & _
                            "'" + cnf_address2 + "','" + cnf_city + "','" + cnf_pincode + "','" + cnf_phoneno + "'," & _
                            "'" + cnf_conperson + "','" + cnf_emailid + "')"
                successid = obj.QueryExecution(Sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
            Case Is = "Update"

                cnf_id = Me.hdid.Value
                sql = "update granite_cnfdetails_master set  cnf_name  ='" + cnf_name + "' , cnf_address1= '" + cnf_address1 + "',cnf_address2='" + cnf_address2 + "',cnf_city='" + cnf_city + "' ,cnf_pincode  ='" + cnf_pincode + "', cnf_phoneno ='" + cnf_phoneno + "',cnf_conperson='" + cnf_conperson + "' ,cnf_emailid ='" + cnf_emailid + "' where auto_id=" & cnf_id
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.save.Text = "Submit"
        End Select
        Dim url As String = "Cf.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        cfdsi.SelectCommand = "Select auto_id,cnf_name,cnf_address1,cnf_address2,cnf_city, cnf_pincode, cnf_phoneno,cnf_conperson,cnf_emailid  from granite_cnfdetails_master"

    End Sub

  
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        cfname.Text = ""
        cfaddress1.Text = ""
        cfaddress2.Text = ""
        cfcity.Text = ""
        cfpincode.Text = ""
        cfphoneno.Text = ""
        cfconperson.Text = ""
        cfemailid.Text = ""
    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim cnf_id As String
        cnf_id = e.CommandArgument

        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String

                sql = "Select cnf_name,cnf_address1,cnf_address2,cnf_city, cnf_pincode, cnf_phoneno,cnf_conperson,cnf_emailid  from granite_cnfdetails_master where auto_id='" + cnf_id + "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 8)

                Me.cfname.Text = getdata.Item(0)
                Me.cfaddress1.Text = getdata.Item(1)
                Me.cfaddress2.Text = getdata.Item(2)
                Me.cfcity.Text = getdata.Item(3)
                Me.cfpincode.Text = getdata.Item(4)
                Me.cfphoneno.Text = getdata.Item(5)
                Me.cfconperson.Text = getdata.Item(6)
                Me.cfemailid.Text = getdata.Item(7)
                Me.hdid.Value = cnf_id

                Me.save.Text = "Update"
            Case Is = "Remove"
                obj.QueryExecution("delete from granite_cnfdetails_master where auto_id=" + cnf_id + "")
        End Select

        cfdsi.SelectCommand = "Select * from granite_cnfdetails_master"
    End Sub


    Protected Sub gvvessel_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvvessel.SelectedIndexChanged

    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        cfdsi.SelectCommand = "SELECT * from granite_cnfdetails_master WHERE cnf_name LIKE '%" + cnfparty.Text + "%'"
    End Sub
End Class