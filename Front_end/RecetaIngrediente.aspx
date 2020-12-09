<%@ Page Title="Recetas e Ingredientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecetaIngrediente.aspx.cs" Inherits="Front_end.RecetaIngrediente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Recetas e Ingredientes</h6>
        </div>
        <div class="card-header py-3">
            <div class="form-group">
                <asp:DropDownList ID="ddlRecetaAgregar" runat="server" AutoPostBack="true" name="Categoría" class="form-control" AppendDataBoundItems="true"
                    DataTextField="Receta" DataValueField="Receta" OnSelectedIndexChanged="ddlRecetaAgregar_SelectedIndexChanged">
                    <asp:ListItem Text="<Seleccione la Receta>" Value="SNVAL" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                Costo Total: 
                <asp:TextBox runat="server" type="number" step="0.1" CssClass="form-control form-control-user" id="txtCostoTotal" 
                    placeholder="Costo Total" ReadOnly/>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvProducto" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" >
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

                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CantidadProducto") %>' runat="server"></asp:Label>
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

                        <asp:TemplateField HeaderText="Costo en Receta">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CostoEnReceta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de Registro">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("FechaRegistro") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Control del Producto">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ControlProducto") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Categoría">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Categoria") %>' runat="server" id="lblCategoria"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>    
                </asp:GridView>
            </div>
        </div>
        <div class="card-header py-3">
            <div class="form-group">
                <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Generar Reporte en PDF" OnClick="Unnamed_Click" ID="btnPDF"/>
                <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Generar Reporte en xlsx" OnClick="btnExcel_Click" ID="btnExcel"/>
            </div>
        </div>
    </div>
</asp:Content>
