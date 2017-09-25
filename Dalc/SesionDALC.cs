using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace Dalc
{
    public class SesionDALC : Base
    {

        public int CrearSesion(String Usuario)
        {
            int id = -1;
            try
            {
                OpenConnection();

                cmd = new SqlCommand("CrearSesion", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Usuario", Usuario);

                id = (int)cmd.ExecuteScalar();                
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                CloseConnection();
            }
            return id;
        }

        public SesionBE BuscarSesion(int IdSesion)
        {
            SesionBE Sesion = new SesionBE();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("BuscarSesion", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdSesion", IdSesion); 

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Sesion.IdSesion = (int)dr["IdSesion"];
                    Sesion.Usuario = (string)dr["Usuario"];
                    Sesion.Fecha = (DateTime)dr["Fecha"];                                     
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                CloseConnection();
            }
            return Sesion;
        }
    }
}
