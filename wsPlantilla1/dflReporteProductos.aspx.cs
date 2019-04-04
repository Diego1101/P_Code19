using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class dflReporteProductos : System.Web.UI.Page
{
    //copia de la clase
    clsClase objDatos = new clsClase();
    //declarr dataset local de la pagina
    DataSet dsTipoEmp;
    //variables para el manejo de la fotografía
    int claveProd;
    string ruta = "", foto = "";
    ReportDocument rptVtaCliente;
    ReportDocument rptCliente;
    DataSet dsCliemtes;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnVisualizar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language ='javascript'> alert ('hola'); </script>");
        ds = new DataSet();
        clsClase objDatos = new clsClase();
        rptCliente = new ReportDocument();
        rptCliente.Load(Server.MapPath("crProductos.rpt"));
        ds = new DataSet();
        ds = objDatos.producto(Application["cnn"].ToString());
        rptCliente.SetDataSource(ds.Tables[0]);
        rptCliente.SetDatabaseLogon("sa", "geovanna", @"DESKTOP-2KICEDR_1", "BD_ELECTRO");
        crvProductos.ReportSource = rptCliente;
        crvProductos.DataBind();
        Response.Write("<script language ='javascript'> alert ('adios');</script>");
    }
}