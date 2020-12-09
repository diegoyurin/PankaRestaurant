<%@ Page Title="Productos Inactivos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosInactivos.aspx.cs" Inherits="Front_end.ProductosInactivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Productos Inactivos</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvProducto" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdProducto" OnRowDeleting="gvProducto_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="ID Producto">
                            <ItemTemplate>
                                <asp:Label id="lblIdProducto" Text='<%# Eval("IdProducto") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Nombre") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Stock") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Unidad de Medida">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("UnidadMedida") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Costo Unitario">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CostoUnitario") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Categoría">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Categoria") %>' runat="server"></asp:Label>
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
