using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (this.Menu1.SelectedValue =="0")
        {
            this.MultiView1.ActiveViewIndex = 0;

        }
        else
        {
            this.MultiView1.ActiveViewIndex =1;

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}