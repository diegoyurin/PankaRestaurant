<%@ Page Title="Baja de productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BajaProducto.aspx.cs" Inherits="Front_end.BajaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Baja de Productos</h6>
        </div>
        <div class="card-header py-3">
            <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Dar de baja producto" data-toggle="modal" data-target="#registerModal"/>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvProducto" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdProducto">
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

                        <asp:TemplateField HeaderText="Motivo">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Motivo") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Cantidad") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Unidad de Medida">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("UnidadMedida") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de baja">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Fecha") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>    
                </asp:GridView>
            </div>
        </div>
    </div>
    <!--Modal para agregar-->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Dar de Baja Producto</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="ddlProductoAgregar" runat="server" AutoPostBack="false" name="Producto" class="form-control" AppendDataBoundItems="true" 
                            DataTextField="Producto" DataValueField="Producto">
                            <asp:ListItem Text="<Seleccione el producto>" Value="SNVAL" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpMotivo" placeholder="Motivo"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="any" CssClass="form-control form-control-user" id="inpCantidad" placeholder="Cantidad"/>
                    </div>
                    <div class="alert alert-danger" role="alert" id="alerta" runat="server">
                        Rellene todos los campos
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Agregar" id="btnAgregarModal" runat="server" CssClass="btn btn-primary" OnClick="btnAgregarModal_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
