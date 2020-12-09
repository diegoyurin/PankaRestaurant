<%@ Page Title="Recetas Inactivas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecetasInactivas.aspx.cs" Inherits="Front_end.RecetasInactivas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Recetas Inactivas</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvReceta" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdReceta" OnRowDeleting="gvReceta_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="ID Receta">
                            <ItemTemplate>
                                <asp:Label id="lblIdReceta" Text='<%# Eval("IdReceta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Nombre") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Costo de Receta">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CostoReceta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Precio de Venta">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("PrecioVenta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Descripcion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tiempo de Cocción (minutos)">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("TiempoCoccion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tipo">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("TipoReceta") %>' runat="server" id="lblTipoReceta"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton NavigateUrl="#" ID="btnActivas" runat="server" CssClass="btn btn-success btn-circle" CommandName="Delete" ToolTip="Activar receta"  >
                                    <i class="fas fa-plus-circle"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>    
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
