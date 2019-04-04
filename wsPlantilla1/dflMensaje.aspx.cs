using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int Id;
    clsClase obj = new clsClase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Id = int.Parse(Request.QueryString["ID"]);
            try
            {
                int id = Id;
                string[] dat = obj.buscarUsuario(Id, Application["cnn"].ToString()).ElementAt(0);
                txtNombre.Text = dat[0];
                txtTel.Text = dat[1];
                imgFoto.ImageUrl = dat[2];

            }
            catch (ArgumentNullException ex)
            {
                Response.Write("<script language ='javascript'>alert('Sin id');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language ='javascript'>alert('ERROR');</script>");
            }
        }

    }

    protected void btnSeleccionar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language ='javascript'>document.location.href='dflCalendario1.aspx';</script>");
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language = 'javascript' > javascript: window.open('https://api.whatsapp.com/send?phone=52"+txtTel.Text+"&text=Saludos, "+ txtNombre.Text+" tengo un mensaje para ti: "+ txtMensaje.Text +"', 'popup', 'width=700px, height=700px'); </script>");
           
    }
}