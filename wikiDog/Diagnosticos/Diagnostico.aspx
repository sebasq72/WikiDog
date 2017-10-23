<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Diagnostico.aspx.cs"
    Inherits="wikiDog.Diagnostico.Diagnostico" MasterPageFile="~/wikiDog.Master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">

        $(document).ready(function () {

            $("#Submit").click(function () { CrearDiagnostico(); });

        });

        function CrearDiagnostico() {

            var Url = $("#UrlRest").val() + "api/wikidog/CrearDiagnostico";
            var Diagnostico = $("#txtDiagnostico").val();

            $.ajax({
                type: "GET",
                dataType: "jsonp",
                contentType: "application/json; charset=utf-8",
                cache: false,
                url: Url,
                data: { Descripcion: Diagnostico },
                error: function (xhr, ajaxOptions, thrownError, request, error) {
                    alert('xrs.status = ' + xhr.status + '\n' +
                            'thrown error = ' + thrownError + '\n' +
                            'xhr.statusText = ' + xhr.statusText + '\n' +
                            'request = ' + request + '\n' +
                            'error = ' + error);
                },
                success: function (result) {
                    alert("Registro creado correctamente." + result);
                }
            });
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div id="divDiagnostico">
        <asp:Label Text="Diagnostico" runat="server" />
        <asp:TextBox ID="txtDiagnostico" runat="server" ClientIDMode="Static" />

        <br />

        <button id="Submit">Crear</button>
    </div>
</asp:Content>
