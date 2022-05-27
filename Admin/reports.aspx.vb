Public Class reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("id") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        panelCust.Visible = False
        panelEmp.Visible = False
        panelItem.Visible = False
        panelorder.Visible = False
        panelQue.Visible = False


    End Sub

    Protected Sub btnCust_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCust.Click
        panelCust.Visible = True

    End Sub

    Protected Sub btnOrder_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnOrder.Click
        panelorder.Visible = True
    End Sub

    Protected Sub btnQueries_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnQueries.Click
        panelQue.Visible = True
    End Sub

    Protected Sub btnitem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnitem.Click
        panelItem.Visible = True

    End Sub

    Protected Sub btnEmp_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEmp.Click
        panelEmp.Visible = True
    End Sub
End Class