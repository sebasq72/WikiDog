using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class HistoricoSintomasBC
    {
        HistoricoSintomasDALC Dalc = new HistoricoSintomasDALC();

        public int CrearHistoricoSintomas(HistoricoSintomasBE ObjHistoricoSintomas)
        {
            return Dalc.CrearHistoricoSintomas(ObjHistoricoSintomas);
        }
    }
}
