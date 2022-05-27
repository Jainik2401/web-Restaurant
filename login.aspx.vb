Imports System.Data.OleDb
Public Class login1
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblErr.Visible = False
        If (Session("uid") Is Nothing) Then

        Else
            Response.Redirect(Session("page"), False)
        End If

    End Sub

    Protected Sub btnLogIn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLogIn.Click
        sql = "SELECT UserID,email,pass from User_data where email='" & txtEmail.Text & "'"
        Try
            objcn.cn.Open()

            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            dr.Read()
            If dr.HasRows Then
                If (dr(2).ToString = txtPass.Text) Then
                    Session("uid") = dr(0).ToString
                    objcn.cn.Close()
                    If (Session("page") Is Nothing) Then
                        Response.Redirect("default.aspx", False)
                    Else
                        Response.Redirect(Session("page"), False)
                    End If
                Else
                    lblErr.Visible = True
                End If
                Else
                    lblErr.Visible = True
                End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnRegister.Click
        Response.Redirect("register.aspx", False)
    End Sub
End Class