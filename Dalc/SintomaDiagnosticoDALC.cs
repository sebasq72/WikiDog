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
    public class SintomaDiagnosticoDALC : Base
    {
        public int CrearSintomaDiagnostico(SintomaDiagnosticoBE SintomaDiagnosticoBE)
        {
            int id = -1;
            try
            {
                OpenConnection();

                cmd = new SqlCommand("CrearSintomaDiagnostico", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdDiagnostico", SintomaDiagnosticoBE.DiagnosticoBE.IdDiagnostico);
                cmd.Parameters.AddWithValue("@IdSintoma", SintomaDiagnosticoBE.SintomaBE.IdSintoma);

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

        public List<SintomaDiagnosticoBE> BuscarSintomaDiagnostico(BE.SintomaDiagnosticoBE SintomaDiagnostico)
        {
            List<SintomaDiagnosticoBE> LstSintomaDiagnosticoBE = new List<SintomaDiagnosticoBE>();

            try
            {
                OpenConnection();

                cmd = new SqlCommand("BuscarDiagnostico", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    SintomaDiagnosticoBE ObjSintomaDiagnosticoBE = new SintomaDiagnosticoBE();

                    ObjSintomaDiagnosticoBE.IdSintomaDiagnostico = (int)dr["IdSintomaDiagnostico"];

                    ObjSintomaDiagnosticoBE.DiagnosticoBE.IdDiagnostico = (int)dr["IdDiagnostico"];
                    ObjSintomaDiagnosticoBE.DiagnosticoBE.Descripcion = (string)dr["DescripcionDiagnostico"];

                    ObjSintomaDiagnosticoBE.SintomaBE.IdSintoma = (int)dr["IdSintoma"];
                    ObjSintomaDiagnosticoBE.SintomaBE.Descripcion = (string)dr["DescripcionSintoma"];

                    LstSintomaDiagnosticoBE.Add(ObjSintomaDiagnosticoBE);
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
            return LstSintomaDiagnosticoBE;
        }
    }
}
