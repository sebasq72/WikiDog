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
        DiagnosticoBC Diagnosticos = new DiagnosticoBC();
        SintomaBC Sintoma = new SintomaBC(); 
        SesionBC Sesion = new SesionBC();

        [HttpGet]
        [Route("BuscarInferencia/{IdRecurso}")]
        public List<InferenciasBE> BuscarInferencia(int? IdRecurso)
        {
            return Inferencias.BuscarInferencia(IdRecurso);
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


        [HttpGet]
        [Route("BuscarDiagnosticos/{IdDiagnostico}")]
        public List<DiagnosticoBE> BuscarDiagnosticos(int IdDiagnostico)
        {
            DiagnosticoBE diagnosticoBE = new DiagnosticoBE();
            diagnosticoBE.IdDiagnostico = IdDiagnostico;

            return Diagnosticos.BuscarDiagnostico(diagnosticoBE);
        }

        [HttpGet]
        [Route("CrearDiagnostico/{Descripcion}")]
        public int CrearDiagnostico(string Descripcion)
        {
            DiagnosticoBE diagnosticoBE = new DiagnosticoBE();
            diagnosticoBE.Descripcion = Descripcion;

            return Diagnosticos.CrearDiagnostico(diagnosticoBE);
        }

        [HttpGet]
        [Route("CrearSintoma/{IdDiagnostico}/{Descripcion}")]
        public int CrearSintoma(int IdDiagnostico, string Descripcion)
        {
            SintomaBE sintomaBE = new SintomaBE();
            sintomaBE.Diagnostico.IdDiagnostico = IdDiagnostico;
            sintomaBE.Descripcion = Descripcion;

            return Sintoma.CrearSintoma(sintomaBE);
        }

    }
}
