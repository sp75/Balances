<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ClientParcelAgent.Admin.Directories.ShoppingCatalog.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/javascript">
            function OnInit(s, e) {
                AdjustSize();
            }
            function OnEndCallback(s, e) {
                AdjustSize();
            }
            function OnControlsInitialized(s, e) {
                ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
                    AdjustSize();
                });
            }
            function AdjustSize() {
                var height = Math.max(0, document.documentElement.clientHeight);
                ShoppingCategoriesGrid.SetHeight(height - 110);
            }
    </script>

    <div style="padding-top: 10px; height: 45px; margin-bottom: 20px;">
                        <table class="BottomMargin" width="100%">
                            <tr>
                                <td style="padding-right: 4px">
                                    <img src="/Admin/Images/orders.png" /></td>
                                <td style="padding-left: 15px; text-align: right;" nowrap="nowrap">
                                    <span style="font-size: x-large">Shopping Categories</span>
                                </td>
                                <td style="padding-bottom: 15px; padding-right: 15px;">&nbsp;</td>

                                <td width="100%">
                                    <dx:ASPxButtonEdit ID="shTextBox" runat="server" ClientInstanceName="shTextBox" EnableTheming="True" Theme="Moderno" Width="400px" NullText="Enter text to search...">
                                        <ClearButton Visibility="True">
                                        </ClearButton>
                                    </dx:ASPxButtonEdit>
                                </td>
                                <td>
   
                                </td>
                                <td style="width: 4px"><span class="dxtv-ndTxt dx-vam" style="font-size: x-large">
                                                <dx:ASPxButton ID="btnXlsExport" runat="server" Text="New Category" Theme="Moderno" UseSubmitBehavior="False" AllowFocus="False" AutoPostBack="False">
                                                    <ClientSideEvents Click="function(s, e) {
	ShoppingCategoriesGrid.AddNewRow();
}" />
                                                    <Image IconID="actions_insert_16x16">
                                                    </Image>
                                                </dx:ASPxButton>
                                            </span></td>

                            </tr>
                        </table>
                        </div>

    <dx:ASPxGridView ID="ShoppingCategoriesGrid" runat="server" AutoGenerateColumns="False" DataSourceID="groupshopsDS" EnableTheming="True" KeyFieldName="id" Theme="Moderno" Width="100%" ClientInstanceName="ShoppingCategoriesGrid" OnCustomCallback="ASPxGridView1_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="name" VisibleIndex="1" Caption="Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Visible" FieldName="visible" VisibleIndex="2" Width="70px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Favorite" FieldName="favorite" VisibleIndex="3" Width="70px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="32" Width="60px" ButtonType="Button">
                <EditButton Visible="True">
                    <Image Url="~/Images/edit32.png">
                    </Image>
                </EditButton>
                <CellStyle>
                    <BorderRight BorderColor="#E9E9E9" BorderStyle="Dashed" BorderWidth="1px" />
                </CellStyle>
                <HeaderTemplate>
                    <dx:ASPxButton ID="showFilterBtn" runat="server" AutoPostBack="False" EnableTheming="True" Text="Filter" Theme="Moderno" ImagePosition="Top" Width="100%">
                        <ClientSideEvents Click="function(s, e) {
    ShoppingCategoriesGrid.PerformCallback('showFilter')	
}" />
                        <Image IconID="filter_crossdatasourcefiltering_16x16office2013">
                        </Image>
                        <Paddings PaddingLeft="0px" PaddingRight="0px" />
                    </dx:ASPxButton>
                </HeaderTemplate>
            </dx:GridViewCommandColumn>
        </Columns>
         <ClientSideEvents Init="OnInit" EndCallback="OnEndCallback" />
 <SettingsBehavior ColumnResizeMode="NextColumn" />
                            <SettingsPager PageSize="15" ShowNumericButtons="False">
                            </SettingsPager>

                            <SettingsEditing Mode="PopupEditForm" PopupEditFormAllowResize="True"
                                PopupEditFormWidth="600px" />

                            <Settings ShowVerticalScrollBar="True" ShowFilterBar="Auto" ShowFilterRowMenu="True" VerticalScrollBarMode="Auto" />

                            <SettingsPopup>
                                <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" />
                            </SettingsPopup>

                           <SettingsCommandButton>
                                <EditButton ButtonType="Image">
                                </EditButton>
                            </SettingsCommandButton>

                            <SettingsSearchPanel CustomEditorID="shTextBox" />
                            <Styles>
                                <Header Wrap="True" ForeColor="#333333">
                                </Header>
                                <GroupRow BackColor="White">
                                </GroupRow>
                                <RowHotTrack BackColor="#FFFAF2" ForeColor="Black">
                                </RowHotTrack>
                                <FocusedRow BackColor="PapayaWhip">
                                </FocusedRow>
                                <Cell Font-Size="13px">
                                    <Paddings PaddingBottom="5px" PaddingTop="5px" />
                                    <BorderLeft BorderStyle="None" />
                                    <BorderTop BorderColor="#E9E9E9" BorderStyle="Dashed" BorderWidth="1px" />
                                    <BorderRight BorderColor="#E9E9E9" BorderStyle="Dashed" BorderWidth="1px" />
                                </Cell>
                                <PagerBottomPanel>
                                    <Paddings PaddingBottom="0px" />
                                </PagerBottomPanel>
                                <TitlePanel HorizontalAlign="Left">
                                </TitlePanel>
                            </Styles>
         <Settings VerticalScrollBarMode="Auto" />
    </dx:ASPxGridView>
    
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Publication" OnInserting="EntityDataSource1_Inserting">
</asp:EntityDataSource>
</asp:Content>
