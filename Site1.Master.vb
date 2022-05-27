Imports System.Data.OleDb
Public Class Site1
    Inherits System.Web.UI.MasterPage
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String
    Dim uid As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("uid") Is Nothing) Then
            lblProfile.Text = "Log In"

        Else
            uid = Session("uid")
            sql = "Select fname from User_data where UserID=" & uid & " "
            Try
                objcn.cn.Open()
                cmd = New OleDbCommand(sql, objcn.cn)
                dr = cmd.ExecuteReader
                If dr.HasRows Then
                    dr.Read()
                    lblProfile.Text = "Hello, " & dr(0).ToString
                    sql = "select count(ID) as num from cart where UserID=" & Session("uid") & " and Status='pending'"
                    Try
                        cmd = New OleDbCommand(sql, objcn.cn)
                        dr = cmd.ExecuteReader
                        dr.Read()
                        lblCartItem.Text = dr(0).ToString
                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

        End If
    End Sub

End Class