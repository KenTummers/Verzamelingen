<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vissen._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background:#212121 !important" class="jumbotron">
        <h1 style="color:#95959d">VERZAMELINGEN</h1>
        <p style="color:#95959d" class="lead">Deze website bevat diverse verzamelingen.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Vissen</h2>
            <p>
                De eerste verzameling is een verzameling van diverse soorten vissen.
            </p>
            <p>
                <a style="background:#404040; color:White" class="btn btn-default" href="Vissen">Lees meer &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>About</h2>
            <p>
                Deze website bevat op het moment maar een verzameling. Meerdere kunnen nog toegevoegd worden.
            </p>
            <p>
                <a style="background:#404040; color:White" class="btn btn-default" href="Vissen">Lees meer &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Wie ben ik</h2>
            <p>
                Mijn naam is Ken Tummers en ik studeer ICT op Zuyd Hogeschool.
            </p>
            <p>
                <a style="background:#404040; color:White" class="btn btn-default" href="Vissen">Lees meer &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
