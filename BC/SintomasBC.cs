using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class SintomaBC
    {
        SintomaDALC Dalc = new SintomaDALC();

        public int CrearSintoma(SintomaBE Sintoma)
        {
            return Dalc.CrearSintoma(Sintoma);
        }

        public List<SintomaBE> BuscarSintoma(SintomaBE Sintoma)
        {
            return Dalc.BuscarSintoma(Sintoma);
        }
    }
}
