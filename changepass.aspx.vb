Imports System.Data.OleDb
Public Class changepass
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("uid") Is Nothing) Then
            Session("page") = "profile.aspx"
            Response.Redirect("login.aspx", False)

        End If
        lblerror.Visible = False
    End Sub

    Protected Sub btnChange_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnChange.Click
        sql = "select pass from User_data where UserID=" & Session("uid") & ""
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.HasRows Then
                dr.Read()
                If (txtold.Text = dr(0).ToString) Then
                    sql = "Update User_data set pass='" & txtPass.Text & "'"
                    Try
                        cmd = New OleDbCommand(sql, objcn.cn)
                        cmd.ExecuteNonQuery()
                        MsgBox("Password changed Succcessfully.")
                        Session.RemoveAll()
                        objcn.cn.Close()
                        Response.Redirect("login.aspx", False)
                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try
                Else
                    lblerror.Visible = True
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class