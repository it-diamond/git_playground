Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Dim obj As New ObjClass
    Dim s As New SharedData
    Private Sub signin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim Username, Password, Sql As String
        Username = Me.username.Text
        Password = Me.password.Text

        Sql = "select count(*) from login where user_name='" + Username + "' and pass_word='" + Password + "'"
        Select Case obj.FindDuplicate(Sql)
            Case Is > 0
                s.SetSessiondata(Username)
                Me.Invalidlogin.Text = ""
                Response.Redirect("DashBoard/Dashboard.aspx")
            Case Else
                Me.Invalidlogin.Text = "Invalid Login Please Try Again"
        End Select
    End Sub
End Class