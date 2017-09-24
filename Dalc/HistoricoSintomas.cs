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
    public class HistoricoSintomasDALC : Base
    {

        public int CrearHistoricoSintomas(HistoricoSintomasBE ObjHistoricoSintomas)
        {
            int id = -1;
            try
            {
                OpenConnection();

                cmd = new SqlCommand("CrearHistoricoSintomas", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdInferencia", ObjHistoricoSintomas.Inferencia.IdInferencia);
                cmd.Parameters.AddWithValue("@IdSesion", ObjHistoricoSintomas.Sesion.IdSesion);

                id = cmd.ExecuteNonQuery();
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

    }
}
