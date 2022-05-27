Imports System.Data.OleDb
Public Class users
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim cmd As New OleDbCommand
    Dim dr As OleDbDataReader
    Dim sql As String

    Protected Sub clear()
        txtEditAdd.Text = ""
        txtEditContact.Text = ""
        txtEditFName.Text = ""

        txtEditLname.Text = ""
        txtEditmail.Text = ""

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("id") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        paneldetails.Visible = False
        panelEdit.Visible = False
        objcn.cn.Open()


    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpdate.Click
        panelSelect.Visible = False
        paneldetails.Visible = False
        txtEditId.Text = lbluid.Text
        txtEditFName.Text = lblFname.Text
        txtEditLname.Text = lbllname.Text
        txtEditContact.Text = lblContact.Text
        txtEditAdd.Text = lblAddress.Text
        txtEditmail.Text = lblmail.Text
        panelEdit.Visible = True
    End Sub

    Protected Sub btnEditSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditSubmit.Click

        Try
            sql = "update User_data set fname='" & txtEditFName.Text & "',lname='" & txtEditLname.Text & "',email='" & txtEditmail.Text & "',contact_no= " & txtEditContact.Text & ",address='" & txtEditAdd.Text & "' where UserID=" & txtEditId.Text & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            If editImage.HasFile Then
                sql = "update User_data set proImg='" & "~\Images\" & editImage.FileName.ToString & "' where UserID=" & txtEditId.Text & " "
                cmd = New OleDbCommand(sql, objcn.cn)
                cmd.ExecuteNonQuery()
            End If
            MsgBox("Record updated of " & lblFname.Text)
            clear()
            Response.Redirect("users.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDelete.Click
        Try
            sql = "delete from user_data where UserID=" & lbluid.Text & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("Record deleted.")
            Response.Redirect("users.aspx", False)

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    
   
    Protected Sub tblCust_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles tblCust.SelectedIndexChanged
        Try
            sql = "select * from User_data where UserID = " & tblCust.SelectedRow.Cells(1).Text & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            dr = cmd.ExecuteReader()
            If dr.Read Then
                lbluid.Text = dr(0)
                lblFname.Text = dr(1)
                lbllname.Text = dr(2)
                lblmail.Text = dr(3)
                lblContact.Text = dr(4)
                lblAddress.Text = dr(5)
                userImg.ImageUrl = dr(6)
                paneldetails.Visible = True

            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

End Class