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
    public class DiagnosticoDALC : Base
    {
        public List<DiagnosticoBE> BuscarDiagnostico(DiagnosticoBE Diagnostico)
        {
            List<DiagnosticoBE> LstDiagnostico = new List<DiagnosticoBE>();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("BuscarDiagnostico", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                if (Diagnostico.IdDiagnostico != null && Diagnostico.IdDiagnostico > 0)
                    cmd.Parameters.AddWithValue("@IdDiagnostico", Diagnostico.IdDiagnostico);

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DiagnosticoBE ObjDiagnosticoBE = new DiagnosticoBE();

                    ObjDiagnosticoBE.IdDiagnostico = (int)dr["IdDiagnostico"];
                    ObjDiagnosticoBE.Descripcion =  (string)dr["Descripcion"];

                    LstDiagnostico.Add(ObjDiagnosticoBE);
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
            return LstDiagnostico;
        }

        public int CrearDiagnostico(DiagnosticoBE Diagnostico)
        {
            int id = -1;
            try
            {
                OpenConnection();

                cmd = new SqlCommand("CrearDiagnostico", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Descripcion", Diagnostico.Descripcion);

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
