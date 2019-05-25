<%@ Page Title="Vissen" Language="C#" MasterPageFile="~/Site - Collections.Master" AutoEventWireup="true" CodeBehind="Vissen.aspx.cs" Inherits="Vissen.Vissen" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="SideContent" runat="server">

    <div class="row">

        <section>
            <nav>
                <ul>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                        EmptyDataText="There are no data records to display." AllowSorting="True" AllowPaging="True" CellPadding="3" ForeColor="Black" 
                        GridLines="Vertical" BackColor="White" BorderColor="#212121" BorderStyle="Solid" BorderWidth="1px" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100px">

                        <AlternatingRowStyle BackColor="#212121" ForeColor="#95959d"/>
                        <RowStyle BackColor="#212121" ForeColor="#95959d" />
                        <Columns>
                            <asp:BoundField DataField="ID" ReadOnly="True" SortExpression="ID" InsertVisible="True" Visible="true" ItemStyle-Font-Size="0px"/>
                            <asp:ButtonField DataTextField="Name" CommandName="Select"/>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#212121" ForeColor="#95959d" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:VerzamelingenConnectionString %>"  
                        SelectCommand="SELECT [ID], [Name], [Categorie], [Status] FROM [tblParent]" 
                        UpdateCommand="UPDATE [tblParent] SET [Name] = @Name, [Categorie] = @Categorie, [Status] = @Status WHERE [ID] = @ID" DeleteCommand="DELETE FROM [tblParent] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblParent] ([Name], [Categorie], [Status]) VALUES (@Name, @Categorie, @Status)">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Categorie" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Categorie" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ul>
            </nav>
        </section>

        <div class="col-md-3">

            <h2>Details</h2>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="200px" AutoGenerateRows="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource3" BackColor="#212121" EmptyDataText="Selecteer een soort vis in het menu links" ForeColor="#95959d" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <EmptyDataTemplate>
                <asp:LinkButton ID="InsertButton" runat="server" CommandName="New" Text="Selecteer een soort vis in het menu links of voeg een nieuw element toe door hierop te klikken" ForeColor="#95959d" />
            </EmptyDataTemplate>
                <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle BackColor="#848484" ForeColor="Black" />
                <EditRowStyle BackColor="#212121" Font-Bold="True" ForeColor="#95959d" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            </asp:DetailsView>


            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VerzamelingenConnectionString %>" 
                DeleteCommand="DELETE FROM [tblParent] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [tblParent] ([Name], [Categorie], [Status]) VALUES (@Name, @Categorie, @Status)" 
                SelectCommand="SELECT [ID], [Name], [Categorie], [Status] FROM [tblParent] WHERE ([ID] = @ID)" 
                UpdateCommand="UPDATE [tblParent] SET [Name] = @Name, [Categorie] = @Categorie, [Status] = @Status WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Categorie" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Categorie" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

             <br /><br /><br />
            <asp:Image Width="200px" ID="Image1" runat="server" ImageUrl="https://www.pngarts.com/files/4/Fish-Transparent-Background-PNG.png" />
            </div>

       
        <div class="col-md-4">

        <h2>Soorten vissen</h2>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
            BackColor="#212121" EmptyDataText="Er is geen data om weer te geven" ForeColor="#95959d" AllowSorting="True" AllowPaging="True" 
            CellPadding="3" GridLines="Vertical" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Width="612px">

            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#848484" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="True" Visible="false" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="ParentID" HeaderText="ParentID" SortExpression="ParentID" Visible="false" />
                <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
                <asp:BoundField DataField="Gewicht" HeaderText="Gewicht" SortExpression="Gewicht" />
                <asp:BoundField DataField="Waarde" HeaderText="Waarde" SortExpression="Waarde" />
                <asp:BoundField DataField="Kleur" HeaderText="Kleur" SortExpression="Kleur" />
                <asp:BoundField DataField="Lengte" HeaderText="Lengte" SortExpression="Lengte" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#212121" ForeColor="#95959d" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#969696" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VerzamelingenConnectionString %>" 
            SelectCommand="SELECT [ID], [Name], [ParentID], [Categorie], [Beschrijving], [Prijs], [Gewicht], [Waarde], [Kleur], [Lengte] FROM [tblChild] WHERE ParentID = @SelectedID" 
            DeleteCommand="DELETE FROM [tblChild] WHERE [ID] = @original_ID" 
            InsertCommand="INSERT INTO [tblChild] ([Name], [ParentID], [Categorie], [Beschrijving], [Prijs], [Gewicht], [Waarde], [Kleur], [Lengte]) VALUES (@Name, @ParentID, @Categorie, @Beschrijving, @Prijs, @Gewicht, @Waarde, @Kleur, @Lengte)" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [tblChild] SET [Name] = @Name, [ParentID] = @ParentID, [Categorie] = @Categorie, [Beschrijving] = @Beschrijving, [Prijs] = @Prijs, [Gewicht] = @Gewicht, [Waarde] = @Waarde, [Kleur] = @Kleur, [Lengte] = @Lengte WHERE [ID] = @original_ID">
            <SelectParameters>
                <asp:SessionParameter SessionField="SelectedID" Name="SelectedID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int32" />
                <asp:Parameter Name="Categorie" Type="String" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="Prijs" Type="Double" />
                <asp:Parameter Name="Gewicht" Type="Double" />
                <asp:Parameter Name="Waarde" Type="String" />
                <asp:Parameter Name="Kleur" Type="String" />
                <asp:Parameter Name="Lengte" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int32" />
                <asp:Parameter Name="Categorie" Type="String" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="Prijs" Type="Double" />
                <asp:Parameter Name="Gewicht" Type="Double" />
                <asp:Parameter Name="Waarde" Type="String" />
                <asp:Parameter Name="Kleur" Type="String" />
                <asp:Parameter Name="Lengte" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <br />
        <h2>Details</h2>



        <asp:DetailsView ID="DetailsView2" runat="server" Height="44px" Width="611px" AutoGenerateRows="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource4" BackColor="#212121" 
            EmptyDataText="Selecteer een soort vis in de tabel hierboven" ForeColor="#95959d" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <EmptyDataTemplate>
                <asp:LinkButton ID="InsertButton" runat="server" CommandName="New" Text="Selecteer een soort vis in de tabel hierboven of voeg een nieuw element toe door hierop te klikken" ForeColor="#95959d" />
            </EmptyDataTemplate>
            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#848484" ForeColor="Black" />
            <EditRowStyle BackColor="#212121" Font-Bold="True" ForeColor="#95959d" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />

                <asp:TemplateField HeaderText="ParentID" SortExpression="ParentID">
                  <ItemTemplate>
                    <asp:Label runat="server" ID ="ParentIDLabel" Text=<%# Eval("ParentID") %> />
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:SqlDataSource ID="ParentData" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:VerzamelingenConnectionString %>" 
                                       SelectCommand="SELECT * FROM tblParent" />
                    <asp:DropDownList ID="ParentDDL" runat="server" DataSourceID="ParentData" 
                                      DataTextField="Name" DataValueField="ID" SelectedValue=<%# Bind("ParentID") %> />
                  </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />

                <asp:TemplateField HeaderText="Beschrijving" SortExpression="Beschrijving">
                    <EditItemTemplate>
                        <asp:TextBox TextMode="MultiLine" Width="200px" ID="TextBox2" runat="server" Text='<%# Bind("Beschrijving") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox TextMode="MultiLine" Width="200px" ID="TextBox2" runat="server" Text='<%# Bind("Beschrijving") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Beschrijving") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" />
                <asp:BoundField DataField="Gewicht" HeaderText="Gewicht" SortExpression="Gewicht" />
                <asp:BoundField DataField="Waarde" HeaderText="Waarde" SortExpression="Waarde" />
                <asp:BoundField DataField="Kleur" HeaderText="Kleur" SortExpression="Kleur" />
                <asp:BoundField DataField="Lengte" HeaderText="Lengte" SortExpression="Lengte" />
                <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" />

            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VerzamelingenConnectionString %>" 
            DeleteCommand="DELETE FROM [tblChild] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [tblChild] ([Name], [ParentID], [Categorie], [Beschrijving], [Waarde], [Prijs], [Gewicht], [Kleur], [Lengte]) VALUES (@Name, @ParentID, @Categorie, @Beschrijving, @Waarde, @Prijs, @Gewicht, @Kleur, @Lengte)" 
            SelectCommand="SELECT [ID], [Name], [ParentID], [Categorie], [Beschrijving], [Waarde], [Prijs], [Gewicht], [Kleur], [Lengte] FROM [tblChild] WHERE ([ID] = @ID)" 
            UpdateCommand="UPDATE [tblChild] SET [Name] = @Name, [ParentID] = @ParentID, [Categorie] = @Categorie, [Beschrijving] = @Beschrijving, [Waarde] = @Waarde, [Prijs] = @Prijs, [Gewicht] = @Gewicht, [Kleur] = @Kleur, [Lengte] = @Lengte WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int32" />
                <asp:Parameter Name="Categorie" Type="String" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="Waarde" Type="String" />
                <asp:Parameter Name="Prijs" Type="Double" />
                <asp:Parameter Name="Gewicht" Type="Double" />
                <asp:Parameter Name="Kleur" Type="String" />
                <asp:Parameter Name="Lengte" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int32" />
                <asp:Parameter Name="Categorie" Type="String" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="Waarde" Type="String" />
                <asp:Parameter Name="Prijs" Type="Double" />
                <asp:Parameter Name="Gewicht" Type="Double" />
                <asp:Parameter Name="Kleur" Type="String" />
                <asp:Parameter Name="Lengte" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        </div>
       



    </div>
</asp:Content>
