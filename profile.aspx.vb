Imports System.Data.OleDb
Public Class profile
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim uid As Integer
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("uid") Is Nothing) Then
            Session("page") = "Default.aspx"
            Response.Redirect("login.aspx")
        End If
        panelEdit.Visible = False
        panelmain.Visible = True
        uid = Session("uid")
        sql = "Select * from User_data where UserID = " & uid & ""
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            dr.Read()
            lblFname.Text = dr(1).ToString
            lblLname.Text = dr(2).ToString
            proImg.ImageUrl = dr(6).ToString
            lblAdd.Text = dr(5).ToString
            lblMail.Text = dr(3).ToString
            lblContact.Text = dr(4).ToString
            objcn.cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub


    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEdit.Click
        panelEdit.Visible = True
        panelmain.Visible = False
        editImg.ImageUrl = proImg.ImageUrl
        txtFname.Text = lblFname.Text
        txtLname.Text = lblLname.Text
        txtContact.Text = lblContact.Text
        txtAdd.Text = lblAdd.Text
        txtmail.Text = lblMail.Text

    End Sub

    Protected Sub btncancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btncancel.Click
        Response.Redirect("profile.aspx", False)
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSave.Click
        sql = "Update User_data set fname='" & txtFname.Text & "', lname='" & txtLname.Text & "', email='" & txtmail.Text & "',address='" & txtAdd.Text & "', contact_no='" & txtContact.Text & "' where UserID=" & uid & ""
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            If editProimg.HasFile Then
                sql = "Update User_data set proImg='" & "~\Images\" & editProimg.FileName.ToString & "' where UserID=" & uid & ""
                cmd = New OleDbCommand(sql, objcn.cn)
                cmd.ExecuteNonQuery()

            End If
            objcn.cn.Close()
            MsgBox("Profile Updated.")
            Response.Redirect("profile.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class