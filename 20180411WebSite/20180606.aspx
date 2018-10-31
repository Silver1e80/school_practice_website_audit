<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="20180606.aspx.cs" Inherits="_20180606" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="emp002" DataValueField="emp001">
        </asp:DropDownList>
        <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Button" OnClientClick="Button2_Click" />
        <br />
    </p>
    <p>
        姓名:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        姓別 <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
        身分證字號<asp:TextBox ID="TextBox2" runat="server" Width="198px"></asp:TextBox>
        生日:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        職稱:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="emptitle_002" DataValueField="emptitle_001">
        </asp:DropDownList>
    </p>
    <p>
        地址:<asp:TextBox ID="TextBox5" runat="server" Width="780px"></asp:TextBox>
    </p>
    <p>
        直屬上司<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="emp002" DataValueField="emp001">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClientClick="if(check_data()==false){return false;}" UseSubmitBehavior="False" 
            Text="存檔" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button1" />
    </p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [emp001], [emp002] FROM [Employee]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString2 %>" SelectCommand="SELECT [emp001], [emp002] FROM [Employee]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString2 %>" SelectCommand="SELECT [emptitle_001], [emptitle_002] FROM [EmpTitle]">
    </asp:SqlDataSource>
    </asp:Content>

