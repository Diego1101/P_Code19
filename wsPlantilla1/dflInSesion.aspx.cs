using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    clsClase obj = new clsClase();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        string res = "";

        if (txtUsuario.Text != "" && txtContra.Text != "")
        {
            //ejecuta el método de la clase de acceso
            res = obj.accesoUsuario(txtUsuario.Text, txtContra.Text, Application["cnn"].ToString());
            //error al validar
            if (res != "0")
            {
                Session["Nombre"] = obj.Nombre;
                Session["Clave"] = obj.Clave;
                Session["Rol"] = obj.Rol;
                Session["Usuario"] = obj.Usuario;
                if (Session["Rol"].ToString().Equals("1"))
                {
                    Response.Write("<script language ='javascript'>document.location.href='dflPrincipalAdm.aspx';</script>");
                }
                else if (Session["Rol"].ToString().Equals("2"))
                {
                    Response.Write("<script language ='javascript'>document.location.href='dflPrincipalEmp.aspx';</script>");
                }
                else if (Session["Rol"].ToString().Equals("3"))
                {
                    Response.Write("<script language ='javascript'>document.location.href='dflPrincipal.aspx';</script>");
                }

            }
            else
            {
                Response.Write("<script language ='javascript'> alert ('Acceso denegado');</script>");
                txtUsuario.Text = "";
                txtContra.Text = "";
                txtUsuario.Focus();
            }
        }
        //validar que haya datos en las cajas de texto sino, envia un mensaje 
        else
        {
            Response.Write("<script language ='javascript'> alert ('Debes introducir el usuario o contraseña completos');</script>");
            txtUsuario.Text = "";
            txtContra.Text = "";
            txtUsuario.Focus();
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language ='javascript'>document.location.href='dflPrincipal.aspx';</script>");

    }
}