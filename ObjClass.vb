Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Security.Cryptography
Imports System.IO
Imports System.Net

Public Class ObjClass
    Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
    Public Function SumQtyCheck(ByVal sb_no As String, ByVal inv_no As String) As Boolean
        Dim InvQty, ArrQty As Double
        InvQty = GetOneValueFromQuery("select distinct inv_qty from shipping_bill_vehicle_details where sb_no='" + sb_no + "' and inv_no='" + inv_no + "'")
        ArrQty = GetOneValueFromQuery("select Sum(arrived_qty) from shipping_bill_vehicle_details where sb_no='" + sb_no + "' and inv_no='" + inv_no + "'")

        Select Case InvQty < (ArrQty)
            Case True
                Return False
            Case Else
                Return True
        End Select
    End Function
    Public Function Encrypt(ByVal clearText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
             &H65, &H64, &H76, &H65, &H64, &H65, _
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function
    Public Function Decrypt(ByVal cipherText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        cipherText = cipherText.Replace(" ", "+")
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
             &H65, &H64, &H76, &H65, &H64, &H65, _
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                    cs.Write(cipherBytes, 0, cipherBytes.Length)
                    cs.Close()
                End Using
                cipherText = Encoding.Unicode.GetString(ms.ToArray())
            End Using
        End Using
        Return cipherText
    End Function
    Function ConvDtFrmt(ByVal strdate As String, ByVal dtformat As String) As String
        Try
            Return Format(CDate(strdate), dtformat)
        Catch ex As Exception
            Return Nothing

        End Try
    End Function
    Function TransactionInsert(ByVal QueryCollection As List(Of String)) As Boolean
        Dim Result As String
        Dim myConnection As New SqlConnection(strcon)
        myConnection.Open()

        ' Start a local transaction
        Dim myTrans As SqlTransaction = myConnection.BeginTransaction()

        Dim myCommand As New SqlCommand()
        myCommand.Connection = myConnection
        myCommand.Transaction = myTrans
        Try
            For i = 0 To QueryCollection.Count - 1
                myCommand.CommandText = QueryCollection(i)
                myCommand.ExecuteNonQuery()
            Next
            'commit
            myTrans.Commit()
            Result = True
            Return Result
        Catch ep As Exception
            ' Attempt to roll back the transaction. 
            myTrans.Rollback()
            Result = False
            Return Result
        Finally
            myConnection.Close()
        End Try
    End Function
    Function QueryExecution(ByVal Sql As String) As Integer
        Try
            Dim conn As New SqlConnection(strcon)
            Dim cmd As New SqlCommand(Sql, conn)
            cmd.CommandType = Data.CommandType.Text
            conn.Open()
            Dim i As Integer = cmd.ExecuteNonQuery()
            conn.Close()
            Return i
        Catch ex As Exception
            Return 0
            MsgBox(ex.Message)

        End Try
    End Function
    Function GetServerDate() As DateTime

        Dim i As DateTime
        Dim conn As New SqlConnection(strcon)
        Dim cmd As New SqlCommand("select getdate()", conn)
        cmd.CommandType = Data.CommandType.Text
        conn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        If dr.Read() Then
            i = dr(0)
        End If
        conn.Close()
        Return i

    End Function
    Function ISValidNumber(ByVal a As String)
        Try
            Return CDbl(a)
        Catch ex As Exception
            Return 0
        End Try
    End Function
    Function FindDuplicate(ByVal Sql As String) As Integer
        'must be countdata as a fieldname
        Dim i As Integer
        Dim conn As New SqlConnection(strcon)
        Dim cmd As New SqlCommand(Sql, conn)
        cmd.CommandType = Data.CommandType.Text
        conn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        If dr.Read() Then
            i = Val(dr(0))
        End If
        conn.Close()
        Return i
    End Function

    Function GetOneValueFromQuery(ByVal Sql As String) As String
        'must be countdata as a fieldname


        Dim i As String
        i = ""
        Dim conn As New SqlConnection(strcon)
        Dim cmd As New SqlCommand(Sql, conn)
        cmd.CommandType = Data.CommandType.Text
        conn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        If dr.Read() Then
            Select Case IsDBNull(dr(0))
                Case Is = True
                    i = ""
                Case Else
                    i = dr(0)
            End Select

        End If
        conn.Close()
        Return i
    End Function
    Function GetMoreValueFromQuery(ByVal Sql As String, ByVal countvalue As Integer) As List(Of String)

        Dim i As New List(Of String)
        Dim conn As New SqlConnection(strcon)
        Dim cmd As New SqlCommand(Sql, conn)
        cmd.CommandType = Data.CommandType.Text
        conn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        If dr.Read() Then
            For j = 0 To countvalue - 1
                Select Case IsDBNull(dr(j))
                    Case Is = True
                        i.Add("")
                    Case Else
                        i.Add(dr(j))
                End Select

            Next
        End If
        conn.Close()
        Return i
    End Function
    Function dummy(ByVal value As String) As Object
        If value = "int" Then
            Return 34
        ElseIf value = "float" Then
            Return 3.1874
        ElseIf value = "string" Then
            Return "Hello"
        ElseIf value = "boolean" Then
            Return False
        End If
        Return Date.Now
    End Function

    Function getprimaryafterinsert(ByVal sql As String) As Integer
        Try
            Dim query As String = sql
            Dim query2 As String = "Select @@Identity"
            Dim ID As Integer

            Using conn As New SqlConnection(strcon)
                Using cmd As New SqlCommand(query, conn)
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    cmd.CommandText = query2
                    ID = cmd.ExecuteScalar()

                End Using
            End Using
            Return ID
        Catch ex As Exception
            'MsgBox(ex.Message)
            Return 0
        End Try

    End Function

    Function getdataset(ByVal sql As String) As DataSet
        Dim strcon As String = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
        Dim conn As New SqlConnection(strcon)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet()
        da.Fill(ds)
        conn.Close()
        Return ds
    End Function
    Function getdatatable(ByVal sql As String) As DataTable
        Dim strcon As String = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
        Dim conn As New SqlConnection(strcon)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataTable()
        da.Fill(ds)
        conn.Close()
        Return ds
    End Function
    Function SendMail(ByVal FromMail As String, ByVal Password As String, ByVal ToMail As String, ByVal DisplayName As String, ByVal Subject As String, ByVal StrHtml As String) As Integer
        Try
            Dim from As String = FromMail
            Dim [to] As String = ToMail
            Dim mail As New System.Net.Mail.MailMessage()
            mail.[To].Add([to])
            mail.From = New MailAddress(from, DisplayName, System.Text.Encoding.UTF8)
            mail.Subject = Subject
            mail.SubjectEncoding = System.Text.Encoding.UTF8
            mail.Body = StrHtml
            mail.BodyEncoding = System.Text.Encoding.UTF8
            mail.IsBodyHtml = True
            mail.Priority = MailPriority.High
            Dim client As New SmtpClient()
            client.Credentials = New System.Net.NetworkCredential(from, Password)
            client.Port = 587
            client.Host = "smtp.diamondshipping.in"
            client.EnableSsl = False
            client.Send(mail)
            Return 1
        Catch ex As Exception
            Return 0
        End Try
    End Function

    Function getcolumndatafromquery(ByVal sql As String) As List(Of String)
        Dim list As New List(Of String)
        Dim strcon As String = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
        Dim conn As New SqlConnection(strcon)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        While dr.Read()
            Select Case IsDBNull(dr(0))
                Case Is = True

                Case Else
                    list.Add(dr(0))
            End Select

        End While
        conn.Close()
        Return list

    End Function

    Function getcolumndatafromquerywithcommas(ByVal sql As String) As String
        Dim list As New List(Of String)
        list = getcolumndatafromquery(sql)
        Dim builder As StringBuilder = New StringBuilder()
        For Each val As String In list
            builder.Append(val).Append(",")
        Next
        ' Convert to string.
        Return builder.ToString()

    End Function
    Public Function NumberToWords(ByVal number As Integer)
        Dim words As String = ""
        If number = 0 Then
            Return "zero"
        ElseIf number = 100 Then
            Return "One Hundred Only"
        ElseIf number = 1000 Then
            Return "One Thousand Only"
        ElseIf number = 100000 Then
            Return "One Lakh Only"
        ElseIf number = 10000000 Then
            Return "One Crore Only"
        Else
            words = DigitToWords(number)
        End If
        Return words + " Only"

    End Function

    Private Function DigitToWords(ByVal number As Integer) As String
        Dim numwords As String = ""
        Dim unitsMap As String() = {"", "One", "Two", "Three", "Four", "Five", _
 "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", _
 "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", _
 "Eighteen", "Nineteen"}
        Dim tensMap As String() = {"", "Ten", "Twenty", "Thirty", "Forty", "Fifty", _
"Sixty", "Seventy", "Eighty", "Ninety", ""}
        If number < 20 Then
            Return unitsMap(number)
        ElseIf 20 < number And number < 100 Then
            numwords = tensMap(Math.Truncate(number / 10)) + " " + unitsMap(number Mod 10)
        ElseIf 100 <= number And number < 1000 Then
            numwords = DigitToWords(Math.Truncate(number / 100)) + " Hundred " & _
            "" + tensMap(Math.Truncate((number Mod 100) / 10)) + " " + unitsMap(number Mod 10)
        ElseIf 1000 <= number And number < 100000 Then
            numwords = DigitToWords(Math.Truncate(number / 1000)) + " Thousand " & _
            "" + If(Math.Truncate((number Mod 1000) / 100) = 0, "", DigitToWords(Math.Truncate((number Mod 1000) / 100)) + " Hundred ") & _
            "" + tensMap(Math.Truncate((number Mod 100) / 10)) + " " + unitsMap(number Mod 10)
        ElseIf 100000 <= number And number < 10000000 Then
            numwords = DigitToWords(Math.Truncate(number / 100000)) + " Lakhs " & _
            "" + If(Math.Truncate((number Mod 100000) / 1000) = 0, "", DigitToWords(Math.Truncate((number Mod 100000) / 1000)) + " Thousand ") & _
            "" + If(Math.Truncate((number Mod 1000) / 100) = 0, "", DigitToWords(Math.Truncate((number Mod 1000) / 100)) + " Hundred ") & _
            "" + tensMap(Math.Truncate((number Mod 100) / 10)) + " " + unitsMap(number Mod 10)
        End If
        Return numwords
    End Function
    Function SendSMS(ByVal message As String, ByVal number As String) As String
        Dim httpWReq As HttpWebRequest = CType(WebRequest.Create("http://pay4sms.in/sendsms/?"), HttpWebRequest)
        Dim encoding As ASCIIEncoding = New ASCIIEncoding()
        Dim postData As String = String.Empty
        Dim msg As String = ""
        msg = message
        postData += "token=fd35889f78457e9fb6d32c6725b66757&credit=2&sender=DSASHP&message=" + msg + "&number=" + number + ""
        Dim data As Byte() = encoding.GetBytes(postData)
        httpWReq.Method = "POST"
        httpWReq.ContentType = "application/x-www-form-urlencoded"
        httpWReq.ContentLength = data.Length
        Using stream As Stream = httpWReq.GetRequestStream()
            stream.Write(data, 0, data.Length)
        End Using
        Dim response As HttpWebResponse = CType(httpWReq.GetResponse(), HttpWebResponse)
        Dim responseString As String = New StreamReader(response.GetResponseStream()).ReadToEnd()
        Return responseString

    End Function

    Sub populatedropdownlist(ByVal sql As String, ByVal dropDownList As DropDownList)
        dropDownList.Items.Clear()
        Dim listdata As New List(Of String)
        listdata = getcolumndatafromquery(sql)
        For i = 0 To listdata.Count - 1
            dropDownList.Items.Add(listdata(i))
        Next

    End Sub
    Sub populatedropdownlistWithID(ByVal sql As String, ByVal dropDownList As DropDownList)
        


        dropDownList.Items.Clear()
        Dim listdata As New DataTable
        listdata = getdatatable(sql)
        Dim listdata1 As Dictionary(Of Integer, String) = New Dictionary(Of Integer, String)()
    
       


        For i = 0 To listdata.Rows.Count - 1
            'dropDownList.Items.Add(listdata.Rows(i).Item(0).ToString)
            'dropDownList.DataTextField = listdata.Rows(i).Item(0).ToString
            'dropDownList.DataValueField = listdata.Rows(i).Item(1).ToString
            'dropDownList.DataBind()


            listdata1.Add(listdata.Rows(i).Item(1).ToString, listdata.Rows(i).Item(0).ToString)
          

        Next
        dropDownList.DataTextField = "Value"
        dropDownList.DataValueField = "Key"
        dropDownList.DataSource = listdata1
        dropDownList.DataBind()
    End Sub


End Class
