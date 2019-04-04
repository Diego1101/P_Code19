<%@ Page Title="" Language="C#" MasterPageFile="~/mpAdmin.master" AutoEventWireup="true" CodeFile="dflCalendario1.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" CellPadding="3" OnPageIndexChanging="gvUsuarios_PageIndexChanging" OnSelectedIndexChanging="gvUsuarios_SelectedIndexChanging" PageSize="1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="FECHA" HeaderText="Fecha" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />
                    <asp:BoundField DataField="CORREO" HeaderText="Correo" />
                    <asp:BoundField DataField="TELEFONO" HeaderText="Teléfono" />
                    <asp:ImageField DataAlternateTextField="FOTO" DataAlternateTextFormatString="FOTO" DataImageUrlField="FOTO" HeaderText="Foto">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
</asp:Content>

