<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="請輸入訂單編號"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="呼叫訂單" />
            <hr />
        </div>
        <p>
            單頭<br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField SelectText="詳細資料" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="order_id" HeaderText="訂單編號" InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                    <asp:TemplateField HeaderText="客戶資料" SortExpression="customer_id">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Cname" DataValueField="customer_id" SelectedValue='<%# Bind("customer_id") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Cname" DataValueField="customer_id" Enabled="False" SelectedValue='<%# Bind("customer_id") %>'>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Caddress" DataValueField="customer_id" Enabled="False">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="CcellPhone" DataValueField="customer_id" Enabled="False">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="order_date" HeaderText="訂購日期" SortExpression="order_date" />
                    <asp:BoundField DataField="employee_id" HeaderText="處理員工代碼" SortExpression="employee_id" ReadOnly="True" />
                    <asp:BoundField DataField="finish_date" HeaderText="訂單處理日期" SortExpression="finish_date" ReadOnly="True" />
                </Columns>
            </asp:GridView>
        </p>
        <hr />
        <br />
        單身<br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="body_id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="order_id" HeaderText="單身編號" SortExpression="order_id" ReadOnly="True" />
                <asp:TemplateField HeaderText="產品資料" SortExpression="product_id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_item" DataValueField="product_id">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_price" DataValueField="product_id">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("product_id") %>'></asp:Label>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_item" DataValueField="product_id">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_price" DataValueField="product_id">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product_amount" HeaderText="訂購數量" SortExpression="product_amount" />
                <asp:BoundField DataField="count_price" HeaderText="小計" SortExpression="count_price" ReadOnly="True" />
            </Columns>
            <EmptyDataTemplate>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Order_head] WHERE [order_id] = @order_id" 
            InsertCommand="INSERT INTO [Order_head] ([customer_id], [order_date], [employee_id], [finish_date]) VALUES (@customer_id, @order_date, @employee_id, @finish_date)"
            SelectCommand="SELECT * FROM [Order_head] WHERE ([order_id] = @order_id)" 
            UpdateCommand="UPDATE [Order_head] SET [customer_id] = @customer_id, [order_date] = @order_date, [employee_id] = @employee_id, [finish_date] = getdate() WHERE [order_id] = @order_id">
            <DeleteParameters>
                <asp:Parameter Name="order_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customer_id" Type="Int32" />
                <asp:Parameter Name="order_date" Type="DateTime" />
                <asp:Parameter Name="employee_id" Type="Int32" />
                <asp:Parameter Name="finish_date" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="order_id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="customer_id" Type="Int32" />
                <asp:Parameter Name="order_date" Type="DateTime" />
                <asp:Parameter Name="employee_id" Type="Int32" />
                <asp:Parameter Name="finish_date" Type="DateTime" />
                <asp:Parameter Name="order_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Order_body] WHERE [body_id] = @body_id" InsertCommand="INSERT INTO [Order_body] ([order_id], [product_id], [product_amount], [count_price]) VALUES (@order_id, @product_id, @product_amount, @count_price)" SelectCommand="SELECT * FROM [Order_body] WHERE ([order_id] = @order_id)" UpdateCommand="UPDATE [Order_body] SET [order_id] = @order_id, [product_id] = @product_id, [product_amount] = @product_amount, [count_price] = @count_price WHERE [body_id] = @body_id">
            <DeleteParameters>
                <asp:Parameter Name="body_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="order_id" Type="Int32" />
                <asp:Parameter Name="product_id" Type="Int32" />
                <asp:Parameter Name="product_amount" Type="Int32" />
                <asp:Parameter Name="count_price" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="order_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="order_id" Type="Int32" />
                <asp:Parameter Name="product_id" Type="Int32" />
                <asp:Parameter Name="product_amount" Type="Int32" />
                <asp:Parameter Name="count_price" Type="Double" />
                <asp:Parameter Name="body_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [product_id], [product_item], [product_price] FROM [product]"></asp:SqlDataSource>
    </form>
</body>
</html>
