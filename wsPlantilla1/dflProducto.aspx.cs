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

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        string Resultado="";
        string rs;

        if(Session["Clave"].ToString() =="-1") Response.Write("<script language ='javascript'>alert('Es necesario iniciar sesion para contininuar');document.location.href='dflInSesion.aspx';</script>");

        if (Session["Venta"].ToString() == "-1")
        {
            rs=obj.crearVenta(int.Parse(Session["Clave"].ToString()),Application["cnn"].ToString());
            if (rs != "0")
            {
                Resultado += "Se inicio una nueva venta\\n";
                Session["Venta"] = rs;
            }
            else
            {
                Resultado += "Error al iniciar la venta\\n";
                return ;
            }
        }

        try
        {
            rs = obj.agregarCarrito(int.Parse(Session["Venta"].ToString()), int.Parse(Request.QueryString["ID"]), int.Parse(txtCantidad.Text), Application["cnn"].ToString());
            if (rs == "2")
            {
                Resultado += "Existencias insufucientes\\n";
            }
            else if (rs == "1")
            {
                Resultado += "Error en el producto o venta\\n";
            }
            else
            {
                Resultado += "Producto agregado";
                Session["Carr"] = int.Parse(Session["Carr"].ToString())+1;
            }
            
        }
        catch(FormatException ex)
        {
            Resultado += "ERROR en cantidad\\n";
        }
        catch(Exception ex)
        {
            Resultado+= "ERROR\\n";
        }

        Response.Write("<script language ='javascript'>alert(' "+Resultado+" ')</script>");



    }
}