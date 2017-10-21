using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class DiagnosticoBC
    {
        DiagnosticoDALC Dalc = new DiagnosticoDALC();

        public int CrearDiagnostico(DiagnosticoBE Diagnostico)
        {
            return Dalc.CrearDiagnostico(Diagnostico);
        }

        public List<DiagnosticoBE> BuscarDiagnostico(DiagnosticoBE Diagnostico)
        {
            return Dalc.BuscarDiagnostico(Diagnostico);
        }

    }
}
