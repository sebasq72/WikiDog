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
    public class InferenciasDALC : Base
    {

        public List<InferenciasBE> BuscarInferencia(int? IdRecurso)
        {
            List<InferenciasBE> LstInferencias = new List<InferenciasBE>();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("BuscarInferencias", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                if (IdRecurso != null && IdRecurso > 0)
                    cmd.Parameters.AddWithValue("@IdRecurso", IdRecurso);

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    InferenciasBE ObjInferenciasBE = new InferenciasBE();

                    ObjInferenciasBE.IdInferencia = (int)dr["IdInferencia"];
                    ObjInferenciasBE.IdRecurso = dr["IdRecurso"] != DBNull.Value ? (int?)dr["IdRecurso"] : null;
                    
                    ObjInferenciasBE.Sintomas.IdSintoma = (int)dr["IdSintoma"];
                    ObjInferenciasBE.Sintomas.Descripcion = (string)dr["DescripcionSintoma"];

                    ObjInferenciasBE.Sintomas.Diagnostico.IdDiagnostico = (int)dr["IdDiagnostico"];
                    ObjInferenciasBE.Sintomas.Diagnostico.Descripcion = (string)dr["DescripcionDiagnostico"];

                    LstInferencias.Add(ObjInferenciasBE);
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
            return LstInferencias;
        }

    }
}
