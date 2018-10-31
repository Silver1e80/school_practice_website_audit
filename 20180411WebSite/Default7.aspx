<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="Default7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
                 <script type="text/javascript">
                     function check_data() {
                         var result = true;
                         var txtbox_value = [
                             document.getElementById("<%= TextBox1.ClientID %>").value,
               document.getElementById("<%= TextBox2.ClientID %>").value,
                     document.getElementById("<%= TextBox3.ClientID %>").value,
                     document.getElementById("<%= TextBox5.ClientID %>").value,];

                     var txt_length = [100, 10, 10, 200];
                     var prompt = ['姓名', '身份證字號', '生日', '地址'];
                     if (!dateValidationCheck(txtbox_value[2])) {
                         alert("生日格式錯誤:" + txtbox_value[2]);
                         return false;
                     } //end in-if

                     for (i = 0; i < txtbox_value.length; i++) {
                         if (txtbox_value[i].length == 0) {
                             result = false;
                             alert("字串值不可為空值:" + prompt[i]);
                             break;
                         }
                         if (txtbox_value[i].length > txt_length[i]) {
                             result = false;
                             alert("字串長度太長:" + prompt[i]);
                             break;
                         }

                     } //end for 

                     return result;
                     } // end function

                     function dateValidationCheck(str) {
                         var re = new RegExp("^([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-9]{1,2})$");
                         var strDataValue;
                         var infoValidation = true;

                         if ((strDataValue = re.exec(str)) != null) {
                             var y, m, d;
                             y = parseFloat(strDataValue[1]);
                             if (y <= 0 || y > 9999) { // 年
                                 infoValidation = false;
                             }
                             m = parseFloat(strDataValue[2]);
                             if (m <= 0 || m > 12) { // 月
                                 infoValidation = false;
                             }
                             d = parseFloat(strDataValue[3]);
                             if (d <= 0 || d > 31) { // 日
                                 infoValidation = false;
                             }
                             if (d > 30 && m != 1 && m != 3 && m != 5 && m != 7 && m != 8 && m != 10 && m != 12) { //大月
                                 infoValidation = false;
                             }

                             if (d == 29 && m == 2) {  //2月29 檢查是否為潤年
                                 if (!isLoopYear(y))
                                     infoValidation = false;
                             }

                         } else {
                             infoValidation = false;
                         }

                         if (!infoValidation) {
                             alert('請輸入 YYYY/MM/DD 日期格式或檢查日期合法性');
                         }

                         return infoValidation;
                     }

                     function isLoopYear(year) {
                         if (year != '') {
                             year = parseInt(year);
                             var sDate = year + '-03-01';
                             var tempDate = new Date(sDate);
                             tempDate.setDate(-1);
                             var _d = tempDate.getDate();
                             if (_d == 28) { // 平年
                                 return false;
                             } else if (_d == 29) { // 闰年
                                 return true;
                             }
                         }
                         return false;
                     }

    </script>

    <p>
        <br />
        員工資料新增</p>
    <p>
        姓名:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        性別<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
        身分證字號<asp:TextBox ID="TextBox2" runat="server" Width="198px"></asp:TextBox>
        生日:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        職稱:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="emptitle_002" DataValueField="emptitle_001">
        </asp:DropDownList>
    </p>
    <p>
        地址:<asp:TextBox ID="TextBox5" runat="server" Width="780px"></asp:TextBox>
    </p>
    <p>
        直屬上司<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="emp001">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClientClick="if(check_data()==false){return false;}" UseSubmitBehavior="False" 
            OnClick="Button1_Click" Text="存檔" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT * FROM [EmpTitle]"></asp:SqlDataSource>
    </p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001" InsertCommand="INSERT INTO [Employee] ([emp002]) VALUES (@emp002)" SelectCommand="SELECT emp001, emp002, STR(emp001) + '|' + emp002 AS Expr1 FROM Employee" UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002 WHERE [emp001] = @emp001">
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
    <p>
    </p>
</asp:Content>

