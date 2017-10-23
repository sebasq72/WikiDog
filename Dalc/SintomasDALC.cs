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

        public List<SintomaBE> BuscarSintoma(SintomaBE Sintoma)
        {
            List<SintomaBE> LstSintoma = new List<SintomaBE>();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("BuscarSintoma", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                if (Sintoma.IdSintoma != null && Sintoma.IdSintoma > 0)
                    cmd.Parameters.AddWithValue("@IdSintoma", Sintoma.IdSintoma);

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    SintomaBE ObjSintomaBE = new SintomaBE();

                    ObjSintomaBE.IdSintoma = (int)dr["IdSintoma"];
                    ObjSintomaBE.Descripcion = (string)dr["Descripcion"];

                    LstSintoma.Add(ObjSintomaBE);
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
            return LstSintoma;
        }


    }
}
