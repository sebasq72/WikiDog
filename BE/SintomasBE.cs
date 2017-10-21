using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class SintomaBE
    {
        public int IdSintoma { get; set; }        
        public DiagnosticoBE Diagnostico = new DiagnosticoBE();
        public string Descripcion { get; set; }
    }
}
