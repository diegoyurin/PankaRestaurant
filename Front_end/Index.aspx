<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Front_end.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>SISTEMA DE GESTIÓN DE INVENTARIO DE PANKA RESTAURANT</h2>
    <hr class="sidebar-divider">
    <h4>
        Este sistema fue desarrollado para gestionar el inventario del restaurante Panka<br />
        Se divide en las siguientes opciones:<br />
        <hr class="sidebar-divider">
        Recetas     :<br />
            Administrar             =>  Agregar Ingredientes y Agregar, Editar o Eliminar Recetas<br />
            Recetas e Ingredientes  =>  Ver ingredientes por receta<br />
            Recetas Inactivas       =>  Ver la lista de recetas inactivas<br />
        <hr class="sidebar-divider">
        Productos   :<br />
            Administrar             =>  Agregar, Editar o Eliminar Productos<br />
            Productos Inactivos     =>  Ver la lista de productos inactivos<br />
            Dar de Baja             =>  Podemos dar de baja productos por algún motivo<br />
            Registrar Stock         =>  Podemos registrar stock de los productos<br />
        <hr class="sidebar-divider">
        Categorías  :<br />
            Agregar o editar categorías<br />
        <hr class="sidebar-divider">
        Usuarios    :<br />
            Administrar             =>  Agregar, Editar o Eliminar Usuarios<br />
    </h4>

</asp:Content>
