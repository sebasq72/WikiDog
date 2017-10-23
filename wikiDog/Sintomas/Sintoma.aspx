<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sintoma.aspx.cs"
    Inherits="wikiDog.Sintomas.Sintoma" MasterPageFile="~/wikiDog.Master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">

        $(document).ready(function () {

            BuscarDiagnosticos();

            $("#Submit").click(function () { CrearSintoma(); });

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

        function CrearSintoma() {

            var Url = $("#UrlRest").val() + "api/wikidog/CrearSintoma";

            var idDiagnostico = $("#SelectDiagnostico").val();
            var sintoma = $("#txtSintoma").val();

            $.ajax({
                type: "GET",
                dataType: "jsonp",
                contentType: "application/json; charset=utf-8",
                cache: false,
                url: Url,
                data: { IdDiagnostico: idDiagnostico, Descripcion: sintoma },
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
    
    <div id="divSintoma">
        <asp:Label Text="Sintoma" runat="server" />
        <asp:TextBox ID="txtSintoma" runat="server" ClientIDMode="Static" />
    </div>
    <br />
    
    <asp:Label ID="Label1" Text="Diagnostico" runat="server" />
    <select id="SelectDiagnostico"></select>
    <br />
    <br />
    <button id="Submit">Crear</button>
</asp:Content>
