Imports System.Data.OleDb
Public Class checkout
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr, dr1 As OleDbDataReader
    Dim sql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("uid") Is Nothing) Then
            Session("page") = "Default.aspx"
            Response.Redirect("login.aspx", False)
        Else
            objcn.cn.Open()
            sql = "select sum(Amount) as total from Cart where Status='pending' and UserID=" & Session("uid") & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            dr.Read()
            lbltotal.Text = dr(0).ToString
            objcn.cn.Close()
        End If
       
    End Sub

    Protected Sub btnPlace_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPlace.Click
        Dim oid, ono, total As Integer
        sql = "select max(OrderID) as oid from Order_details"
        Try
            objcn.cn.Open()
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.HasRows Then
                dr.Read()
                oid = dr(0).ToString + 1
            Else
                oid = 11101
            End If
            sql = "select OrderNo from Cart where Status='pending' and UserID=" & Session("uid") & ""

            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader
            Try
                cmd = New OleDbCommand(sql, objcn.cn)
                dr = cmd.ExecuteReader
                While dr.Read()
                    ono = dr(0).ToString
                    sql = "select sum(Amount) as total from Cart where OrderNo=" & ono & ""
                    cmd = New OleDbCommand(sql, objcn.cn)
                    dr1 = cmd.ExecuteReader
                    dr1.Read()
                    total = dr1(0).ToString
                    sql = "Insert into Order_details values(" & oid & "," & Session("uid") & "," & ono & "," & total & ",'pending',0,'" & Date.Now() & "','completed')"
                    Try
                        cmd = New OleDbCommand(sql, objcn.cn)
                        cmd.ExecuteNonQuery()
                        oid = oid + 1
                        sql = "Update Cart set Status='ordered' where OrderNo=" & ono & ""
                        Try
                            cmd = New OleDbCommand(sql, objcn.cn)
                            cmd.ExecuteNonQuery()
                            MsgBox("Order placed")
                        Catch ex As Exception
                            MsgBox(ex.Message)
                        End Try
                    Catch ex As Exception
                        MsgBox(ex.Message & sql)
                    End Try
                End While
                objcn.cn.Close()
                Response.Redirect("default.aspx", False)
            Catch ex As Exception
                MsgBox(ex.Message & sql & "Loop")
            End Try
        Catch ex As Exception
            MsgBox(ex.Message & sql)
        End Try
    End Sub
End Class