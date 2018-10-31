using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _20180606 : System.Web.UI.Page
{
    String SecenePK_Key;
    private DataView dv;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.SecenePK_Key = this.DropDownList4.SelectedValue.ToString().Trim();
        if (!get_data(this.SecenePK_Key))
        {
            showmsg("抓不到資料");
        }
        else {
            ShowData(this.SecenePK_Key);
        }
    }
    private bool get_data(string secenePK_Key)
    {
        sysdb db = new sysdb();
        db.SelectCommand = "SELECT [emp001],[emp002] ,[emp003] , [emp004],[emp005] ,[emp006],[emp008] ,[emp009]  ";
        db.SelectCommand += "  FROM[dbo].[Employee] where [emp001]=@emp001 ";
        db.SelectParameters.Add("emp001", secenePK_Key);
        DataSourceSelectArguments para = new DataSourceSelectArguments();
        this.dv = (DataView)db.Select(para);
        if (this.dv.Count > 0)
            return true;
        else
            return false;
    }
    private void ShowData(string PK)
    {
        this.TextBox1.Text = this.dv[0][1].ToString().Trim(); //姓名
        this.TextBox2.Text = this.dv[0][2].ToString().Trim(); //身分證
        this.TextBox3.Text = this.dv[0][4].ToString().Trim(); //gps_E SD007
        this.TextBox5.Text = this.dv[0][6].ToString().Trim(); //說明文字標題 SD009
        this.DropDownList1.SelectedValue = this.dv[0][3].ToString().Trim(); //性別
        this.DropDownList3.SelectedValue = this.dv[0][5].ToString().Trim(); //所屬職位
        this.DropDownList2.SelectedValue = this.dv[0][7].ToString().Trim(); //直屬上司
        // chk_img(OLD_PK); //檢查是否有圖片要顥示
        
    }

    private void showmsg(string msg)
    {
        
    }
}