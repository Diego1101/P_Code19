using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    string Id;
    clsClase obj = new clsClase();


    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            Id = Request.QueryString["ID"];
            llenarTipo();
            try
            {
                int id = int.Parse(Id);
                string[] dat = obj.buscarProducto(Id, 1, Application["cnn"].ToString()).ElementAt(0);

                txtCodigo.Text = dat[1];
                txtCodigo.Enabled = false;
                txtNombre.Text = dat[2];
                dwlTipo.SelectedIndex = int.Parse(dat[8]);
                txtMarca.Text = dat[3];
                txtUnidades.Text = dat[5];
                txtPrecio.Text = dat[6];
                txtDesc.Text = dat[4];
                lblImagen.Text = "~/img/" + dat[7];
                imgbImagen.ImageUrl = lblImagen.Text;

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

    void llenarTipo()
    {
        DataSet ds = obj.listarTipo(Application["cnn"].ToString());


        dwlTipo.DataSource = ds;
        dwlTipo.DataMember = "TIPO";
        dwlTipo.DataValueField = "CLAVE";
        dwlTipo.DataTextField = "NOMBRE";
        dwlTipo.DataBind();

        dwlTipo.Items.Insert(0, "-- Salecciona el tipo --");


    }
}