Public Class Repcoringletter
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Private _p1 As String

    Sub New(ByVal p1 As String)
        ' TODO: Complete member initialization 
        _p1 = p1
    End Sub

    Sub New()
        ' TODO: Complete member initialization 
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim covering_no As String = Request.QueryString("coverno")

        Dim dt As New DataTable
        'Dim custname As String
        Dim html As New StringBuilder()
        Dim shipper_name As String = obj.GetOneValueFromQuery("select shipper_name from granite_headercoveringletter where covering_no='" + covering_no + "'")
        Dim vessel_name1 As String = obj.GetOneValueFromQuery("select vessel_name from granite_headercoveringletter  where covering_no='" + covering_no + "'")
        Me.vesselname.Text = vessel_name1
        Me.cusname.Text = shipper_name
        Dim getdata = obj.GetMoreValueFromQuery("select shipper_contactperson,shipper_city from granite_shipper_master where shipper_name='" + shipper_name + "'", 2)
        Me.contact.Text = getdata(0)
        Me.city.Text = getdata(1)
        Dim entrydate As String = obj.GetOneValueFromQuery("select entrydate from granite_headercoveringletter where covering_no='" + covering_no + "'")
        Me.docdate.Text = obj.ConvDtFrmt(entrydate, "dd/MM/yyyy")
        dt = obj.getdatatable("select covering_desc,job_desc from granite_detailtable where covering_no='" + covering_no + "'")
        html.Append("<table width='60%' cellpadding='10' style ='font-size:13px;font-family:arial;'>")
        For i = 0 To dt.Rows.Count - 1
            html.Append("<tr>")
            For j = 0 To dt.Columns.Count - 1
                html.Append("<td>")
                'html.Append("<br/>")
                html.Append(dt.Rows(i).Item(j).ToString)
                html.Append("</td>")
            Next
            html.Append("</tr>")
        Next
        html.Append("</table>")

        html.Append("<u><b>SB.NO(s)</b></u>")
        'Dim getdata1 = obj.GetMoreValueFromQuery("select sno1,sib_no,marks from granitecoveringletter_shippingdetails where covering_no='" + covering_no + "'", 3)

        'Me.content.Text = getdata(0) + " / " + getdata(1)
        dt = obj.getdatatable("select sno1,sib_no,CONVERT(VARCHAR(10), sb_date, 105),marks from granitecoveringletter_shippingdetails where covering_no='" + covering_no + "'")
        html.Append("<table style ='font-size:13px;font-family:arial;'>")
        'html.Append("<th>S.No</th><th>SB.No</th><th>SB Date</th><th>Marks</th>")
        For i = 0 To dt.Rows.Count - 1
            html.Append("<tr>")
            For j = 0 To dt.Columns.Count - 1
                html.Append("<td>")
                'html.Append("<br/>")                 
                html.Append(dt.Rows(i).Item(j).ToString)
                If j = 0 Then
                    html.Append("<b>.</b>")
                End If

                If j = 1 Then
                    html.Append("<b> / </b>")
                End If
                html.Append("</td>")
            Next
                html.Append("</tr>")
            Next
        html.Append("</table>")
        'Dim f2 As New Covering_Letter
        'Me.content1.Text = f2.TextBox5.Text


        'dt = obj.getdatatable("select sb_no,sb_date from granite_packinglistheader where covering_no='" + covering_no + "'")
        'html.Append("<table width='60%' cellpadding='10' style ='font-size:13px;font-family:arial;'>")
        'For i = 0 To dt.Rows.Count - 1
        '    html.Append("<tr>")
        '    For j = 0 To dt.Columns.Count - 1
        '        html.Append("<td>")
        '        'html.Append("<br/>")
        '        html.Append(dt.Rows(i).Item(j).ToString)
        '        html.Append("</td>")
        '    Next
        '    html.Append("</tr>")
        'Next
        'html.Append("</table>")

        'Dim sbno As New List(Of String)
        'html.Append("<table width='60%' cellpadding='10' style ='font-size:13px;font-family:arial;'>")
        'sbno = obj.getcolumndatafromquery("select sh_billno from granite_shippingdetail where covering_no='" + covering_no + "'")
        ''dt = obj.getdatatable("select covering_desc,job_desc from granite_detailtable where covering_no='" + covering_no + "'")
        'html.Append("<tr>")
        'html.Append("<td>")
        'html.Append(sbno)
        'html.Append("</td>")
        'html.Append("<td>")
        'html.Append("<tr>")
        'html.Append("</table>")


        'Dim sbno As New List(Of String)
        ''sbno = "select sh_billno from granite_shippingdetail where covering_no='" + covering_no + "'"
        'sbno = obj.getcolumndatafromquery("select sh_billno from granite_shippingdetail where covering_no='" + covering_no + "'")
        'Dim shbillnoDetails As New List(Of String)
        'html.Append("<table width='80%' style ='font-size:13px; font-family:arial;'>")
        'For i = 0 To sbno.Count - 1
        '    shbillnoDetails = obj.GetMoreValueFromQuery("select invoice_no,packing_marks,total_blocknumber,invoice_date ,sb_date" & _
        '                                                "from granite_packinglistheader where sb_no='" + sbno(i) + "'", 4)
        '    html.Append("<tr>")
        '    html.Append("<td>")
        '    html.Append(sbno(i))
        '    html.Append("</td>")
        '    html.Append("<td>")
        '    html.Append(shbillnoDetails(4))
        '    html.Append("</td>")
        '    html.Append("<td>")
        '    html.Append(shbillnoDetails(0))
        '    html.Append("</td>")
        '    html.Append("<td>")
        '    html.Append(shbillnoDetails(3))
        '    html.Append("</td>")
        '    html.Append("<td>")
        '    html.Append(shbillnoDetails(1))
        '    html.Append("</td>")
        '    html.Append("<td>")
        '    html.Append(shbillnoDetails(2) + " Blocks")
        '    html.Append("</td>")

        '    html.Append("</tr>")
        'Next



        html.Append("</table>")
        format.Controls.Add(New Literal() With { _
           .Text = html.ToString() _
         })

    End Sub
    ''Public Sub New(ByVal value As String)

    ''    ' This call is required by the designer.
    ''    InitializeComponent()

    ''    content1.Text = value

    ''End Sub
    'Public Property MyProperty() As String
    '    Get
    '        Return content1.Text
    '    End Get
    '    Set(ByVal value As String)
    '        content1.Text = value
    '    End Set
    'End Property

    'Sub Show()
    '    Throw New NotImplementedException
    'End Sub

    
End Class