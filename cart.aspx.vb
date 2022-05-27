Imports System.Data.OleDb
Public Class cart
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("page") = "cart.aspx"
        If (Session("uid") Is Nothing) Then
            Response.Redirect("login.aspx", False)
        Else

            objcn.cn.Open()
            sql = "select Status from Cart where UserID=" & Session("uid") & " and Status='pending'"
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                sql = "select sum(Amount) as total from Cart where Status='pending' and UserID=" & Session("uid") & ""
                cmd = New OleDbCommand(sql, objcn.cn)
                dr = cmd.ExecuteReader
                dr.Read()
                lblTotal.Text = dr(0).ToString
            Else
                btnCheck.Visible = False
            End If

            objcn.cn.Close()
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.SelectedIndexChanged
        sql = "delete from Cart where ID=" & GridView1.SelectedRow.Cells(0).Text & ""
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            objcn.cn.Close()
            Response.Redirect("cart.aspx", False)

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click
        Response.Redirect("menu.aspx", False)
    End Sub

    Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCheck.Click
        Response.Redirect("checkout.aspx", False)
    End Sub
End Class