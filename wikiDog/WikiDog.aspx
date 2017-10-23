<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WikiDog.aspx.cs"
    Inherits="wikiDog.WikiDog" MasterPageFile="~/wikiDog.Master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">

        $(document).ready(function () {

            var IdSesion = $("#IdSesion").val();

            if (IdSesion != undefined && IdSesion != "") {
                getDataSintomas(0);
            } else {
                CrearSesion();
                getDataSintomas(0);
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

            var idSesion = $("IdSesion").val();

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

        function getDataSintomas(idRecurso) {

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

                        $('#listaSintomas').append("<tr><td><strong>" + (i + 1) + "</strong></td>" +
                                "<td>" + response[i].Sintomas.Descripcion + "</td>" +
                                "<td>" +
                                "<a onClick=\"getDataSintomas('" + response[i].Sintomas.IdSintoma + "')\">Seleccionar </a>" +
                                "</td></tr>"
                                );
                    }

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
            </div>
        </div>
        <hr>
    </div>
    <!--/.fluid-container-->


</asp:Content>
