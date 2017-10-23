using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using Dalc;

namespace BC
{
    public class SesionBC
    {
        SesionDALC Dalc = new SesionDALC();

        public SesionBE BuscarSesion(int IdSesion)
        {
            return Dalc.BuscarSesion(IdSesion);
        }

        public int CrearSesion()
        {
            return Dalc.CrearSesion();
        }
    }
}
