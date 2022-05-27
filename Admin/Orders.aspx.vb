Imports System.Data.OleDb
Public Class Orders
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim adp As New OleDbDataAdapter
    Dim ds As New DataSet
    Dim sql, a As String
    Dim uid, cid, oid As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("id") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        panelpending.Visible = False
        paneldetails.Visible = False
        panelcanceled.Visible = False
        panelCompOrder.Visible = False
        objcn.cn.Open()
    End Sub

    Protected Sub btnview_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnview.Click
        If type.SelectedValue = "pending" Then
            panelpending.Visible = True
            btnDeleteOrder.Visible = False
        Else
            btnDeleteOrder.Visible = True
            btnComp.Visible = False
            paneldetails.Visible = True
            If type.SelectedValue = "canceled" Then
                lbltype.Text = "Cancelled orders:"
            Else
                lbltype.Text = "Completed orders:"
            End If
        End If
    End Sub

    Protected Sub cancelled_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles cancelled.SelectedIndexChanged
        uid = cancelled.SelectedRow.Cells(1).Text
        cid = cancelled.SelectedRow.Cells(2).Text
        lblCartid.Text = cid
        lblOrderID.Text = cancelled.SelectedRow.Cells(0).Text
        lbltotal.Text = cancelled.SelectedRow.Cells(3).Text
        lbldate.Text = cancelled.SelectedRow.Cells(4).Text
        Session("cartID") = cid
        Try
            sql = "select * from User_data where UserID=" & uid & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                lbluid.Text = dr(0)
                lblFname.Text = dr(1)
                lbllname.Text = dr(2)
                lblmail.Text = dr(3)
                lblAddress.Text = dr(5)
                lblContact.Text = dr(4)
            End If
            panelcanceled.Visible = True
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub tblpending_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles tblpending.SelectedIndexChanged
        uid = tblpending.SelectedRow.Cells(1).Text
        cid = tblpending.SelectedRow.Cells(2).Text
        lblCartid.Text = cid
        lblOrderID.Text = tblpending.SelectedRow.Cells(0).Text
        lbltotal.Text = tblpending.SelectedRow.Cells(4).Text
        lbldate.Text = tblpending.SelectedRow.Cells(3).Text
        Session("cartID") = cid
        Try
            sql = "select * from User_data where UserID=" & uid & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                lbluid.Text = dr(0)
                lblFname.Text = dr(1)
                lbllname.Text = dr(2)
                lblmail.Text = dr(3)
                lblAddress.Text = dr(5)
                lblContact.Text = dr(4)
            End If
            panelcanceled.Visible = True

            btnComp.Visible = True
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnComp_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnComp.Click
        panelCompOrder.Visible = True
        btnComp.Visible = False
        panelcanceled.Visible = True
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        oid = lblOrderID.Text
        a = "completed"
        Try
            cartdetails.Dispose()
            tblpending.Dispose()
            sql = "Update Order_details set Status='" & a & "' ,Employee=" & EmpID.SelectedValue & " where OrderID=" & oid & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Order completed")
            Response.Redirect("Orders.aspx", False)
        Catch ex As Exception
            MsgBox(sql & ex.Message)
        End Try
    End Sub

    Protected Sub btnDeleteOrder_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDeleteOrder.Click
        oid = lblOrderID.Text
        Try
            sql = "delete from Order_details where OrderID=" & oid & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Order deleted")
            Response.Redirect("Orders.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class