<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showdb_gridview.aspx.cs" Inherits="showdb_gridview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet_call %>"
                SelectCommand="SELECT * FROM [Employee] WHERE ([emp001] = @emp001)" 
                DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001"
                InsertCommand="INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006], [emp007], [emp008], [emp009]) VALUES (@emp002, @emp003, @emp004, @emp005, @emp006, @emp007, @emp008, @emp009)" 
                UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002, [emp003] = @emp003, [emp004] = @emp004, [emp005] = @emp005, [emp006] = @emp006, [emp008] = @emp008, [emp009] = @emp009 
                                                WHERE [emp001] = @emp001">
                <DeleteParameters>
                    <asp:Parameter Name="emp001" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="emp002" Type="String" />
                    <asp:Parameter Name="emp003" Type="String" />
                    <asp:Parameter Name="emp004" Type="String" />
                    <asp:Parameter Name="emp005" Type="DateTime" />
                    <asp:Parameter Name="emp006" Type="String" />
                    <asp:Parameter Name="emp007" Type="Object" />
                    <asp:Parameter Name="emp008" Type="String" />
                    <asp:Parameter Name="emp009" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="emp001" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="emp002" Type="String" />
                    <asp:Parameter Name="emp003" Type="String" />
                    <asp:Parameter Name="emp004" Type="String" />
                    <asp:Parameter Name="emp005" Type="DateTime" />
                    <asp:Parameter Name="emp006" Type="String" />
                    <asp:Parameter Name="emp008" Type="String" />
                    <asp:Parameter Name="emp009" Type="Int32" />
                    <asp:Parameter Name="emp001" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="emp001" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="emp001" HeaderText="emp001" InsertVisible="False" ReadOnly="True" SortExpression="emp001" />
                <asp:BoundField DataField="emp002" HeaderText="emp002" SortExpression="emp002" />
                <asp:BoundField DataField="emp003" HeaderText="emp003" SortExpression="emp003" />
                <asp:BoundField DataField="emp004" HeaderText="emp004" SortExpression="emp004" />
                <asp:BoundField DataField="emp005" HeaderText="emp005" SortExpression="emp005" />
                <asp:BoundField DataField="emp006" HeaderText="emp006" SortExpression="emp006" />
                <asp:BoundField DataField="emp008" HeaderText="emp008" SortExpression="emp008" />
                <asp:BoundField DataField="emp009" HeaderText="emp009" SortExpression="emp009" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </form>
</body>
</html>
