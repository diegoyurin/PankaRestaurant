<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Front_end.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Mantenimiento Productos</h6>
        </div>
        <div class="card-header py-3">
            <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Agregar Producto" data-toggle="modal" data-target="#registerModal"/>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvProducto" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdProducto"
                    OnRowEditing="gvProducto_RowEditing" OnRowCancelingEdit="gvProducto_RowCancelingEdit" 
                    OnRowUpdating="gvProducto_RowUpdating" OnRowDeleting="gvProducto_RowDeleting"
                    OnRowDataBound="gvProducto_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="ID Producto">
                            <ItemTemplate>
                                <asp:Label id="lblIdProducto" Text='<%# Eval("IdProducto") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtIdProducto" CssClass="form-control form-control-user " runat="server" Text='<%# Eval("IdProducto") %>' ReadOnly></asp:TextBox>
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

                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Stock") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStock" CssClass="form-control form-control-user" runat="server" Text='<%# Convert.ToString(Eval("Stock")) %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Unidad de Medida">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("UnidadMedida") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUnidadMedida" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("UnidadMedida") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Costo Unitario">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("CostoUnitario") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCostoUnitario" CssClass="form-control form-control-user" runat="server" Text='<%# Convert.ToDouble(Eval("CostoUnitario")) %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de Registro">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("FechaRegistro") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFechaRegistro" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("FechaRegistro") %>' ReadOnly></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Control del Producto">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ControlProducto") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtControlProducto" CssClass="form-control form-control-user" runat="server" Text='<%# Eval("ControlProducto") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Categoría">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Categoria") %>' runat="server" id="lblCategoria"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdnCategoria" runat="server" Value='<%#Eval("Categoria") %>' />
                                <asp:DropDownList runat="server" ID="ddlCategoria" DataTextField="Categoria" DataValueField="Categoria"
                                    AppendDataBoundItems=true class="form-control">
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
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Producto</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpNombre" placeholder="Nombre"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="any" CssClass="form-control form-control-user" id="inpStock" placeholder="Stock"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpUnidadMedida" placeholder="Unidad de Medida"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="number" step="any" CssClass="form-control form-control-user" id="inpCostoUnitario" placeholder="Costo Unitario"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpControlProducto" placeholder="Contol de Producto"/>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlCategoriaAgregar" runat="server" AutoPostBack="false" name="Categoría" class="form-control" AppendDataBoundItems="true" 
                            DataTextField="Categoria" DataValueField="Categoria">
                            <asp:ListItem Text="<Seleccione la Categoría del Producto>" Value="SNVAL" />
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
    </div>
</asp:Content>
