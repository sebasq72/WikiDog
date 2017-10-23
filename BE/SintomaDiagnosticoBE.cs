using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class SintomaDiagnosticoBE
    {
        public int IdSintomaDiagnostico { get; set; }

        public SintomaBE SintomaBE { get; set; }
        public DiagnosticoBE DiagnosticoBE { get; set; }
    }
}
