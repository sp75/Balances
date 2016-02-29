<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="Balances._Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function OnInit(s, e) {
            AdjustSize();
        }
        function OnEndCallback(s, e) {
            AdjustSize();
            ASPxTextBox1.SetValue('');
        }
        function OnControlsInitialized(s, e) {
            ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
                AdjustSize();
            });
        }
        function AdjustSize() {
            var height = Math.max(0, document.documentElement.clientHeight);
            PublicationGridView.SetHeight(height - 200);
        }
    </script>
    <div style="margin: 10px 5px 5px 5px">

        <div style="padding-top: 10px; height: 45px; margin-bottom: 20px;">
            <table class="BottomMargin" width="100%">
                <tr>
                    <td style="padding-right: 4px">
                        <img src="/Images/orders.png" /></td>
                    <td style="padding-left: 15px; text-align: right;" nowrap="nowrap">
                        <span style="font-size: x-large">Items</span>
                    </td>
                    <td style="padding-bottom: 15px; padding-right: 15px;">&nbsp;</td>

                    <td width="100%">
                        <dx:ASPxButtonEdit ID="shTextBox" runat="server" ClientInstanceName="shTextBox" EnableTheming="True" Theme="Moderno" Width="400px" NullText="Enter text to search...">
                            <ClearButton Visibility="True" DisplayMode="Always">
                            </ClearButton>
                        </dx:ASPxButtonEdit>
                    </td>
                    <td>
                        
    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientInstanceName="ASPxTextBox1" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox>
                                
                    </td>
                    <td style="width: 4px"><span class="dxtv-ndTxt dx-vam" style="font-size: x-large">
                        <dx:ASPxButton ID="btnXlsExport" runat="server" Text="New Post" Theme="Moderno" UseSubmitBehavior="False" AllowFocus="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	PublicationGridView.AddNewRow();
}" />
                            <Image IconID="actions_insert_16x16">
                            </Image>
                        </dx:ASPxButton>
                    </span></td>

                </tr>
            </table>
        </div>


        <dx:ASPxGridView ID="PublicationGridView" runat="server" AutoGenerateColumns="False" ClientInstanceName="PublicationGridView"
            Width="100%" DataSourceID="EntityDataSource1" KeyboardSupport="True" KeyFieldName="Id" OnRowInserting="PublicationGridView_RowInserting" EnableTheming="True" Theme="Moderno" OnCustomCallback="PublicationGridView_CustomCallback">
            <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
            <Settings VerticalScrollBarMode="Auto" />
            <ClientSideEvents Init="OnInit" EndCallback="OnEndCallback" />
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowGroupPanel="True" />
            <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <EditButton ButtonType="Image">
                    <Image ToolTip="Edit" Url="Images/edit32.png" />
                </EditButton>
                <DeleteButton ButtonType="Image">
                     <Image ToolTip="Delete" Url="Images/delete32.png" />
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="1000px" />
            </SettingsPopup>
            <SettingsSearchPanel CustomEditorID="shTextBox" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ButtonType="Button" ShowEditButton="True">

                    <CellStyle>
                        <BorderRight BorderColor="#E9E9E9" BorderStyle="Dashed" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="8" Width="60px">
                    <EditFormSettings VisibleIndex="3" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="PublishedDate" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="MaterialName" VisibleIndex="4">
                    <EditFormSettings VisibleIndex="0" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Category" FieldName="CategoryId" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings VisibleIndex="2" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn FieldName="Quantity" VisibleIndex="9">
                    <PropertiesSpinEdit DisplayFormatString="g" Width="100px" MaxValue="10000000" MinValue="1">
                    </PropertiesSpinEdit>
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataImageColumn FieldName="ImageUrl" VisibleIndex="11" Caption="Image" Width="80px">
                    <PropertiesImage ImageHeight="50px">
                    </PropertiesImage>
 <DataItemTemplate>
                <a href='<%#Eval("ImageUrl")%>' target="_blank">
                <dx:ASPxImage ID="ASPxImage1" runat="server" Height="50" ImageUrl='<%#Eval("ImageUrl") %>' ShowLoadingImage="true" >
                </dx:ASPxImage>
                </a>
            </DataItemTemplate>

                    <EditItemTemplate>
                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="Metropolis" UploadMode="Auto" Width="280px" ClientInstanceName="ASPxUploadControl1" OnFilesUploadComplete="ASPxUploadControl1_FilesUploadComplete">
                            <ClientSideEvents FileUploadComplete="function(s, e) {
	ASPxTextBox1.SetValue(e.callbackData)
}" />
                            <AdvancedModeSettings EnableDragAndDrop="True" EnableMultiSelect="True">
                                <FileListItemStyle CssClass="pending dxucFileListItem">
                                </FileListItemStyle>
                            </AdvancedModeSettings>
                        </dx:ASPxUploadControl>
                    </EditItemTemplate>


                </dx:GridViewDataImageColumn>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="13" Width="60px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="3">
                    <EditFormSettings VisibleIndex="4" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LifeTime" Visible="False" VisibleIndex="10">
                    <PropertiesComboBox ValueType="System.Int32" Width="100px">
                        <Items>
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="20" Value="20" />
                            <dx:ListEditItem Text="30" Value="30" />
                            <dx:ListEditItem Text="60" Value="60" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" VisibleIndex="5" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="Description" VisibleIndex="7">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataMemoColumn>
            </Columns>
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


            <Paddings Padding="0px" />
            <Border BorderWidth="0px" />
            <BorderBottom BorderWidth="1px" />
        </dx:ASPxGridView>


    </div>


    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Publication" OnInserting="EntityDataSource1_Inserting" OrderBy="it.PublishedDate desc" Where="it.Expired = 0 and  (it.CategoryId = @CategoryId or @CategoryId is null)" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:Parameter DbType="Int32" Name="CategoryId" />
        </WhereParameters>
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=BalancesEntities" DefaultContainerName="BalancesEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Category">
</asp:EntityDataSource>

</asp:Content>