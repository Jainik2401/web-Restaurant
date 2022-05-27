Imports System.Data.OleDb
Public Class forgot
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        pnlSub.Visible = False
        pnlmain.Visible = True
        lblErr.Visible = False
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        sql = "Select UserID,email,contact_no from User_data where email='" & txtmail.Text & "'"
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()

                If dr(2) = txtCon.Text Then

                    pnlmain.Visible = False
                    pnlSub.Visible = True
                Else
                    lblErr.Visible = True
                End If

            Else
                lblErr.Visible = True

            End If
            objcn.cn.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancel.Click, btnCancel1.Click
        Response.Redirect("login.aspx", False)
    End Sub

    Protected Sub btnChange_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnChange.Click
        sql = "Update User_data set pass='" & txtPass.Text & "' where email='" & txtmail.Text & "'"
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Password Updated.")
            objcn.cn.Close()
            Response.Redirect("login.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class