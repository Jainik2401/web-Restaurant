Imports System.Data.OleDb
Public Class queries
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("id") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        panelDetails.Visible = False
        panelQueries.Visible = False
        panelAdd.Visible = False
        objcn.cn.Open()

    End Sub

    Protected Sub btnViewpending_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnViewpending.Click
        Session("request") = "pending"
        panelQueries.Visible = True
        btnEditresponse.Visible = False
        btnAddresponse.Visible = True

    End Sub

    Protected Sub btnViewSubmitted_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnViewSubmitted.Click
        Session("request") = "completed"
        panelQueries.Visible = True
        btnAddresponse.Visible = False
        btnEditresponse.Visible = True

    End Sub

    Protected Sub tblQuery_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles tblQuery.SelectedIndexChanged
        panelDetails.Visible = True
        panelQueries.Visible = False
        lblQid.Text = tblQuery.SelectedRow.Cells(0).Text
        lblUid.Text = tblQuery.SelectedRow.Cells(1).Text
        lblSubject.Text = tblQuery.SelectedRow.Cells(2).Text
        lblDesc.Text = tblQuery.SelectedRow.Cells(3).Text
        lblresponse.Text = tblQuery.SelectedRow.Cells(4).Text
        lblDate.Text = tblQuery.SelectedRow.Cells(5).Text
        If Not lblresponse.Text = "N/A" Then
            txtResponse.Text = lblresponse.Text
        End If


        Try
            sql = "select * from User_data where UserID=" & lblUid.Text & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                lbFname.Text = dr(1)
                lblLname.Text = dr(2)
                lblmail.Text = dr(3)
                lblContact.Text = dr(4)
                lblAddress.Text = dr(5)

            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAddresponse_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAddresponse.Click
        panelAdd.Visible = True
        panelDetails.Visible = True
        btnAddresponse.Visible = False
        txtResponse.Text = ""
    End Sub

    Protected Sub btnEditresponse_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditresponse.Click
        panelAdd.Visible = True
        panelDetails.Visible = True
        btnEditresponse.Visible = False
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        Try
            sql = "Update Queries set Solution='" & txtResponse.Text & "', status='completed' where QueryID=" & lblQid.Text & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Response Submitted.")

            Response.Redirect("queries.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class