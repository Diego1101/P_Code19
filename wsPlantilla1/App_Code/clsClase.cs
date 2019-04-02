using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsClase
/// </summary>
public class clsClase
{
    //Atributos
    public int Clave, Rol, Sexo;
    public string Nombre, Usuario;


    SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds;

    string resultadosConsulta = "";
    public clsClase()
    {

    }

    public string accesoUsuario(string uso, string pwd, string cn)
    {
        //crear la conexion a la base de datos 
        cnn = new SqlConnection(cn);
        //establecer el procedimiento a ejecutar
        cmd = new SqlCommand("TSP_ValidarAcceso", cnn);

        SqlParameter nUsu = cmd.Parameters.Add("@USU", SqlDbType.NVarChar, 8);
        SqlParameter nPas = cmd.Parameters.Add("@PAS", SqlDbType.NVarChar, 15);

        //tipo de comando que se quiera ejecutar del lado de sql
        cmd.CommandType = CommandType.StoredProcedure;

        //Asignar valor a los parámetros
        nUsu.Value = uso;
        nPas.Value = pwd;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            //asigna el resultado de la consulta a una vaiable para devolver el valor posteriormente
            resultadosConsulta = dr.GetValue(0).ToString();
            if (resultadosConsulta != "0")
            {
                Clave = int.Parse(dr.GetValue(0).ToString());
                Rol = int.Parse(dr.GetValue(1).ToString());
                Usuario = dr.GetValue(2).ToString();
                Nombre = dr.GetValue(4).ToString();
            }
        }
        cnn.Close();

        return resultadosConsulta;
    }

    public List<String[]> buscarProducto(string busc, int id, string cn)
    {
        
        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_buscarProductos", cnn);

        SqlParameter nBsc = cmd.Parameters.Add("@BUSC", SqlDbType.NVarChar, 50);
        SqlParameter nId = cmd.Parameters.Add("@ID", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;
        
        nBsc.Value = busc;
        nId.Value = id;


        cnn.Open();
        dr = cmd.ExecuteReader();

        List<string[]> dat = new List<string[]>();

        while (dr.Read())
        {
            if (dr.GetValue(0).ToString().Equals("0")) break;
            string[] row = new string[9];
            row[0] = dr.GetValue(0).ToString();
            row[1] = dr.GetValue(1).ToString();
            row[2] = dr.GetValue(2).ToString();
            row[3] = dr.GetValue(3).ToString();
            row[4] = dr.GetValue(4).ToString();
            row[5] = dr.GetValue(5).ToString();
            row[6] = dr.GetValue(6).ToString();
            row[7] = dr.GetValue(7).ToString();
            row[8] = dr.GetValue(8).ToString();

            dat.Add(row);
        }

        cnn.Close();

        return dat;
        
    }

    public DataSet listarTipo(string con)
    {

        da = new SqlDataAdapter("TSP_tipoProducto", con);
        ds = new DataSet();
        da.Fill(ds, "TIPO");
        return ds;
    }


}