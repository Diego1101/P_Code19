﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        Session["Busc"] = txtBuscar.Text;
    }

    protected void btnTodo_Click(object sender, EventArgs e)
    {
        txtBuscar.Text = "";
        Session["Busc"] = "";
    }
}