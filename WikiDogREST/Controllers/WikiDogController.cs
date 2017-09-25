using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using BC;
using BE;

namespace WikiDogREST.Controllers
{
    //Install-Package Microsoft.AspNet.WebApi.WebHost

    [RoutePrefix("api/wikidog")]
    public class WikiDogController : ApiController
    {
        HistoricoSintomasBC HistoricoSintomas = new HistoricoSintomasBC();
        InferenciasBC Inferencias = new InferenciasBC();
        SesionBC Sesion = new SesionBC();

        [HttpGet]
        [Route("BuscarInferencia/{IdInferencia}/{IdRecurso}")]
        public List<InferenciasBE> BuscarInferencia(int? IdInferencia, int? IdRecurso)
        {
            return Inferencias.BuscarInferencia(IdInferencia, IdRecurso);
        }

        [HttpGet]
        [Route("CrearHistoricoSintomas/{IdInferencia}/{IdSesion}")]
        public int CrearHistoricoSintomas(int IdInferencia, int IdSesion)
        {
            HistoricoSintomasBE ObjHistoricoSintomas = new HistoricoSintomasBE();
            ObjHistoricoSintomas.Inferencia.IdInferencia = IdInferencia;
            ObjHistoricoSintomas.Sesion.IdSesion = IdSesion;

            return HistoricoSintomas.CrearHistoricoSintomas(ObjHistoricoSintomas);
        }

        [HttpGet]
        [Route("CrearSesion/{Usuario}")]
        public int CrearSesion(String Usuario)
        {
            return Sesion.CrearSesion(Usuario);
        }

        [HttpGet]
        [Route("BuscarSesion/{IdSesion}")]
        public SesionBE BuscarSesion(int IdSesion)
        {
            return Sesion.BuscarSesion(IdSesion);
        }

    }
}
