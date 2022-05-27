Imports System.Data.OleDb
Public Class contact
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim sql As String
    Dim dr As OleDbDataReader
    Dim qid As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("page") = "contact.aspx"
    End Sub

    Protected Sub BubtnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BubtnSubmit.Click
        If (Session("uid") Is Nothing) Then
            Response.Redirect("login.aspx", False)
        Else
            sql = "select max(QueryID) as qid from Queries"
            Try
                objcn.cn.Open()
                cmd = New OleDbCommand(sql, objcn.cn)
                dr = cmd.ExecuteReader
                dr.Read()
                qid = dr(0) + 1
                sql = "insert into Queries values(" & qid & "," & Session("uid") & ",'" & txtSub.Text & "','" & txtdetail.Text & "','N/A','pending','" & Date.Now() & "')"
                Try
                    cmd = New OleDbCommand(sql, objcn.cn)
                    cmd.ExecuteNonQuery()
                    MsgBox("Response Submitted")
                    Response.Redirect("default.aspx", False)
                Catch ex As Exception
                    MsgBox(ex.Message & sql)
                End Try
                objcn.cn.Close()
                txtdetail.Text = ""
                txtSub.Text = ""
            Catch ex As Exception
                
                MsgBox(ex.Message)
            End Try
        End If
    End Sub
End Class