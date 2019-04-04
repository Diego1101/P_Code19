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
    int id=0;
    clsClase obj = new clsClase();


    protected void Page_Load(object sender, EventArgs e)
    {

        Id = Request.QueryString["ID"];
        if (!IsPostBack)
        {
            
            llenarTipo();
            try
            {
                id = int.Parse(Id);
                string[] dat = obj.buscarProducto(Id, 1, Application["cnn"].ToString()).ElementAt(0);

                txtCodigo.Text = dat[1];
                txtCodigo.Enabled = false;
                txtNombre.Text = dat[2];
                dwlTipo.SelectedIndex = int.Parse(dat[8]);
                txtMarca.Text = dat[3];
                txtUnidades.Text = dat[5];
                txtPrecio.Text = dat[6];
                txtDesc.Text = dat[4];
                lblImagen.Text = dat[7];
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
    
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language ='javascript'>document.location.href='dflProductos.aspx';</script>");
    }

    protected void btnGUardar_Click(object sender, EventArgs e)
    {
        
        if (Id == null) //nuevo producto
        {
            if (txtCodigo.Text == "" && txtNombre.Text == "" && dwlTipo.SelectedIndex == 0 && txtMarca.Text=="" && txtUnidades.Text=="" && txtPrecio.Text=="" && txtDesc.Text == "")
            {
                Response.Write("<script language ='javascript'>alert('Campos vacios');</script>");
            }
            else
            {
                int estado = obj.modProducto(0,int.Parse(txtCodigo.Text), txtNombre.Text, txtMarca.Text, txtDesc.Text, int.Parse(txtUnidades.Text), int.Parse(txtPrecio.Text), lblImagen.Text, dwlTipo.SelectedIndex, Application["cnn"].ToString());
                if (estado == 0)
                {
                    Response.Write("<script language ='javascript'>alert('ERROR New "+estado.ToString()+"');</script>");
                }
                else
                {
                    Response.Write("<script language ='javascript'>alert('Agregado " + estado.ToString() + "');document.location.href='dflModProducto.aspx?ID=" + estado.ToString()+"'</script>");
                }
            }
        }
        else //modificar producto
        {
            if (txtCodigo.Text == "" && txtNombre.Text == "" && dwlTipo.SelectedIndex == 0 && txtMarca.Text == "" && txtUnidades.Text == "" && txtPrecio.Text == "" && txtDesc.Text == "")
            {
                Response.Write("<script language ='javascript'>alert('Campos vacios');</script>");
            }
            else
            {
                int estado = obj.modProducto(1, int.Parse(txtCodigo.Text), txtNombre.Text, txtMarca.Text, txtDesc.Text, int.Parse(txtUnidades.Text), int.Parse(txtPrecio.Text), lblImagen.Text, dwlTipo.SelectedIndex, Application["cnn"].ToString());
                if (estado == 0)
                {
                    Response.Write("<script language ='javascript'>alert('ERROR Mod " + estado.ToString() + "');</script>");
                }
                else
                {
                    Response.Write("<script language ='javascript'>alert('Modificado " + estado.ToString() + "');document.location.href='dflModProducto.aspx?ID=" + estado.ToString() + "'</script>");
                }
            }
        }
    }

    
    protected void imgbImagen_Click(object sender, EventArgs e)
    {
        try
        {
            if (fluFoto.HasFile)
            {
                string ruta = "", foto = "";
                ruta = Server.MapPath("./img/");
                fluFoto.PostedFile.SaveAs(ruta + fluFoto.FileName);
                foto = fluFoto.FileName;
                imgbImagen.ImageUrl = "./img/" + foto;
                imgbImagen.ImageAlign = ImageAlign.Middle;
                lblImagen.Text = "./img/" + foto;

            }
        }
        catch
        {

            Response.Write("<script language='javascript'>alert('Error al subir la foto');</script>");
        }
    }
    

}