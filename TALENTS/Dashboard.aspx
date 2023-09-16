<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TALENTS.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <style>
        .img-title:hover {
            opacity: 0.7;
        }

        .img-title img {
            height: 425px;
            max-width: 425px;
            border-radius: 10px;
            box-shadow: 10px 10px 8px rgba(0, 0, 0, 0.5);
            transition: transform .3s; /* Animation */
        }

        .img-title img:hover {
            transform: scale(1.05);
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
            <div class="set-bg" data-setbg="Content/Images/slider-1.jpg" style="padding-top: 180px;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="container" style="max-width: 1500px; padding-bottom: 50px;">
                        <div class="row mb-5" style="border: solid; border-color: white; margin-left: 20px; margin-right: 20px; padding: 20px">
                            <h2 class="text-white pt-3 pb-5 d-block text-center col-12">SEARCH</h2>
                            <div class="input-group mb-3 input-group-lg col-6 offset-2 text-right">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">City</span>
                                </div>
                                <div class="form-control pt-0 pb-0 pr-0">
                                    <asp:DropDownList runat="server" ID="ComboCity" CssClass="custom-select" ClientIDMode="Static"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-2 text-right">
                                <asp:Button runat="server" ID="BtnSearch" Text="Search" CssClass="btn btn-block btn-dark btn-lg text-white" OnClick="BtnSearch_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Repeater runat="server" ID="ModelPhotoRepeater">
                                <ItemTemplate>
                                    <div class="col-lg-4 col-12 text-center p-3">
                                        <a href="DashboardDetail.aspx?modelId=<%#Eval("Id") %>" class="img-title">
                                            <image src="Upload/Photos/<%#Eval("Image") %>"></image>
                                            <div>
                                                <h3 class="text-white pt-3"><%#Eval("Name") %></h3>
                                                <h5 class="text-white"><%#Eval("CityResidence") %></h5>
                                            </div>
                                        </a>
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
