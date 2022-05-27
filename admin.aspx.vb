Imports System.Data.OleDb
Public Class admin1
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim admin, pass, sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        loginError.Text = ""
        objcn.cn.Open()
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
      
        Try
            Sql = "select AdminID,Password from Admin where AdminID='" & txtUID.Text & "'"
            cmd = New OleDbCommand(Sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                admin = dr("AdminID").ToString()
                pass = dr("Password").ToString()
                If (txtPass.Text = pass) Then

                    Response.Redirect("orders.aspx", False)
                Else
                    loginError.Text = "Invalid Admin Id or password"
                End If
            Else
                loginError.Text = "Invalid Admin Id or password"
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class