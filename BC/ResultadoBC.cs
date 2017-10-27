using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class ResultadoBC
    {
        ResultadoDALC Dalc = new ResultadoDALC();

        public List<ResultadoBE> Graficar(int IdSesion)
        {
            return Dalc.Graficar(IdSesion);
        }
    }
}
