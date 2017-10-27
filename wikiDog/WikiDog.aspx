<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WikiDog.aspx.cs"
    Inherits="wikiDog.WikiDog" MasterPageFile="~/wikiDog.Master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">

        $(document).ready(function () {

            var IdSesion = $("#IdSesion").val();

            if (IdSesion != undefined && IdSesion != "") {
                getDataSintomas(0, 0);
            } else {
                CrearSesion();

                setTimeout(function () {
                    getDataSintomas(0, 0);
                }, 1000);
            }
        });

        function CrearSesion() {
            var Url = $("#UrlRest").val() + "api/wikidog/CrearSesion";

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdSesion: 0 },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {
                    $("#IdSesion").val(result);
                }
            });


        }

        function BuscarSesion() {
            var Url = $("#UrlRest").val() + "api/wikidog/BuscarSesion";

            var idSesion = $("#IdSesion").val();

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdSesion: idSesion },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {

                }
            });
        }

        function getDataSintomas(idRecurso, idInferencia) {

            $("#listaSintomas").empty();

            if (idInferencia > 0)
                CrearHistoricoSintomas(idInferencia);

            var Url = $("#UrlRest").val() + "api/wikidog/BuscarInferencia";

            $.ajax({
                type: "GET",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdRecurso: idRecurso },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (response) {

                    for (i = 0; i <= (response.length) ; i++) {

                        if (response[i] != undefined) {
                            if (response.length == 1) {
                                CrearHistoricoSintomas(response[i].IdInferencia);
                                CargarResultado();
                            }

                            $('#listaSintomas').append("<tr><td><strong>" + (i + 1) + "</strong></td>" +
                                    "<td>" + response[i].Sintomas.Descripcion + "</td>" +
                                    "<td>" +
                                    "<a onClick=\"getDataSintomas('" + response[i].Sintomas.IdSintoma + "', '" + response[i].IdInferencia + "')\">Seleccionar </a>" +
                                    "</td></tr>"
                                    );
                        }
                    }
                }

            });
        }

        function CrearHistoricoSintomas(idInferencia) {
            var Url = $("#UrlRest").val() + "api/wikidog/CrearHistoricoSintomas";

            var idSesion = $("#IdSesion").val();

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdInferencia: idInferencia, IdSesion: idSesion },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {

                }
            });
        }


        function CargarResultado() {
            var Url = $("#UrlRest").val() + "api/wikidog/ResultadosGrafica";

            var idSesion = $("#IdSesion").val();

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdSesion: idSesion },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {
                    cargarBarras(result);
                }
            });
        }


        function cargarGraficas() {
            for (i = 0; i <= 2 ; i++) {
                var n = i * 20;
                $('#Graficas').
                append("  <div class=\"span3\">"
                       + " <div class=\"chart\" data-percent=\"" + n + "\">" + n + "%</div>"
                       + " <div class=\"chart-bottom-heading\"><span class=\"label label-info\">Estadistica " + n + "</span>"
                        + "</div>"
                        + "</div>"
                        );
            }
        }

        function cargarBarras(data) {

            $.plot("#catchart", [data], {
                series: {
                    bars: {
                        show: true,
                        barWidth: 0.6,
                        align: "center"
                    }
                },
                xaxis: {
                    mode: "categories",
                    tickLength: 0
                }
            });
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid">
        <div class="row-fluid">

            <!--/span-->
            <div class="span9" id="content">

                <div class="row-fluid">
                    <!-- <div class="span6">-->
                    <!-- block -->
                    <div class="block">

                        <div class="block-content collapse in">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>¿Que sintmas presenta?</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="listaSintomas">
                                    <!--Tabla llenado con jquery -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /block -->
                    <!-- </div>-->
                </div>

                <div class="row-fluid">
                    <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">
                            <div class="muted pull-left">Estadisticas</div>
                            <div class="pull-right">
                                <span class="badge badge-warning">Ver más</span>

                            </div>
                        </div>
                        <div class="block-content collapse in" id="Graficas">
                        </div>
                    </div>
                    <!-- /block -->
                </div>


                <div class="row-fluid">
                    <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">
                            <div class="muted pull-left">Grafica de barras</div>
                            <div class="pull-right">
                                <span class="badge badge-warning">ver mas</span>

                            </div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <div id="catchart" style="width: 100%; height: 300px"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>

            </div>
        </div>
        <hr>
    </div>
    <!--/.fluid-container-->

    <script>
        $(function () {
            // Easy pie charts
            $('.chart').easyPieChart({ animate: 1000 });
        });
    </script>

</asp:Content>
