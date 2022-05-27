Imports System.Data.OleDb
Public Class register1
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim Uid As New Integer
    Dim sql As String

    Protected Sub clear()
        txtAdd.Text = ""
        txtFname.Text = ""
        txtContact.Text = ""
        txtCpass.Text = ""
        txtlname.Text = ""
        txtmail.Text = ""
        txtPass.Text = ""

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sql = "SELECT max(UserID) as maxID from User_data"
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
                Uid = dr(0).ToString + 1
            Else
                Uid = 1001

            End If
            objcn.cn.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnRegister.Click
        sql = "Insert into User_data values (" & Uid & ",'" & txtFname.Text & "','" & txtlname.Text & "','" & txtmail.Text & "','" & txtContact.Text & "','" & txtAdd.Text & "','" & "~\Images\" & proImg.FileName.ToString & "','" & txtPass.Text & "')"
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("You have registerd successfully. Login again to Continue.")
            objcn.cn.Close()

            Response.Redirect("login.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnReset.Click
        clear()

    End Sub

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnlogin.Click
        Response.Redirect("login.aspx", False)
    End Sub
End Class