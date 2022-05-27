Imports System.Data.OleDb
Public Class Items
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String
    Dim catId As Integer = 1
    Dim PrId As Integer = 1
    Dim changeId As Integer
    Protected Sub clear()
        txtCat.Text = ""
        txtCID.Text = ""
        txtEditId.Text = ""
        txtEditName.Text = ""
        txtEditPrice.Text = ""
        txtPname.Text = ""
        txtPrice.Text = ""
        txtProId.Text = ""


    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("id") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        objcn.cn.Open()
        panelAdd.Visible = False
        panelEdit.Visible = False
        paneldetails.Visible = False
        panelAddCat.Visible = False
        panelSelect.Visible = False
        Try
            sql = "select CatID from Category"
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            While dr.Read
                catId = dr.Item(0) + 1
            End While
            txtCID.Text = catId
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Try
            sql = "select * from Item"
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            While dr.Read
                PrId = dr.Item(0) + 1
            End While
            txtProId.Text = PrId
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDetails_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDetails.Click
        panelSelect.Visible = True

    End Sub

    Protected Sub btnAddCat_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAddCat.Click
        panelAddCat.Visible = True
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAdd.Click
        panelAdd.Visible = True
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpdate.Click
        Try
            sql = "select * from Item where Item_ID=" & lblItemID.Text & ""

            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                txtEditId.Text = dr(0)
                txtEditName.Text = dr(1)
                txtEditPrice.Text = dr(2)
                selectEditcat.SelectedValue = dr(3)
                panelEdit.Visible = True
            End If
        Catch ex As Exception

        End Try
       
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        Try
            sql = "insert into Category values (" & txtCID.Text & ",'" & txtCat.Text & "')"
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Category Added.")
            clear()
            Response.Redirect("items.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAddItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAddItem.Click
        Try
            sql = "insert into Item values (" & txtProId.Text & ",'" & txtPname.Text & "'," & txtPrice.Text & ",'" & selectID.SelectedValue & "', '" & "~\Images\" & proImg.FileName.ToString & "')"
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Item Added.")
            clear()
            Response.Redirect("Items.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnEditSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditSubmit.Click
        Try
            sql = "update Item set Item_Name='" & txtEditName.Text & "', Item_price=" & txtEditPrice.Text & ",Category='" & selectEditcat.SelectedValue & "' where Item_ID= " & txtEditId.Text & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            If editImage.HasFile = True Then
                sql = "update Item set Img='" & "~\Images\" & editImage.FileName.ToString & "' where Item_ID=" & txtEditId.Text & " "
                cmd = New OleDbCommand(sql, objcn.cn)
                cmd.ExecuteNonQuery()
            End If
            MsgBox("Record updated")
            clear()
            Response.Redirect("Items.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDelete.Click
        Try
            sql = "delete from Item where Item_ID =" & lblItemID.Text & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Item removed")
            Response.Redirect("items.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub tblItem_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles tblItem.SelectedIndexChanged
        paneldetails.Visible = True
        Try
            sql = "select * from Item where Item_ID=" & tblItem.SelectedRow.Cells(1).Text & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                changeId = dr(0)
                lblItemID.Text = dr(0)
                lblProname.Text = dr(1)
                lblPrice.Text = dr(2)
                lblCat.Text = dr(3)
                ItemImg.ImageUrl = dr(4)

            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class