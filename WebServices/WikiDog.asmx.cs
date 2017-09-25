using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BE;
using BC;

namespace WebServices
{
    /// <summary>
    /// Descripción breve de WikiDog
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WikiDog : System.Web.Services.WebService
    {

        HistoricoSintomasBC HistoricoSintomas = new HistoricoSintomasBC();
        InferenciasBC Inferencias = new InferenciasBC();
        SesionBC Sesion = new SesionBC();

        [WebMethod]
        public List<InferenciasBE> BuscarInferencia(int IdInferencia, int IdRecurso)
        {
            return Inferencias.BuscarInferencia(IdInferencia, IdRecurso);
        }

        [WebMethod]
        public int CrearHistoricoSintomas(HistoricoSintomasBE ObjHistoricoSintomas)
        {
            return HistoricoSintomas.CrearHistoricoSintomas(ObjHistoricoSintomas);
        }

        [WebMethod]
        public int CrearSesion(String Usuario)
        {
            return Sesion.CrearSesion(Usuario);
        }

        [WebMethod]
        public SesionBE BuscarSesion(int IdSesion)
        {
            return Sesion.BuscarSesion(IdSesion);
        }
    }
}
