<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SintomaDiagnostico.aspx.cs"
    Inherits="wikiDog.SintomaDiagnostico.SintomaDiagnostico" MasterPageFile="~/wikiDog.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">

        $(document).ready(function () {

            BuscarDiagnosticos();
            BuscarSintomas();

            $("#Submit").click(function () { CrearSintomaDiagnostico(); });

        });

        function BuscarDiagnosticos() {
            var Url = $("#UrlRest").val() + "api/wikidog/BuscarDiagnosticos";

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdDiagnostico: 0 },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {
                    $.each(result, function (key, value) {
                        $('#SelectDiagnostico').append($('<option></option>').text(value.Descripcion).val(value.IdDiagnostico));
                    });
                }
            });
        }

        function BuscarSintomas() {
            var Url = $("#UrlRest").val() + "api/wikidog/BuscarSintoma";

            $.ajax({
                type: "get",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: Url,
                data: { IdSintoma: 0 },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {
                    $.each(result, function (key, value) {
                        $('#SelectSintoma').append($('<option></option>').text(value.Descripcion).val(value.IdDiagnostico));
                    });
                }
            });
        }


        function CrearSintomaDiagnostico() {

            var Url = $("#UrlRest").val() + "api/wikidog/CrearSintomaDiagnostico";

            var idDiagnostico = $("#SelectDiagnostico").val();
            var idSintoma = $("#SelectSintoma").val();

            $.ajax({
                type: "GET",
                dataType: "jsonp",
                contentType: "application/json; charset=utf-8",
                cache: false,
                url: Url,
                data: { IdDiagnostico: idDiagnostico, IdSintoma: idSintoma },
                error: function (e, e1, e2) {
                    alert("Error creando el registro." + e);
                },
                success: function (result) {
                    alert("Registro creado correctamente.");
                }
            });
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <asp:Label ID="Label2" Text="Diagnosticos" runat="server" />
    <select id="SelectDiagnostico"></select>
    
    <br />
    <br />

    <asp:Label ID="Label1" Text="Sintomas" runat="server" />
    <select id="SelectSintoma"></select>

    <br />
    <br />

    <button id="Submit">Crear</button>

</asp:Content>
