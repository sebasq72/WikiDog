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
        SintomaDiagnosticoBC SintomaDiagnostico = new SintomaDiagnosticoBC();
        ResultadoBC Resultado = new ResultadoBC();

        #region Inferencia
        [HttpGet]
        [Route("BuscarInferencia/{IdRecurso}")]
        public List<InferenciasBE> BuscarInferencia(int? IdRecurso)
        {
            return Inferencias.BuscarInferencia(IdRecurso);
        }
        #endregion

        #region Historico
        [HttpGet]
        [Route("CrearHistoricoSintomas/{IdInferencia}/{IdSesion}")]
        public int CrearHistoricoSintomas(int IdInferencia, int IdSesion)
        {
            HistoricoSintomasBE ObjHistoricoSintomas = new HistoricoSintomasBE();
            ObjHistoricoSintomas.Inferencia.IdInferencia = IdInferencia;
            ObjHistoricoSintomas.Sesion.IdSesion = IdSesion;

            return HistoricoSintomas.CrearHistoricoSintomas(ObjHistoricoSintomas);
        }
        #endregion

        #region Sesion
        [HttpGet]
        [Route("CrearSesion/{IdSesion}")]
        public int CrearSesion(int IdSesion)
        {
            return Sesion.CrearSesion();
        }

        [HttpGet]
        [Route("BuscarSesion/{IdSesion}")]
        public SesionBE BuscarSesion(int IdSesion)
        {
            return Sesion.BuscarSesion(IdSesion);
        }
        #endregion

        #region Diagnostico
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
            diagnosticoBE.Descripcion = Descripcion.ToUpper();

            return Diagnosticos.CrearDiagnostico(diagnosticoBE);
        }
        #endregion

        #region Sintoma
        [HttpGet]
        [Route("CrearSintoma/{IdDiagnostico}/{Descripcion}")]
        public int CrearSintoma(int IdDiagnostico, string Descripcion)
        {
            SintomaBE sintomaBE = new SintomaBE();
            sintomaBE.Diagnostico.IdDiagnostico = IdDiagnostico;
            sintomaBE.Descripcion = Descripcion.ToUpper();

            return Sintoma.CrearSintoma(sintomaBE);
        }

        [HttpGet]
        [Route("BuscarSintoma/{IdSintoma}")]
        public List<SintomaBE> BuscarSintoma(int IdSintoma)
        {
            SintomaBE sintomaBE = new SintomaBE();
            sintomaBE.IdSintoma = IdSintoma;

            return Sintoma.BuscarSintoma(sintomaBE);
        }
        #endregion

        #region Sintoma Diagnostico
        [HttpGet]
        [Route("CrearSintomaDiagnostico/{IdDiagnostico}/{IdSintoma}")]
        public int CrearSintomaDiagnostico(int IdDiagnostico, int IdSintoma)
        {
            SintomaDiagnosticoBE sintomaDiagnosticoBE = new SintomaDiagnosticoBE();
            sintomaDiagnosticoBE.DiagnosticoBE.IdDiagnostico = IdDiagnostico;
            sintomaDiagnosticoBE.SintomaBE.IdSintoma = IdSintoma;

            return SintomaDiagnostico.CrearSintomaDiagnostico(sintomaDiagnosticoBE);
        }

        //[HttpGet]
        //[Route("BuscarSintomaDiagnostico")]
        //public List<SintomaDiagnosticoBE> BuscarSintomaDiagnostico()
        //{
        //    SintomaDiagnosticoBE sintomaDiagnosticoBE = new SintomaDiagnosticoBE();

        //    return SintomaDiagnostico.BuscarSintomaDiagnostico(sintomaDiagnosticoBE);
        //}
        #endregion

        #region Resultado Graficas
        [HttpGet]
        [Route("ResultadosGrafica/{IdSesion}")]
        public List<ResultadoBE> ResultadosGrafica(int IdSesion)
        {
            return Resultado.Graficar(IdSesion);
        }

        #endregion
    }
}
