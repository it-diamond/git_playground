Imports System.Data.SqlClient
Imports System.Configuration
Public Class Shipper
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim shipper_name, shipper_address, shipper_address2, shipper_city, shipper_state, shipper_pincode, shipper_contactperson, shipper_email,
        shipper_phoneno, shipper_mobileno, shipper_iecode, sql, message, CheckSql, shipper_id As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles save.Click
        Dim successid As Integer
        shipper_name = Me.shipper.Text
        shipper_address = Me.addr1.Text
        shipper_address2 = Me.addr2.Text
        shipper_city = Me.city.Text
        shipper_state = Me.state.Text
        shipper_pincode = Me.pincode.Text
        shipper_contactperson = Me.contact.Text
        shipper_email = Me.email.Text
        shipper_phoneno = Me.phone.Text
        shipper_mobileno = Me.mobile.Text
        shipper_iecode = Me.iecode.Text
        message = ""

        Select Me.save.Text
            Case Is = "Submit"
                sql = "insert into granite_shipper_master(shipper_name, shipper_address, shipper_address2 , shipper_city, shipper_state, shipper_pincode," & _
                            "shipper_contactperson,shipper_email, shipper_phoneno,shipper_mobileno,shipper_iecode)values('" + shipper_name + "','" + shipper_address + "'," & _
                            "'" + shipper_address2 + "','" + shipper_city + "','" + shipper_state + "','" + shipper_pincode + "','" + shipper_contactperson + "'," & _
                            "'" + shipper_email + "','" + shipper_phoneno + "','" + shipper_mobileno + "','" + shipper_iecode + "')"
                successid = obj.QueryExecution(Sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub
                End If
            Case Is = "Update"

                shipper_id = Me.hdid.Value
                sql = "update granite_shipper_master set shipper_name ='" + shipper_name + "' ,shipper_address='" + shipper_address + "',shipper_address2='" + shipper_address2 + "' ,shipper_city='" + shipper_city +
                    "',shipper_state ='" + shipper_state + "', shipper_pincode ='" + shipper_pincode + "' , shipper_contactperson='" + shipper_contactperson + "',shipper_email  ='" + shipper_email +
                    "' ,shipper_phoneno ='" + shipper_phoneno + "' ,shipper_mobileno='" + shipper_mobileno + "', shipper_iecode='" + shipper_iecode + "' where auto_id=" & shipper_id
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.save.Text = "Submit"

        End Select
        Dim url As String = "Shipper.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        shipperdsi.SelectCommand = "Select auto_id, shipper_name, shipper_address,shipper_address2, shipper_city, shipper_state, shipper_pincode,shipper_contactperson,shipper_email,shipper_phoneno,shipper_mobileno,shipper_iecode from granite_shipper_master"

    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim shipper_id As String
        shipper_id = e.CommandArgument

        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String

                sql = "Select shipper_name, shipper_address,shipper_address2,shipper_city,shipper_state,shipper_pincode,shipper_contactperson,shipper_email,shipper_phoneno,shipper_mobileno,shipper_iecode from granite_shipper_master where auto_id='" + shipper_id + "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 11)

                Me.shipper.Text = getdata.Item(0)
                Me.addr1.Text = getdata.Item(1)
                Me.addr2.Text = getdata.Item(2)
                Me.city.Text = getdata.Item(3)
                Me.state.Text = getdata.Item(4)
                Me.pincode.Text = getdata.Item(5)
                Me.contact.Text = getdata.Item(6)
                Me.email.Text = getdata.Item(7)
                Me.phone.Text = getdata.Item(8)
                Me.mobile.Text = getdata.Item(9)
                Me.iecode.Text = getdata.Item(10)
                Me.hdid.Value = shipper_id

                Me.save.Text = "Update"
            Case Is = "Remove"
                obj.QueryExecution("delete from granite_shipper_master where auto_id=" + shipper_id + "")
        End Select

        shipperdsi.SelectCommand = "Select * from granite_shipper_master"
    End Sub

    
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        shipper.Text = ""
        addr1.Text = ""
        addr2.Text = ""
        city.Text = ""
        state.Text = ""
        pincode.Text = ""
        contact.Text = ""
        email.Text = ""
        phone.Text = ""
        mobile.Text = ""
        iecode.Text = ""

    End Sub

    Protected Sub shipperdsi_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles shipperdsi.Selecting

    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        shipperdsi.SelectCommand = "SELECT * from granite_shipper_master WHERE shipper_name LIKE '%" + TextBox1.Text + "%'"
    End Sub
End Class