using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Clear_Textbox(object sender, EventArgs e)
    {
        TextBox[] ThisPageTextBox = { this.TextBox1, this.TextBox2, this.TextBox3, this.TextBox5 };
        foreach (TextBox t in ThisPageTextBox)
            t.Text = "";
    }

 protected void Button1_Click(object sender, EventArgs e)
    {
        //設定連線的SQLDATASOURCE
        if (!javascript_check()) {
            return;
        }
        sysdb append_emp = new sysdb();
        append_emp.Inserted += new SqlDataSourceStatusEventHandler(this.Clear_Textbox);
        append_emp.InsertCommand = "INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006],  [emp008], [emp009]) " +
            "VALUES (@emp002, @emp003, @emp004, @emp005, @emp006,  @emp008, @emp009)";
        append_emp.InsertParameters.Add("emp002", TextBox1.Text);
        append_emp.InsertParameters.Add("emp003", TextBox2.Text);
        append_emp.InsertParameters.Add("emp004", DropDownList1.SelectedValue);
        append_emp.InsertParameters.Add("emp005", TextBox3.Text);
        append_emp.InsertParameters.Add("emp006", DropDownList3.SelectedValue);
        append_emp.InsertParameters.Add("emp008", TextBox5.Text);
        append_emp.InsertParameters.Add("emp009", DropDownList2.SelectedValue);
        try
        {
            append_emp.Insert();
            showmsg("新增成功");
        }
        catch (Exception)
        {
            showmsg("新增失敗");
        }
    }

    public void showmsg(string msg)
    {
        Literal txtMsg = new Literal();

        txtMsg.Text = "<script> alert('" + msg +"') </script>" + "<BR/>";

        this.Controls.Add(txtMsg);


    }


    public bool javascript_check() {




        return true;
    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        this.Clear_Textbox(sender, e);
    }
}