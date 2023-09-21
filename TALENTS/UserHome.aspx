<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="TALENTS.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <style>
        .img-title img {
            width:370px;
            min-width:100%;
        }

        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
        }

        #select2-ComboCity-container {
            text-align: center
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 180px;background-color:white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="container" style="max-width: 1200px; padding-bottom: 50px;">
                        <div class="row mb-5" style="border: 1px solid; border-color: black; border-radius:4px; margin-left: auto; margin-right: auto; padding: 20px">
                            <h2 class="text-black pt-3 pb-5 d-block text-center col-12">RICERCA</h2>
                            <div class="input-group mb-4 input-group-lg col-6 offset-2 text-right">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">CITTA</span>
                                </div>
                                <div class="form-control pt-0 pb-0 pr-0">
                                    <asp:DropDownList runat="server" ID="ComboCity" CssClass="custom-select" ClientIDMode="Static"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-2 text-right">
                                <asp:Button runat="server" ID="BtnSearch" Text="RICERCA" CssClass="btn btn-block btn-dark btn-lg text-white" OnClick="BtnSearch_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Repeater runat="server" ID="ModelPhotoRepeater">
                                <ItemTemplate>
                                    <div class="col-lg-4 col-12 text-center p-3">
                                        <div class="row">
                                            <div class="col-12" style="height:426px; overflow:hidden;padding-left:15px;padding-right:15px;">
                                                <a href="UserHomeDetail.aspx?modelId=<%#Eval("Id") %>" class="img-title">
                                                    <image src="Upload/Photos/<%#Eval("Image") %>"></image>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 pt-4">
                                                <a href="UserHomeDetail.aspx?modelId=<%#Eval("Id") %>">
                                                    <h2 class="text-black pb-3 text-left"><%#Eval("Name") %></h2>
                                                </a>
                                                <h5 class="text-black text-left"><%#Eval("CityResidence") %></h5>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script>
        $("#ComboCity").select2({ theme: 'bootstrap' });
    </script>
</asp:Content>