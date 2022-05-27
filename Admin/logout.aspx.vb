Public Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("id") Is Nothing Then
            Response.Redirect("default.aspx")
        Else
            Session.RemoveAll()
            Response.Redirect("default.aspx")
        End If
    End Sub

End Class