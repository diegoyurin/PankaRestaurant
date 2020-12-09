<%@ Page Title="Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Front_end.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Mantenimiento Usuario</h6>
        </div>
        <div class="card-header py-3">
            <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Agregar Usuario" data-toggle="modal" data-target="#registerModal"/>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvUsuario" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" 
                    CssClass="table table-bordered" width="100%" cellspacing="0" DataKeyNames="IdUsuario" OnRowEditing="gvUsuario_RowEditing"
                    OnRowCancelingEdit="gvUsuario_RowCancelingEdit" OnRowUpdating="gvUsuario_RowUpdating" OnRowDeleting="gvUsuario_RowDeleting"
                    OnRowDataBound="gvUsuario_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="IdUsuario">
                            <ItemTemplate>
                                <asp:Label  Text='<%# Eval("IdUsuario") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtIdUsuario" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("IdUsuario") %>' ReadOnly></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombres">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Nombre") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombres" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Apellidos">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Apellido") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtApellidos" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Dirección">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Direccion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDireccion" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Celular">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Celular") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCelular" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("Celular") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Correo">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Correo") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCorreo" CssClass="form-control form-control-user" 
                                    runat="server" Text='<%# Bind("Correo") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tipo de Usuario">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("TipoUsuario") %>' runat="server" id="lblTipoUsuario"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdnTipoUsuario" runat="server" Value='<%#Bind("TipoUsuario") %>' />
                                <asp:DropDownList runat="server" ID="ddlTipoUsuario" class="form-control" >
                                    <asp:ListItem Text="Administrador" value="ADMIN"/>
                                    <asp:ListItem Text="Trabajador" value="TRABAJADOR"/>
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
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Usuario</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpNombres" placeholder="Nombres"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpApellidos" placeholder="Apellidos"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="text" CssClass="form-control form-control-user" id="inpDireccion" placeholder="Direccion"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="phone" CssClass="form-control form-control-user" id="inpCelular" placeholder="Celular"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="email" CssClass="form-control form-control-user" id="inpCorreo" placeholder="Correo"/>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlTipoUsuarioAgregar" runat="server" AutoPostBack="false" name="Categoría" class="form-control" AppendDataBoundItems="true" >
                            <asp:ListItem Text="<Seleccione el tipo de usuario>" Value="SNVAL" />
                            <asp:ListItem Text="Administrador" value="ADMIN"/>
                            <asp:ListItem Text="Trabajador" value="TRABAJADOR"/>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="password" CssClass="form-control form-control-user" id="inpContrasena" placeholder="Contraseña"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" type="password" CssClass="form-control form-control-user" id="inpContrasena2" placeholder="Repita su Contraseña"/>
                    </div>
                    <div class="alert alert-danger" role="alert" id="alerta" runat="server">
                        Rellene todos los campos
                    </div>
                    <div class="alert alert-danger" role="alert" id="alertapass" runat="server">
                        Las contraseñas no coinciden
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                     <asp:LinkButton NavigateUrl="#" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="Unnamed_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
