<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001"
            InsertCommand="INSERT INTO [Employee] ([emp002]) VALUES (@emp002)"
            SelectCommand="SELECT emp001, emp002, STR(emp001) + '|' + emp002 AS Expr1 FROM Employee"
            UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002 WHERE [emp001] = @emp001">
            <DeleteParameters>
                <asp:Parameter Name="emp001" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="emp002" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="emp002" Type="String" />
                <asp:Parameter Name="emp001" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="emp001" AutoPostBack="True">
        </asp:DropDownList>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="emp001" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="emp001" HeaderText="emp001" InsertVisible="False" ReadOnly="True" SortExpression="emp001" />
                <asp:BoundField DataField="emp002" HeaderText="emp002" SortExpression="emp002" />
                <asp:BoundField DataField="emp003" HeaderText="emp003" SortExpression="emp003" />
                <asp:BoundField DataField="emp004" HeaderText="emp004" SortExpression="emp004" />
                <asp:BoundField DataField="emp005" HeaderText="emp005" SortExpression="emp005" />
                <asp:BoundField DataField="emp006" HeaderText="emp006" SortExpression="emp006" />
                <asp:BoundField DataField="emp008" HeaderText="emp008" SortExpression="emp008" />
                <asp:BoundField DataField="emp009" HeaderText="emp009" SortExpression="emp009" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT * FROM [Employee] WHERE ([emp001] = @emp001)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="emp001" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

