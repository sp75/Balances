<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="Balances.CategoryEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="EntityDataSource2" KeyFieldName="Id">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="100px">
            </dx:GridViewCommandColumn>
        </Columns>
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Category">
</asp:EntityDataSource>

</asp:Content>
