Imports System.Data.OleDb
Public Class employees
    Inherits System.Web.UI.Page
    Dim objcn As New Conclass
    Dim dr, dr1, Editdr As OleDbDataReader
    Dim cmd As New OleDbCommand
    Dim Emp_idnew As Integer = 1
    Dim EmpID As Integer = 1
    Dim sql, gender, gender1 As String
    Protected Sub clear()
        gender = ""
        rdeditF.Checked = False
        rdeditF.Checked = False
        txtContact.Text = ""
        txteditcontact.Text = ""
        txtEmpName.Text = ""
        txteditname.Text = ""
        txteditmail.Text = ""
        txtMail.Text = ""
        editdob.Text = ""
        editdoj.Text = ""
        dob.Text = ""
        doj.Text = ""

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        objcn.cn.Open()
        panelAdd.Visible = False
        panelEdit.Visible = False
        panelSelect.Visible = False
        paneldetails.Visible = False

        Try
            cmd = New OleDbCommand("select EmpID from Employee ", objcn.cn)
            dr = cmd.ExecuteReader()
            While dr.Read
                Emp_idnew = dr.Item(0) + 1
                txtID.Text = Emp_idnew
            End While
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
       
        Try

            If rdbuttonMale.Checked = True Then
                gender = "male"
            Else
                gender = "female"
            End If

            sql = "insert into Employee values (" & txtID.Text & ",'" & txtEmpName.Text & "'," & txtContact.Text & ",'" & txtMail.Text & "','" & dob.Text & "','" & gender & "', '" & "~\Images\" & profileImg.FileName.ToString & "','" & doj.Text & "')"
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("record inserted")
            clear()
            cmd.Dispose()
            objcn.cn.Close()
            Response.Redirect("employees.aspx", False)

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub editSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles editSubmit.Click
        Try
            If rdeditM.Checked = True Then
                gender1 = "male"
            Else
                gender1 = "female"
            End If
            sql = "update Employee set EmpName='" & txteditname.Text & "', ContactNo=" & txteditcontact.Text & ",mail='" & txteditmail.Text & "',DOB='" & editdob.Text & "',Gender='" & gender1 & "',DOJ='" & editdoj.Text & "' where EmpID=" & txteditID.Text & ""
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            If editImg.HasFile = True Then

                sql = "update Employee set ProfileImg='" & "~\Images\" & editImg.FileName.ToString & "' where EmpID=" & txteditID.Text & " "
                cmd = New OleDbCommand(sql, objcn.cn)
                cmd.ExecuteNonQuery()
            End If
            MsgBox("Record updated of " & txteditname.Text & ".")
            clear()
            cmd.Dispose()
            objcn.cn.Close()
            Response.Redirect("employees.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDelete.Click
        Try
            sql = "Delete from Employee where EmpID= " & selectID.SelectedValue & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            cmd.ExecuteNonQuery()
            MsgBox("record Deleted")
            cmd.Dispose()
            objcn.cn.Close()
            Response.Redirect("employees.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAdd.Click
        panelAdd.Visible = True
    End Sub

    Protected Sub btnDetails_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDetails.Click
        panelSelect.Visible = True
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpdate.Click

        Try

            sql = "select * from Employee where EmpID = " & selectID.SelectedValue & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            Editdr = cmd.ExecuteReader()
            If Editdr.Read Then
                gender = Editdr(5)
                txteditID.Text = Editdr(0)
                txteditname.Text = Editdr(1)
                txteditcontact.Text = Editdr(2)
                txteditmail.Text = Editdr(3)
                editdob.Text = Editdr(4)
                If gender = "male" Then
                    rdeditM.Checked = True
                Else
                    rdeditF.Checked = True
                End If
                editdoj.Text = Editdr(7)
                panelEdit.Visible = True
            End If
           

        Catch ex As Exception
            MsgBox(ex.Message & sql)
        End Try
    End Sub


    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnView.Click
        Try
            sql = "select * from Employee where EmpID = " & selectID.SelectedValue & " "
            cmd = New OleDbCommand(sql, objcn.cn)
            dr1 = cmd.ExecuteReader()
            If dr1.Read Then
                EmpID = dr1(0)
                lblEmpID.Text = dr1(0)
                lblEname.Text = dr1(1)
                lblContact.Text = dr1(2)
                lblMail.Text = dr1(3)
                lblDOB.Text = dr1(4)
                lblGender.Text = dr1(5)
                lblDOJ.Text = dr1(7)
                profileImage.ImageUrl = dr1(6)
                paneldetails.Visible = True
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    
End Class