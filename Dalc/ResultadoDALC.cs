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
    public class ResultadoDALC : Base
    {
        public List<ResultadoBE> Graficar(int IdSesion)
        {
            List<ResultadoBE> LstResultados = new List<ResultadoBE>();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("Resultado", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdSesion", IdSesion);

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ResultadoBE ObjResultadoBE = new ResultadoBE();

                    ObjResultadoBE.Diagnostico = (string)dr["Diagnostico"];
                    ObjResultadoBE.Porcentaje = (decimal)dr["Porcentaje"];

                    LstResultados.Add(ObjResultadoBE);
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
            return LstResultados;
        }
    }
}
