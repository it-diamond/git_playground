
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Services
Public Class PackingListContainer
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim sql, message, CheckSql, port_id, sno_blist, sb_no, sb_date, packing_shippername, packing_portname, packing_marks, packing_description, s_billtype, invoice_no, invoice_date, bl_number, bl_date,
                stuffing_date, bl_confirmationdate, document_ddate, time_taken, reasons_ncs, packing_list_type, packing_vesselname As String
    Dim container_no, size, liner, liner_sealno, cust_sealno, blockno As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' BindGridView()
            'myDiv.Visible = False
        End If


    End Sub
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
    Public Shared Function Getvessel(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT packing_vesselname FROM granite_packinglistheader where packing_vesselname LIKE '%'+@pre+'%'"
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
    Public Shared Function GetLiner(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT liner_name FROM granite_liner_master where liner_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("liner_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using

        Return Liner.ToArray()
    End Function
    <WebMethod()>
    Public Shared Function Getconsignee(prefix As String) As String()
        Dim Liner As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("MyDbConn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT consignee_name FROM granite_consigneedetails_master where consignee_name LIKE '%'+@pre+'%'"
                cmd.Parameters.AddWithValue("@pre", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Liner.Add(String.Format("{0}-{1}", sdr("consignee_name"), ""))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return Liner.ToArray()
    End Function

    Private Sub NewJob_Click(sender As Object, e As System.EventArgs) Handles NewJob.Click
        'Me.lbledit.Text = "NEW SHIPPING BILL NO"
        Me.snoblist.Text = ""
        Me.sbno.Text = ""
        Me.sbdate.Text = ""
        Me.shname.Text = ""
        Me.portname.Text = ""
        Me.marks.Text = ""
        Me.descgoods.Text = ""
        Me.sbilltype.Text = ""
        Me.invoiceno.Text = ""
        Me.invoicedate.Text = ""
        Me.blno.Text = ""
        Me.bldate.Text = ""
        Me.stuffingdate.Text = ""
        Me.nblocks.Text = ""
        Me.totalcbm.Text = ""
        Me.totalwt.Text = ""
        Me.blconfdate.Text = ""
        Me.docdate.Text = ""
        Me.timetaken.Text = ""
        Me.reasonncs.Text = ""
        'Me.save.Text = "New SB "
        'Me.lblrefno.Text = getreferenceno()
        'Me.confrno.Text = Me.lblrefno.Text
        'Me.lblvenam.Text = Me.vname.Text

        Me.confrno.Text = ""
        Me.conno.Text = ""
        Me.companytype.Text = ""
        Me.liner1.Text = ""
        Me.linersealno.Text = ""
        Me.custsno.Text = ""
        Me.blockno1.Text = ""
        Me.noofblocks.Text = ""
        Me.cbm1.Text = ""
        Me.totalweight1.Text = ""
        'Me.confrno.Text = Me.lblrefno.Text

        'Gridview1.DataSource = Nothing
        'Gridview1.DataBind()
        Dim value = obj.GetOneValueFromQuery("select count(*) from granite_packinglistheader where packing_vesselname='" & vname.Text & "' and job_completion_flag=0")

        If (value.ToString = 0) Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Cannot create job number')", True)
        Else
            Me.lbledit.Text = "NEW SHIPPING BILL NO"
            Me.save.Text = "New SB "
            Me.lblrefno.Text = getreferenceno()
            Me.confrno.Text = Me.lblrefno.Text
            Me.lblvenam.Text = Me.vname.Text
            Me.confrno.Text = Me.lblrefno.Text
            Gridview1.DataSource = Nothing
            Gridview1.DataBind()
        End If
    End Sub
    Public Function getreferenceno() As String
        Dim RefNo As String = Convert.ToInt32(obj.GetOneValueFromQuery("select granite_ref_no from control_mast")).ToString("D4")
        Dim RefNoFormat As String = obj.GetOneValueFromQuery("select granite_ref_format from control_mast")
        Return RefNoFormat + RefNo
    End Function
    Sub BindGridView()

        Dim sql As String = "select Refno,sb_no from granite_packinglistheader"
        Dim ds As New DataSet()
        ds = obj.getdataset(sql)
        gvvessel.DataSource = ds
        gvvessel.DataBind()
    End Sub

    Private Sub gvvessel_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim refno As String
        refno = e.CommandArgument
        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String
                sql = "select  sno_blist,sb_no,sb_date,sh_code,port_code,packing_marks,packing_description,s_billtype,invoice_no,invoice_date,bl_number,bl_date," & _
                "stuffing_date, total_blocknumber, total_volumeofCBT, total_weight, bl_confirmationdate, document_ddate, time_taken, reasons_ncs from granite_packinglistheader where Refno='" & refno & "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 20)
                Me.snoblist.Text = getdata.Item(0)
                Me.sbno.Text = getdata.Item(1)
                Me.sbdate.Text = IIf(getdata.Item(2) = "01/01/1900", "", getdata.Item(2))
                Me.shname.Text = getdata.Item(3)
                Me.portname.Text = getdata.Item(4)
                Me.marks.Text = getdata.Item(5)
                Me.descgoods.Text = getdata.Item(6)
                Me.sbilltype.SelectedValue = getdata.Item(7)
                Me.invoiceno.Text = getdata.Item(8)
                Me.invoicedate.Text = IIf(getdata.Item(9) = "01/01/1900", "", getdata.Item(9))
                Me.blno.Text = getdata.Item(10)
                Me.bldate.Text = IIf(getdata.Item(11) = "01/01/1900", "", getdata.Item(11))
                Me.stuffingdate.Text = getdata.Item(12)
                Me.nblocks.Text = getdata.Item(13)
                Me.totalcbm.Text = getdata.Item(14)
                Me.blconfdate.Text = IIf(getdata.Item(16) = "01/01/1900", "", getdata.Item(16))
                Me.docdate.Text = IIf(getdata.Item(17) = "01/01/1900", "", getdata.Item(17))
                Me.timetaken.Text = getdata.Item(18)
                Me.totalwt.Text = getdata.Item(15)
                Me.reasonncs.Text = getdata.Item(19)
                Me.hdid.Value = refno
                Me.lblrefno.Text = refno
                Me.save.Text = "Update"
                Me.lbledit.Text = "EDITING SHIPPING BILL NO:"
                Me.confrno.Text = Me.lblrefno.Text
                Me.blockno1.Text = Me.marks.Text

           

                Dim table As New DataTable
                ' Create four typed columns in the DataTable.
                table.Columns.AddRange(New DataColumn() {New DataColumn("refno", GetType(String)), _
                                                         New DataColumn("container_no", GetType(String)), _
                                                      New DataColumn("size", GetType(String)), _
                                                      New DataColumn("liner", GetType(String)), _
                                                      New DataColumn("liner_sealno", GetType(String)), _
                                                      New DataColumn("cust_sealno", GetType(String)), _
                                                      New DataColumn("blockno", GetType(String)), _
                                                      New DataColumn("noof_blocks", GetType(String)), _
                                                          New DataColumn("cbm", GetType(String)), _
                                                          New DataColumn("total_weight1", GetType(String))})

                Dim dt As New DataTable
                dt = obj.getdatatable("select refno,container_no,size,liner,liner_sealno,cust_sealno,blockno,noof_blocks,cbm,total_weight from granite_container_no where refno='" + refno + "'")

                For i = 0 To dt.Rows.Count - 1
                    table.Rows.Add(dt.Rows(i).Item(0).ToString,
                                   dt.Rows(i).Item(1).ToString,
                                  dt.Rows(i).Item(2).ToString,
                                   dt.Rows(i).Item(3).ToString,
                                  dt.Rows(i).Item(4).ToString,
                                   dt.Rows(i).Item(5).ToString,
                                  dt.Rows(i).Item(6).ToString,
                                   dt.Rows(i).Item(7).ToString,
                                   dt.Rows(i).Item(8).ToString,
                                   dt.Rows(i).Item(9).ToString)
                Next


                Gridview1.DataSource = table
                Gridview1.DataBind()
            Case Is = "Remove"
                ' refno = Me.Refno.Text
                obj.QueryExecution("delete from granite_packinglistheader where Refno='" & refno & "'")
                obj.QueryExecution("delete from granite_container_no where Refno='" & refno & "'")


        End Select
    End Sub



    Private Sub gvvessel_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvvessel.RowEditing

    End Sub

    Protected Sub add_Click(sender As Object, e As EventArgs) Handles addbutton.Click
        Dim table As New DataTable
        ' Create four typed columns in the DataTable.
        table.Columns.AddRange(New DataColumn() {New DataColumn("refno", GetType(String)), _
                                                 New DataColumn("container_no", GetType(String)), _
                                              New DataColumn("size", GetType(String)), _
                                              New DataColumn("liner", GetType(String)), _
                                              New DataColumn("liner_sealno", GetType(String)), _
                                              New DataColumn("cust_sealno", GetType(String)), _
                                              New DataColumn("blockno", GetType(String)), _
                                              New DataColumn("noof_blocks", GetType(String)), _
                                                  New DataColumn("cbm", GetType(String)), _
                                                  New DataColumn("total_weight1", GetType(String))})

        ' Add five rows with those columns filled in the DataTable.
        For i = 0 To Gridview1.Rows.Count - 1
            table.Rows.Add(Server.HtmlDecode(Gridview1.Rows(i).Cells(0).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(1).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(2).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(3).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(4).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(5).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(6).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(7).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(8).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(9).Text))
        Next

        table.Rows.Add(Me.confrno.Text, Me.conno.Text.ToUpper, Me.companytype.SelectedValue, Me.liner1.Text, Me.linersealno.Text, Me.custsno.Text, Me.blockno1.Text, obj.ISValidNumber(Me.noofblocks.Text), obj.ISValidNumber(Me.cbm1.Text), obj.ISValidNumber(Me.totalweight1.Text))

        Me.confrno.Text = ""
        Me.conno.Text = ""
        Me.companytype.Text = ""
        Me.liner1.Text = ""
        Me.linersealno.Text = ""
        Me.custsno.Text = ""
        Me.blockno1.Text = ""
        Me.noofblocks.Text = ""
        Me.cbm1.Text = ""
        Me.totalweight1.Text = ""
        Me.confrno.Text = Me.lblrefno.Text
        'If (Me.nblocks.Text > Me.noofblocks.Text) Then
        '    'MsgBox("No of Blocks are not equal")
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('No of blocks not equal')", True)
        'End If

        Gridview1.DataSource = table
        Gridview1.DataBind()
    End Sub

    Private Sub save_Click(sender As Object, e As System.EventArgs) Handles save.Click

        'Dim successid As Integer
        Dim noof_blocks As Double = 0
        Dim cbm As Double = 0
        Dim total_weight1 As Double = 0
        Dim total_blocknumber, total_volumeofCBT, total_weight As Double
        Dim refno As String
        sno_blist = Me.snoblist.Text
        sb_no = Me.sbno.Text
        sb_date = obj.ConvDtFrmt(Me.sbdate.Text, "yyyy-MM-dd")
        packing_shippername = Me.shname.Text
        packing_portname = Me.portname.Text
        packing_marks = Me.marks.Text
        packing_description = Me.descgoods.Text
        s_billtype = Me.sbilltype.SelectedValue
        invoice_no = Me.invoiceno.Text
        invoice_date = obj.ConvDtFrmt(Me.invoicedate.Text, "yyyy-MM-dd")
        bl_number = Me.blno.Text
        bl_date = obj.ConvDtFrmt(Me.bldate.Text, "yyyy-MM-dd")
        stuffing_date = obj.ConvDtFrmt(Me.stuffingdate.Text, "yyyy-MM-dd")
        total_blocknumber = obj.ISValidNumber(Me.nblocks.Text)
        total_volumeofCBT = obj.ISValidNumber(Me.totalcbm.Text)
        total_weight = obj.ISValidNumber(Me.totalwt.Text)
        bl_confirmationdate = obj.ConvDtFrmt(Me.blconfdate.Text, "yyyy-MM-dd")
        document_ddate = obj.ConvDtFrmt(Me.docdate.Text, "yyyy-MM-dd")
        time_taken = Me.timetaken.Text
        reasons_ncs = Me.reasonncs.Text
        message = ""
        packing_vesselname = Me.lblvenam.Text
        'Me.lblvenam.Text = 
        Dim querylist As New List(Of String)
        Dim querycont As New List(Of String)
        Select Case Me.save.Text
            Case Is = "Update"
                refno = Me.hdid.Value
                querylist.Add("update granite_packinglistheader set sno_blist ='" + sno_blist + "',packing_vesselname ='" + packing_vesselname + "',sb_no ='" + sb_no + "', sb_date ='" + sb_date + "',packing_shippername='" + packing_shippername +
                    "', packing_portname ='" + packing_portname + "',packing_marks ='" + packing_marks + "', packing_description ='" + packing_description + "',s_billtype ='" + s_billtype + "',invoice_no='" + invoice_no + "', invoice_date ='" + invoice_date + "' , bl_number='" + bl_number + "',bl_date  ='" + bl_date +
                    "' ,stuffing_date ='" + stuffing_date + "' , total_blocknumber='" & total_blocknumber & "',total_volumeofCBT='" & total_volumeofCBT & "', total_weight='" & total_weight & "',bl_confirmationdate='" + bl_confirmationdate + "',document_ddate='" + document_ddate + "',time_taken ='" + time_taken + "',reasons_ncs ='" + reasons_ncs + "' where Refno= '" + refno + "'")
                message = "Record Updated Successfully"
                deleteallcontainer(refno)
                querycont = Addcontainer(refno)
                If (querycont.Count <> 0) Then
                    For i = 0 To querycont.Count - 1
                        querylist.Add(querycont(i))
                    Next
                End If

                For i = 0 To Gridview1.Rows.Count - 1

                    noof_blocks = noof_blocks + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(7).Text))
                    cbm = cbm + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(8).Text))
                    total_weight1 = total_weight1 + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(9).Text))

                Next

                'If (total_blocknumber = noof_blocks) And (total_volumeofCBT = cbm) And (total_weight = total_weight1) Then
                '    'MsgBox("Numers are equal")
                'Else
                '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Numbers Mismatch')", True)
                '    Exit Sub
                'End If


                Me.save.Text = "Submit"
            Case Else
                refno = lblrefno.Text
                sql = "insert into granite_packinglistheader(refno,sno_blist,packing_vesselname,sb_no,sb_date,packing_shippername,packing_portname," & _
                            "packing_marks, packing_description, s_billtype , invoice_no, invoice_date,bl_number,bl_date," & _
                            "stuffing_date,total_blocknumber,total_volumeofCBT,total_weight,bl_confirmationdate,document_ddate" & _
                            ",time_taken,reasons_ncs,packing_list_type,job_completion_flag)values('" + refno + "','" + sno_blist + "','" + packing_vesselname + "'," & _
                            "'" + sb_no + "'," & _
                            "'" + sb_date + "','" + packing_shippername + "','" + packing_portname + "'," & _
                            "'" + packing_marks + "','" + packing_description + "'," & _
                            "'" + s_billtype + "','" + invoice_no + "','" + invoice_date + "'," & _
                            "'" + bl_number + "','" + bl_date + "','" + stuffing_date + "'," & _
                            "'" & total_blocknumber & "','" & total_volumeofCBT & "','" & total_weight & "'," & _
                            "'" + bl_confirmationdate + "','" + document_ddate + "','" + time_taken + "','" + reasons_ncs + "','C','0')"
                querylist.Add(sql)
                querycont = Addcontainer(refno)
                If (querycont.Count <> 0) Then
                    For i = 0 To querycont.Count - 1
                        querylist.Add(querycont(i))
                    Next
                End If
               
                For i = 0 To Gridview1.Rows.Count - 1

                    noof_blocks = noof_blocks + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(7).Text))
                    cbm = cbm + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(8).Text))
                    total_weight1 = total_weight1 + CDbl(Server.HtmlDecode(Gridview1.Rows(i).Cells(9).Text))


                Next
                cbm = Math.Round(cbm, 3)
                'If (total_blocknumber = noof_blocks) And (total_volumeofCBT = cbm) And (total_weight = total_weight1) Then
                '    'MsgBox("Numers are equal")
                'Else
                '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Numbers Mismatch')", True)
                '    Exit Sub
                'End If


                querylist.Add("update control_mast set granite_ref_no=granite_ref_no+1")
                message = "Record inserted Successfully"
                Me.save.Text = "Submit"


        End Select

        Select Case obj.TransactionInsert(querylist)
            Case Is = True
                Dim url As String = "JobNoDetails.aspx"
                Dim script As String = "window.onload = function(){ alert('"
                script += message
                script += "');"
                script += "window.location = '"
                script += url
                script += "'; }"
                ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
            Case Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Something went Wrong')", True)
                Exit Sub
        End Select



    End Sub


   

    Private Sub Gridview1_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles Gridview1.RowCommand
        Dim RefId As String = e.CommandArgument

        Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

        Select Case e.CommandName
            Case Is = "change"


                ' Me.sbnoo.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(0).Text)
                Me.confrno.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(0).Text)
                Me.conno.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(1).Text)
                Me.companytype.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(2).Text)
                Me.liner1.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(3).Text)
                Me.linersealno.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(4).Text)
                Me.custsno.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(5).Text)
                Me.blockno1.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(6).Text)
                Me.noofblocks.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(7).Text)
                Me.cbm1.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(8).Text)
                Me.totalweight1.Text = Server.HtmlDecode(Gridview1.Rows(rowIndex).Cells(9).Text)
                Me.lblvenam.Text = Me.vname.Text

            Case Is = "Remove"
                'obj.QueryExecution("delete from granite_packinglistheader where Refno=" + refno + "")
                'obj.QueryExecution("delete from granite_container_no where Refno=" + refno + "")

                ''Case Is = "remove"

        End Select

        Dim table As New DataTable
        ' Create four typed columns in the DataTable.
        table.Columns.AddRange(New DataColumn() {New DataColumn("refno", GetType(String)), _
                                                 New DataColumn("container_no", GetType(String)), _
                                              New DataColumn("size", GetType(String)), _
                                              New DataColumn("liner", GetType(String)), _
                                              New DataColumn("liner_sealno", GetType(String)), _
                                              New DataColumn("cust_sealno", GetType(String)), _
                                              New DataColumn("blockno", GetType(String)), _
                                              New DataColumn("noof_blocks", GetType(String)),
                                                  New DataColumn("cbm", GetType(String)), _
                                                 New DataColumn("total_weight1", GetType(String))})


        ' Add five rows with those columns filled in the DataTable.
        For i = 0 To Gridview1.Rows.Count - 1
            table.Rows.Add(Server.HtmlDecode(Gridview1.Rows(i).Cells(0).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(1).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(2).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(3).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(4).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(5).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(6).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(7).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(8).Text),
                           Server.HtmlDecode(Gridview1.Rows(i).Cells(9).Text))

        Next

        table.Rows.RemoveAt(rowIndex)
        Gridview1.DataSource = table
        Gridview1.DataBind()
    End Sub
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



    Private Function deleteallcontainer(ByVal refno As String) As Boolean
        Dim result As Boolean
        Dim successid As Integer

          successid = obj.QueryExecution("delete from granite_container_no where refno='" + refno + "'")
        If (successid) Then
            result = True

        Else
            result = False
        End If
        Return result
    End Function
    Private Function Addcontainer(ByVal refno As String) As List(Of String)

        Dim result As New List(Of String)
        Dim noof_blocks, cbm, total_weight As Double
        For i = 0 To Gridview1.Rows.Count - 1
            refno = Server.HtmlDecode(Gridview1.Rows(i).Cells(0).Text)
            container_no = Server.HtmlDecode(Gridview1.Rows(i).Cells(1).Text)
            size = Server.HtmlDecode(Gridview1.Rows(i).Cells(2).Text)
            liner = Server.HtmlDecode(Gridview1.Rows(i).Cells(3).Text)
            liner_sealno = Server.HtmlDecode(Gridview1.Rows(i).Cells(4).Text)
            cust_sealno = Server.HtmlDecode(Gridview1.Rows(i).Cells(5).Text)
            blockno = Server.HtmlDecode(Gridview1.Rows(i).Cells(6).Text)
            noof_blocks = Server.HtmlDecode(Gridview1.Rows(i).Cells(7).Text)
            cbm = Server.HtmlDecode(Gridview1.Rows(i).Cells(8).Text)
            total_weight = Server.HtmlDecode(Gridview1.Rows(i).Cells(9).Text)

            sql = "insert into granite_container_no(refno,container_no,size,liner,liner_sealno,cust_sealno,blockno,noof_blocks,cbm,total_weight)values('" + refno + "','" + container_no + "','" + size + "'," & _
                   "'" + liner + "','" + liner_sealno + "','" + cust_sealno + "','" + blockno + "','" & noof_blocks & "','" & cbm & "','" & total_weight & "')"
            result.Add(sql)
        Next
        Return result

    End Function

    Private Sub Edit_Click(sender As Object, e As System.EventArgs) Handles Edit.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                cmd.CommandText = "select Refno,sb_no from granite_packinglistheader where packing_vesselname = '" & vname.Text & "' and packing_list_type='C' and job_completion_flag=0"
                cmd.Connection = con
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    gvvessel.DataSource = dt
                    gvvessel.DataBind()
                End Using
            End Using
        End Using
        Me.lbledit.Text = "EDITING SHIPPING BILL NO:"
        Me.lblrefno.Text = ""
        Me.lblvenam.Text = Me.vname.Text

    End Sub
End Class

