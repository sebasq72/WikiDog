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
    public class SintomaDALC : Base
    {

        public int CrearSintoma(SintomaBE Sintoma)
        {
            int id = -1;
            try
            {
                OpenConnection();

                cmd = new SqlCommand("CrearSintoma", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdDiagnostico", Sintoma.Diagnostico.IdDiagnostico);
                cmd.Parameters.AddWithValue("@Descripcion", Sintoma.Descripcion);

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

    }
}
