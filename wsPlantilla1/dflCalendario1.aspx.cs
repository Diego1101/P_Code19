using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    //copia de la clase
    clsClase objDatos = new clsClase();
    //declarr dataset local de la pagina
    DataSet ds;
    //variables para el manejo de la fotografía
    int claveProd;
    string ruta = "", foto = "";

    void llenarGrid()
    {
        //impia el data set 
        ds = new DataSet();
        //ejecuta el método de la clase qu trae a los empleados
        ds = objDatos.listarUsuarios(Application["cnn"].ToString());
        //se asignan los registros de grid 
        gvUsuarios.DataSource = ds;
        //Se asigna el nombre del alias de los registros que se dio en la clase
        gvUsuarios.DataMember = "UsuariosRegistrados";
        //permite que se muestren los datos
        gvUsuarios.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenarGrid();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language ='javascript'>document.location.href='dflMensaje.aspx';</script>");

    }

    protected void gvUsuarios_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }

    protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsuarios.PageIndex = e.NewPageIndex;
        llenarGrid();
    }


}