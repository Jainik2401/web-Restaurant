Public Class logout1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("uid") Is Nothing) Then
            Response.Redirect("default.aspx", False)
        End If
        Session.RemoveAll()
        Response.Redirect("default.aspx", False)
    End Sub

End Class