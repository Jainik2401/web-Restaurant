Imports System.Data.OleDb
Public Class Conclass

    'connection class 

    Dim str As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=G:\College\SEM5\Restaurant\Restaurant\App_Data\restaurant.accdb;Persist Security Info=True"
    Public cn As New OleDbConnection(str)

End Class
