Imports System.Data.SqlClient
Imports System.Configuration
Public Class Vessel
    Inherits System.Web.UI.Page
    Dim obj As New ObjClass
    Dim vessel_no, voyage_no, berth_date, net_tonnage, voyage_details, rotation_date, vessel_name, arrival_date, saildate, captain_name, rotation_no, sql,
        message, CheckSql, vesselid, crane_wt_bup1, crane_wt_bup2, crane_wt_bup3, ownhandling As String

   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles Save.Click
        ' Dim vessel_no, voyage_no, berth_date, net_tonnage, voyage_details, rotation_date, vessel_name, arrival_date, sail_date, captain_name, rotation_no, sql, message As String
        Dim successid As Integer
        vessel_no = Me.vesno.Text
        voyage_no = Me.voyno.Text
        berth_date = obj.ConvDtFrmt(Me.brtdt.Text, "yyyy-MM-dd")
        net_tonnage = Me.netton.Text
        voyage_details = Me.voydet.Text
        rotation_date = obj.ConvDtFrmt(Me.rotdt.Text, "yyyy-MM-dd")
        vessel_name = Me.vesnam.Text
        arrival_date = obj.ConvDtFrmt(Me.arrdt.Text, "yyyy-MM-dd")
        captain_name = Me.captain.Text
        rotation_no = Me.rotno.Text
        saildate = obj.ConvDtFrmt(Me.saildt.Text, "yyyy-MM-dd")
        crane_wt_bup1 = Me.cranew1.Text
        crane_wt_bup2 = Me.cranew2.Text
        crane_wt_bup3 = Me.cranew3.Text
        ownhandling = Me.ownhandle.Text
        message = ""
       
        Select Case Me.Save.Text
            Case Is = "Submit"
                sql = "insert into granite_vessel_master(vessel_no,vessel_name,voyage_no,arrival_date,berth_date,saildate,crane_wt_bup1,crane_wt_bup2,crane_wt_bup3,ownhandling,net_tonnage,captain_name,voyage_details,rotation_no,rotation_date,job_completion_flag) values('" + vessel_no + "','" + vessel_name + "'," & _
                            "'" + voyage_no + "','" + arrival_date + "','" + berth_date + "','" + saildate + "','" + crane_wt_bup1 + "','" + crane_wt_bup2 + "','" + crane_wt_bup3 + "','" + ownhandling + "','" + net_tonnage + "'," & _
                            "'" + captain_name + "','" + voyage_details + "','" + rotation_no + "','" + rotation_date + "','0')"
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Inserted Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub
                End If
            Case Is = "Update"

                vesselid = Me.hdid.Value
                sql = "update granite_vessel_master set vessel_no='" + vessel_no + "' ,vessel_name='" + vessel_name + "',voyage_no ='" + voyage_no + "' ,arrival_date='" + arrival_date +
                    "', berth_date ='" + berth_date + "',saildate ='" + saildate + "', crane_wt_bup1 ='" + crane_wt_bup1 + "',crane_wt_bup2 ='" + crane_wt_bup2 + "',crane_wt_bup3='" + crane_wt_bup3 + "', ownhandling ='" + ownhandling + "' , net_tonnage='" + net_tonnage + "',captain_name  ='" + captain_name +
                    "' ,voyage_details ='" + voyage_details + "' , rotation_no='" + rotation_no + "',rotation_date='" + rotation_date + "' where auto_id=" & vesselid
                successid = obj.QueryExecution(sql)
                If (successid) Then
                    message = "Record Updated Successfully"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('something went wrong')", True)
                    Exit Sub

                End If
                Me.Save.Text = "Submit"


        End Select

        Dim url As String = "Vessel.aspx"
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
        vesseldsi.SelectCommand = "select auto_id,vessel_no,vessel_name,voyage_no from granite_vessel_master"
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles clear.Click
        vesno.Text = ""
        voyno.Text = ""
        brtdt.Text = ""
        netton.Text = ""
        voydet.Text = ""
        rotdt.Text = ""
        vesnam.Text = ""
        arrdt.Text = ""
        captain.Text = ""
        rotno.Text = ""
        saildt.Text = ""
        cranew1.Text = ""
        cranew2.Text = ""
        cranew3.Text = ""
        ownhandle.Text = ""



    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvvessel.RowCommand
        Dim vesselid As String
        vesselid = e.CommandArgument

        Select Case e.CommandName
            Case Is = "Edit"

                Dim strcon As String = ConfigurationManager.ConnectionStrings("MydbConn").ConnectionString
                Dim sql As String

                sql = "Select vessel_no,vessel_name,voyage_no,format( arrival_date,'dd/MM/yyyy')as arrival_date,format( berth_date,'dd/MM/yyyy')as berth_date,format( saildate,'dd/MM/yyyy')as saildate,crane_wt_bup1,crane_wt_bup2,crane_wt_bup3,ownhandling,net_tonnage,captain_name,voyage_details,rotation_no,format( rotation_date,'dd/MM/yyyy')as rotation_date from granite_vessel_master where auto_id='" + vesselid + "'"
                Dim getdata As New List(Of String)
                getdata = obj.GetMoreValueFromQuery(sql, 15)

                Me.vesno.Text = getdata.Item(0)
                Me.vesnam.Text = getdata.Item(1)
                Me.voyno.Text = getdata.Item(2)
                Me.arrdt.Text = getdata.Item(3)
                Me.brtdt.Text = getdata.Item(4)
                Me.saildt.Text = getdata.Item(5)
                Me.cranew1.Text = getdata.Item(6)
                Me.cranew2.Text = getdata.Item(7)
                Me.cranew3.Text = getdata.Item(8)
                Me.ownhandle.Text = getdata.Item(9)
                Me.netton.Text = getdata.Item(10)
                Me.captain.Text = getdata.Item(11)
                Me.voydet.Text = getdata.Item(12)
                Me.rotno.Text = getdata.Item(13)
                Me.rotdt.Text = getdata.Item(14)
                Me.hdid.Value = vesselid

                Me.Save.Text = "Update"
            Case Is = "Remove"
                Dim value = obj.GetOneValueFromQuery("SELECT COUNT(*) FROM granite_vessel_master where job_completion_flag=1")

                If (value.ToString = 0) Then

                    obj.QueryExecution("delete from granite_vessel_master where auto_id=" + vesselid + "")

                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Cannot Delete Vessel Details')", True)

                End If
        End Select

        'vesseldsi.SelectCommand = "Select auto_id,vessel_no,vessel_name,voyage_no,format( arrival_date,'dd/MM/yyyy')as arrival_date,format( berth_date,'dd/MM/yyyy')as berth_date,format( saildate,'dd/MM/yyyy')as saildate,crane_wt_bup1,crane_wt_bup2,crane_wt_bup3,ownhandling,net_tonnage,captain_name,voyage_details,rotation_no,format( rotation_date,'dd/MM/yyyy')as rotation_date from granite_vessel_master"

        vesseldsi.SelectCommand = "select auto_id,vessel_no,vessel_name,voyage_no from granite_vessel_master"
    End Sub

    Private Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        'Dim dd As New DataTable
        'dd = obj.getdatatable("SELECT * from granite_vessel_master WHERE vessel_name LIKE '%" + TextBox1.Text + "%'")
        'vesseldsi.DataSource = dd
        'vesseldsi.DataBind()
        vesseldsi.SelectCommand = "SELECT * from granite_vessel_master WHERE vessel_name LIKE '%" + TextBox1.Text + "%'"
    End Sub

    Protected Sub vesseldsi_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles vesseldsi.Selecting

    End Sub
End Class