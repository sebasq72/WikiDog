using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class SintomaDiagnosticoBC
    {
        SintomaDiagnosticoDALC Dalc = new SintomaDiagnosticoDALC();

        public int CrearSintomaDiagnostico(SintomaDiagnosticoBE SintomaDiagnosticoBE)
        {
            return Dalc.CrearSintomaDiagnostico(SintomaDiagnosticoBE);
        }

        public List<SintomaDiagnosticoBE> BuscarSintomaDiagnostico(SintomaDiagnosticoBE SintomaDiagnostico)
        {
            return Dalc.BuscarSintomaDiagnostico(SintomaDiagnostico);
        }

    }
}
