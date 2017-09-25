using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dalc
{
    public class Base
    {

        //objeto para la conexion a base de dartos
		public SqlConnection connection = null;
		//objeto para la ejecucion de sentencias
		public SqlCommand cmd = null;
		//objeto para la lectura de registros
		public SqlDataReader dr = null;        

        public string StrConn = System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;           

		public Base()
		{
            connection = new SqlConnection(StrConn);
		}
        public Base(string sConnection)
		{
			connection = new SqlConnection(sConnection);
		}

        /// <summary>
        /// Metodo que permite la apertura de la base de datos
        /// </summary>
        public void OpenConnection()
        {
            if (connection.State != ConnectionState.Open)
            {
                try
                {
                    connection.Open();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        /// <summary>
        /// Metodo que permite el cierre de la conexin a la base de datos
        /// </summary>
        public void CloseConnection()
        {
            connection.Close();
        }

    }
}
