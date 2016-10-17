<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maestro.aspx.cs" Inherits="WebEmpresasEDM.Maestro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="btnMantenedor" runat="server" OnClick="btnMantenedor_Click" Text="Ir a Mantenciones" />
    
    </div>
        <asp:EntityDataSource ID="edsEmpresas" runat="server" ConnectionString="name=EmpresasEntities" DefaultContainerName="EmpresasEntities" EnableFlattening="False" EntitySetName="Empresa" Select="it.[Rut], it.[RazonSocial]">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsEmpleados" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EmpresasEntities" DefaultContainerName="EmpresasEntities" EnableFlattening="False" EntitySetName="Empleado" OrderBy="it.Rut" Select="it.[Rut], it.[Nombres], it.[Apellidos], it.[Dv]" Where="">
            <WhereParameters>
                <asp:ControlParameter ControlID="ddlEmpresas" DbType="Int32" Name="Empresa" PropertyName="SelectedValue" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:DropDownList ID="ddlEmpresas" runat="server" AutoPostBack="True" DataSourceID="edsEmpresas" DataTextField="RazonSocial" DataValueField="Rut" Width="273px">
        </asp:DropDownList>
        <asp:GridView ID="gvEmpleados" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="edsEmpleados">
            <Columns>
                <asp:BoundField DataField="Rut" HeaderText="Rut" ReadOnly="True" SortExpression="Rut" />
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="Nombres" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" ReadOnly="True" SortExpression="Apellidos" />
                <asp:BoundField DataField="Dv" HeaderText="Dv" ReadOnly="True" SortExpression="Dv" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
