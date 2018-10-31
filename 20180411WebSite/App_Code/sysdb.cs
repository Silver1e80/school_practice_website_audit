using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;



/// <summary>
/// sysdb 的摘要描述
/// </summary>
public class sysdb : SqlDataSource
{
    public sysdb() : base(System.Configuration.ConfigurationManager.ConnectionStrings["aspnet_call"].ConnectionString, "")
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
}