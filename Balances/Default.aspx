<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="Balances._Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
<dx:ASPxGridView ID="PublicationGridView" runat="server" AutoGenerateColumns="False" ClientInstanceName="PublicationGridView"
    Width="100%" DataSourceID="EntityDataSource1" KeyboardSupport="True" KeyFieldName="Id" OnRowInserting="PublicationGridView_RowInserting">
    <SettingsPager PageSize="32" />
    <SettingsEditing Mode="PopupEditForm">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" ShowGroupPanel="True" />
    <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" EnableRowHotTrack="True" />
    <SettingsPopup>
        <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" />
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="7">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataDateColumn FieldName="PublishedDate" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="MaterialName" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="LifeTime" Visible="False" VisibleIndex="9">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="Category" FieldName="CategoryId" VisibleIndex="2">
            <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="Name" ValueField="Id">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataSpinEditColumn FieldName="Quantity" VisibleIndex="8">
            <PropertiesSpinEdit DisplayFormatString="g">
            </PropertiesSpinEdit>
        </dx:GridViewDataSpinEditColumn>
        <dx:GridViewDataImageColumn FieldName="ImageUrl" VisibleIndex="10">
        </dx:GridViewDataImageColumn>
    </Columns>
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" />
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
</dx:ASPxGridView>


    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Publication" OnInserting="EntityDataSource1_Inserting">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Category">
</asp:EntityDataSource>

</asp:Content>