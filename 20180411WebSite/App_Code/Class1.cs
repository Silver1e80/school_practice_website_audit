using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


/// <summary>
/// Class1 的摘要描述
/// </summary>
public class Class1:SqlDataSource
{
    public Class1():base (System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnectionString"].ConnectionString,"")
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
}