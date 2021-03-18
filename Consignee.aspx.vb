Imports System.Data.SqlClient
Imports System.Configuration
Public Class Consignee
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim consignee_name, consignee_marks, consignee_address1, consignee_address2,
        consignee_city, consignee_country, consignee_pincode, consignee_phoneno, consignee_contactperson, consignee_emailid, sql, message, CheckSql, consigneeid As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles save.Click
        Dim successid As Integer
        consignee_name = Me.conname.Text
        consignee_marks = Me.conmarks.Text
        consignee_address1 = Me.conaddr1.Text
        consignee_address2 = Me.conaddr2.Text
        consignee_city = Me.concity.Text
        consignee_country = Me.concountry.Text
        consignee_pincode = Me.conpincode.Text
        consignee_phoneno = Me.conphoneno.Text
        consignee_contactperson = Me.concperson.Text
        consignee_emailid = Me.conemailid.Text
        message = ""


        Select Case Me.save.Text
            Case Is = "Submit"
                sql = "insert into granite_consigneedetails_master(consignee_name , consignee_marks, consignee_address1, consignee_address2 , consignee_city, consignee_country," & _
                            "consignee_pincode ,consignee_phoneno , consignee_contactperson, consignee_emailid) values('" + consignee_name + "','" + consignee_marks + "'," & _
                            "'" + consignee_address1 + "','" + consignee_address2 + "','" + consignee_city + "','" + consignee_country + "','" + consignee_pincode + "'," & _
                            "'" + consignee_phoneno + "','" + consignee_contactperson + "','" + consignee_emailid + "')"
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub
                End If
            Case Is = "Update"

                consigneeid = Me.hdid.Value
                sql = "update granite_consigneedetails_master set consignee_name  ='" + consignee_name + "' ,consignee_marks='" + consignee_marks + "',consignee_address1 ='" + consignee_address1 + "' ,consignee_address2='" + consignee_address2 +
                   "',consignee_city='" + consignee_city + "', consignee_country ='" + consignee_country + "' , consignee_pincode='" + consignee_pincode + "',consignee_phoneno   ='" + consignee_phoneno + "' ,consignee_contactperson ='" + consignee_contactperson + "',consignee_emailid ='" + consignee_emailid + "' where auto_id=" & consigneeid
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.save.Text = "Submit"
                'Case Is = "Remove"
                'obj.QueryExecution("delete from granite_consigneedetails_master where auto_id=" + consigneeid + "")

                'consigneedsi.SelectCommand = "Select * from granite_consigneedetails_master"
        End Select

        Dim url As String = "consignee.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        consigneedsi.SelectCommand = "Select auto_id, consignee_name , consignee_marks, consignee_address1, consignee_address2 , consignee_city, consignee_country,consignee_pincode ,consignee_phoneno , consignee_contactperson, consignee_emailid from granite_consigneedetails_master"
    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim consigneeid As String
        consigneeid = e.CommandArgument

        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String

                sql = "Select consignee_name , consignee_marks, consignee_address1, consignee_address2 , consignee_city, consignee_country,consignee_pincode ,consignee_phoneno , consignee_contactperson, consignee_emailid from granite_consigneedetails_master where auto_id='" + consigneeid + "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 10)

                Me.conname.Text = getdata.Item(0)
                Me.conmarks.Text = getdata.Item(1)
                Me.conaddr1.Text = getdata.Item(2)
                Me.conaddr2.Text = getdata.Item(3)
                Me.concity.Text = getdata.Item(4)
                Me.concountry.Text = getdata.Item(5)
                Me.conpincode.Text = getdata.Item(6)
                Me.conphoneno.Text = getdata.Item(7)
                Me.concperson.Text = getdata.Item(8)
                Me.conemailid.Text = getdata.Item(9)

                Me.hdid.Value = consigneeid

                Me.save.Text = "Update"
            Case Is = "Remove"
                obj.QueryExecution("delete from granite_consigneedetails_master where auto_id=" + consigneeid + "")
        End Select
        consigneedsi.SelectCommand = "Select * from granite_consigneedetails_master"
        'consigneedsi.SelectCommand = "Select auto_id, consignee_name , consignee_marks, consignee_address1, consignee_address2 , consignee_city, consignee_country,consignee_pincode ,consignee_phoneno , consignee_contactperson, consignee_emailid from granite_consigneedetails_master"
    End Sub

    
    Protected Sub gvvessel_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvvessel.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        conname.Text = ""
        conmarks.Text = ""
        conaddr1.Text = ""
        conaddr2.Text = ""
        concity.Text = ""
        concountry.Text = ""
        conpincode.Text = ""
        conphoneno.Text = ""
        conemailid.Text = ""
        concperson.Text = ""


    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        consigneedsi.SelectCommand = "SELECT * from granite_consigneedetails_master WHERE consignee_name LIKE '%" + TextBox1.Text + "%'"
    End Sub
End Class