Imports System.IO

Public Class SharedData

    Public Shared userid As String
    Public Shared ShareBillDt As DataTable
    Sub SetSessiondata(ByVal uid As String)
        userid = uid
    End Sub
   
    Function GetUserId() As String
        Return userid
    End Function
    Sub ClearSession()

        userid = ""
    End Sub

    Sub SetBillDT(ByVal dt As DataTable)

        ShareBillDt = dt
    End Sub

    Function GetBillDT() As DataTable
        Return ShareBillDt
    End Function
    Sub ClearBillDT()

        ShareBillDt.Rows.Clear()

    End Sub






   
End Class
