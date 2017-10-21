using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class InferenciasBC
    {
        InferenciasDALC Dalc = new InferenciasDALC();

        public List<InferenciasBE> BuscarInferencia(int? IdRecurso)
        {
            return Dalc.BuscarInferencia(IdRecurso);
        }
    }
}
