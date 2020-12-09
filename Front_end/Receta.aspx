<%@ Page Title="Receta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receta.aspx.cs" Inherits="Front_end.Receta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Mantenimiento Recetas</h6>
        </div>
        <div class="card-header py-3">
            <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Agregar Receta" data-toggle="modal" data-target="#registerModal"/>
            <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Agregar Ingredientes" data-toggle="modal" data-target="#registerModal2"/>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvReceta" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdReceta"
                    OnRowEditing="gvReceta_RowEditing" OnRowCancelingEdit="gvReceta_RowCancelingEdit" 
                    OnRowUpdating="gvReceta_RowUpdating" OnRowDeleting="gvReceta_RowDeleting"
                    OnRowDataBound="gvReceta_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="ID Receta">
                            <ItemTemplate>
                                <asp:Label id="lblIdReceta" Text='<%# Eval("IdReceta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="txtIdReceta" runat="server" Text='<%# Eval("IdReceta") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Nombre") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombre" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Costo de Receta">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CostoReceta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="txtCostoReceta" runat="server" Text='<%# Eval("CostoReceta") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Precio de Venta">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("PrecioVenta") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrecioVenta" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("PrecioVenta") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Descripcion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescripcion" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("Descripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tiempo de Cocción (minutos)">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("TiempoCoccion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTiempoCoccion" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("TiempoCoccion") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tipo">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("TipoReceta") %>' runat="server" id="lblTipoReceta"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdnTipoReceta" runat="server" Value='<%#Eval("TipoReceta") %>' />
                                <asp:DropDownList runat="server" ID="ddlTipoReceta" class="form-control" >
                                    <asp:ListItem Text="Receta" value="RECETA"/>
                                    <asp:ListItem Text="Subreceta" value="SUBRECETA"/>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton NavigateUrl="#" ID="btnEdit" runat="server" CssClass="btn btn-warning btn-circle" CommandName="Edit" ToolTip="Edit">
                                    <i class="fas fa-pen"></i>
                                </asp:LinkButton>
                                
                                <asp:LinkButton NavigateUrl="#" ID="btnDelete" runat="server" CssClass="btn btn-danger btn-circle" CommandName="Delete" ToolTip="Delete"  >
                                    <i class="fas fa-trash"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton NavigateUrl="#" ID="btnUpdate" runat="server" CssClass="btn btn-success btn-circle" CommandName="Update" ToolTip="Update">
                                    <i class="far fa-save"></i>
                                </asp:LinkButton>
                                <asp:LinkButton NavigateUrl="#" ID="btnCancel" runat="server" CssClass="btn btn-warning btn-circle" CommandName="Cancel" ToolTip="Cancel">
                                    <i class="fas fa-window-close"></i>
                                </asp:LinkButton>
                            </EditItemTemplate>
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
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Receta</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpNombre" placeholder="Nombre"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="0.1" CssClass="form-control form-control-user" id="inpPrecioVenta" placeholder="Precio de Venta"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpDescripcion" placeholder="Descripción"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="1" CssClass="form-control form-control-user" id="inpTiempoCoccion" placeholder="Tiempo de Cocción (minutos)"/>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList runat="server" ID="ddlTipoReceta" class="form-control" >
                            <asp:ListItem Text="<Seleccione el tipo>" Value="SNVAL" />
                            <asp:ListItem Text="Receta" Value="RECETA" />
                            <asp:ListItem Text="Subreceta" Value="SUBRECETA" />
                        </asp:DropDownList>
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
    </div><!--Modal para agregar ingrediente-->
    <div class="modal fade" id="registerModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Agregar Ingrediente a una Receta</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="ddlRecetaAgregar" runat="server" AutoPostBack="false" name="Categoría" class="form-control" AppendDataBoundItems="true" 
                            DataTextField="Receta" DataValueField="Receta">
                            <asp:ListItem Text="<Seleccione la Receta>" Value="SNVAL" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlProductoAgregar" runat="server" AutoPostBack="false" name="Categoría" class="form-control" AppendDataBoundItems="true" 
                            DataTextField="Producto" DataValueField="Producto">
                            <asp:ListItem Text="<Seleccione el producto>" Value="SNVAL" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="1" CssClass="form-control form-control-user" id="inpCantidadProducto" placeholder="Cantidad del producto"/>
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Calcular Costo del Producto" id="btnCalcular" runat="server" CssClass="btn btn-primary btn-user btn-block" OnClick="btnCalcular_Click"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="0.1" CssClass="form-control form-control-user" id="txtCostoProducto" placeholder="Costo del Producto" ReadOnly/>
                    </div>
                    <div class="alert alert-danger" role="alert" id="alert2" runat="server">
                        Rellene todos los campos
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Agregar" id="btnAgregarProducto" runat="server" CssClass="btn btn-primary" OnClick="btnAgregarProducto_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
