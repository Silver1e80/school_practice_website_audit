<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Employee] WHERE ([emp001] = @emp001)" 
        DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001" 
        InsertCommand="INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006], [emp007], [emp008], [emp009]) VALUES (@emp002, @emp003, @emp004, @emp005, @emp006, @emp007, @emp008, @emp009)" 
        UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002, [emp003] = @emp003, [emp004] = @emp004, [emp005] = @emp005, [emp006] = @emp006, [emp008] = @emp008, [emp009] = @emp009 WHERE [emp001] = @emp001">
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
            <asp:Parameter Name="emp007" Type="Object" />
            <asp:Parameter Name="emp008" Type="String" />
            <asp:Parameter Name="emp009" Type="Int32" />
            <asp:Parameter Name="emp001" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
<p>
    <asp:Label ID="Label1" runat="server" Text="請輸入員工編號"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="確定" />
</p>
<p>
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="emp001" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="emp001" HeaderText="emp001" InsertVisible="False" ReadOnly="True" SortExpression="emp001" />
            <asp:BoundField DataField="emp002" HeaderText="emp002" SortExpression="emp002" />
            <asp:BoundField DataField="emp003" HeaderText="emp003" SortExpression="emp003" />
            <asp:BoundField DataField="emp004" HeaderText="emp004" SortExpression="emp004" />
            <asp:TemplateField HeaderText="emp005" SortExpression="emp005">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("emp005") %>'></asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("emp005") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="emp006" HeaderText="emp006" SortExpression="emp006" />
            <asp:BoundField DataField="emp008" HeaderText="emp008" SortExpression="emp008" />
            <asp:BoundField DataField="emp009" HeaderText="emp009" SortExpression="emp009" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</p>
<p>
</p>
<p>
    &nbsp;</p>
</asp:Content>

