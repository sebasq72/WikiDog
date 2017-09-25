using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class InferenciasBE
    {
        public int IdInferencia { get; set; }
        public int? IdRecurso { get; set; }
        public SintomasBE Sintomas = new SintomasBE();
    }
}
