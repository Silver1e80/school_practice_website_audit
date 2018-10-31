<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formview_demo.aspx.cs" Inherits="formview_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet_call %>" 
                DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001" 
                InsertCommand="INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006], [emp008], [emp009]) VALUES (@emp002, @emp003, @emp004, @emp005, @emp006,  @emp008, @emp009)" 
                SelectCommand="SELECT * FROM [Employee]" 
                UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002, [emp003] = @emp003, [emp004] = @emp004, [emp005] = @emp005, [emp006] = @emp006, [emp007] = @emp007, [emp008] = @emp008, [emp009] = @emp009 WHERE [emp001] = @emp001">
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet_call %>" SelectCommand="SELECT a.emp001 , rtrim(ltrim(b.emptitle_002))+'_'+rtrim(ltrim(a.emp002)) as user_option
  FROM [dbo].[Employee] as a 
   left join EmpTitle as b on a.emp006=b.emptitle_001 
   order by user_option asc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet_call %>" SelectCommand="SELECT [emptitle_001], [emptitle_002] FROM [EmpTitle]"></asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="emp001" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="Black">
                <EditItemTemplate>
                    emp001:
                    <asp:Label ID="emp001Label1" runat="server" Text='<%# Eval("emp001") %>' />
                    <br />
                    emp002:
                    <asp:TextBox ID="emp002TextBox" runat="server" Text='<%# Bind("emp002") %>' />
                    <br />
                    emp003:
                    <asp:TextBox ID="emp003TextBox" runat="server" Text='<%# Bind("emp003") %>' />
                    <br />
                    emp004:
                    <asp:TextBox ID="emp004TextBox" runat="server" Text='<%# Bind("emp004") %>' />
                    <br />
                    emp005:
                    <asp:TextBox ID="emp005TextBox" runat="server" Text='<%# Bind("emp005") %>' />
                    <br />
                    emp006:
                    <asp:TextBox ID="emp006TextBox" runat="server" Text='<%# Bind("emp006") %>' />
                    <br />
                    emp007:
                    <asp:TextBox ID="emp007TextBox" runat="server" Text='<%# Bind("emp007") %>' />
                    <br />
                    emp008:
                    <asp:TextBox ID="emp008TextBox" runat="server" Text='<%# Bind("emp008") %>' />
                    <br />
                    emp009:
                    <asp:TextBox ID="emp009TextBox" runat="server" Text='<%# Bind("emp009") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <InsertItemTemplate>
                    姓名:
                    <asp:TextBox ID="emp002TextBox" runat="server" Text='<%# Bind("emp002") %>' />
                    <br />
                    身份證字號:
                    <asp:TextBox ID="emp003TextBox" runat="server" Text='<%# Bind("emp003") %>' />
                    <br />
                    性別:
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("emp004", "{0}") %>'>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    生日:
                    <asp:TextBox ID="emp005TextBox" runat="server" Text='<%# Bind("emp005") %>' />
                    <br />
                    職稱:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="emptitle_002" DataValueField="emptitle_001" SelectedValue='<%# Bind("emp006") %>'>
                    </asp:DropDownList>
                    <br />
                    地址:
                    <asp:TextBox ID="emp008TextBox" runat="server" Text='<%# Bind("emp008") %>' />
                    <br />
                    直屬主管員工編號:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="user_option" DataValueField="emp001" SelectedValue='<%# Bind("emp009") %>'>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                <ItemTemplate>
                    emp001:
                    <asp:Label ID="emp001Label" runat="server" Text='<%# Eval("emp001") %>' />
                    <br />
                    emp002:
                    <asp:Label ID="emp002Label" runat="server" Text='<%# Bind("emp002") %>' />
                    <br />
                    emp003:
                    <asp:Label ID="emp003Label" runat="server" Text='<%# Bind("emp003") %>' />
                    <br />
                    emp004:
                    <asp:Label ID="emp004Label" runat="server" Text='<%# Bind("emp004") %>' />
                    <br />
                    emp005:
                    <asp:Label ID="emp005Label" runat="server" Text='<%# Bind("emp005") %>' />
                    <br />
                    emp006:
                    <asp:Label ID="emp006Label" runat="server" Text='<%# Bind("emp006") %>' />
                    <br />
                    emp007:
                    <asp:Label ID="emp007Label" runat="server" Text='<%# Bind("emp007") %>' />
                    <br />
                    emp008:
                    <asp:Label ID="emp008Label" runat="server" Text='<%# Bind("emp008") %>' />
                    <br />
                    emp009:
                    <asp:Label ID="emp009Label" runat="server" Text='<%# Bind("emp009") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                </ItemTemplate>
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            </asp:FormView>
        </div>
    </form>
</body>
</html>
