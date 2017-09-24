using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class HistoricoSintomasBE
    {
        public int IdHistorico { get; set; }
        public string Descripcion { get; set; }
        public InferenciasBE Inferencia = new InferenciasBE();
        public SesionBE Sesion = new SesionBE();
    }
}
