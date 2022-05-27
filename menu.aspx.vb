Imports System.Data.OleDb
Public Class menu
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String
    Dim uid As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        panelFilter.Visible = False
        panelmain.Visible = True
        Session("page") = "menu.aspx"
    End Sub

    Protected Sub btnApply_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnApply.Click
        panelmain.Visible = False
        Session("cat") = Cat.SelectedValue.ToString
        panelFilter.Visible = True

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancel.Click
        Response.Redirect("menu.aspx", False)
    End Sub


    Protected Sub btnadd_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand, DataList2.ItemCommand
        If (Session("uid") Is Nothing) Then
            Session("page") = "menu.aspx"
            Response.Redirect("login.aspx", False)
        Else
            uid = Session("uid")

            If e.CommandName = "addTocart" Then
                Dim selQty As TextBox = CType((e.Item.FindControl("txtQty")), TextBox)
                Dim price As Label = CType((e.Item.FindControl("Item_priceLabel")), Label)
                Dim pid As Integer = e.CommandArgument
                Dim cid, Ono As Integer
                Dim total As Double
                total = price.Text * selQty.Text
                sql = " Select max(ID) as CID from Cart"
                Try
                    objcn.cn.Open()
                    cmd = New OleDbCommand(sql, objcn.cn)
                    dr = cmd.ExecuteReader
                    If dr.Read Then
                        cid = dr(0).ToString + 1
                    Else
                        cid = 101
                    End If
                    sql = "select OrderNo from Cart where Status='pending' and UserID=" & uid & ""
                    Try
                        cmd = New OleDbCommand(sql, objcn.cn)
                        dr = cmd.ExecuteReader
                        If (dr.Read) Then
                            Ono = dr(0)
                        Else
                            sql = "select max(OrderNo) as odn from Cart"
                            Try
                                cmd = New OleDbCommand(sql, objcn.cn)
                                dr = cmd.ExecuteReader
                                If dr.Read Then
                                    Ono = dr(0).ToString + 1
                                Else
                                    Ono = 1101
                                End If
                            Catch ex As Exception
                                MsgBox(ex.Message & sql)
                            End Try
                        End If
                        sql = "insert into cart values (" & cid & ", " & Ono & "," & uid & "," & pid & " ," & selQty.Text & "," & total & ",'pending')"
                        Try
                            cmd = New OleDbCommand(sql, objcn.cn)
                            cmd.ExecuteNonQuery()
                            MsgBox("Added to cart")
                            objcn.cn.Close()
                            Response.Redirect("menu.aspx", False)
                        Catch ex As Exception
                            MsgBox(ex.Message & sql)
                        End Try
                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try

                Catch ex As Exception
                    MsgBox(ex.Message & sql)
                End Try
            End If
        End If
    End Sub
End Class