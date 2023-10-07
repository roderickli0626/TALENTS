<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelHome.aspx.cs" Inherits="TALENTS.ModelHome" %>
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
    <style>
        .box {
            position: relative;
            background: #eeee;
            float: left;
        }

        .ribbon {
            position: absolute;
            right: -5px;
            top: -5px;
            z-index: 1;
            overflow: hidden;
            width: 93px;
            height: 93px;
            text-align: right;
        }

        .ribbon span {
            font-size: 0.8rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 32px;
            transform: rotate(45deg);
            width: 125px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 17px;
            // change this, if no border right: -29px;
            // change this, if no border
        }

        .ribbon span::before {
            content: '';
            position: absolute;
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79A70A;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .ribbon span::after {
            content: '';
            position: absolute;
            right: 0%;
            top: 100%;
            z-index: -1;
            border-right: 3px solid #79A70A;
            border-left: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .red span {
            background: linear-gradient(#f70505 0%, #8f0808 100%);
        }

        .red span::before {
            border-left-color: #8f0808;
            border-top-color: #8f0808;
        }

        .red span::after {
            border-right-color: #8f0808;
            border-top-color: #8f0808;
        }

        .blue span {
            background: linear-gradient(#2989d8 0%, #1e5799 100%);
        }

        .blue span::before {
            border-left-color: #1e5799;
            border-top-color: #1e5799;
        }

        .blue span::after {
            border-right-color: #1e5799;
            border-top-color: #1e5799;
        }

        .gray span {
            background: linear-gradient(#555555 0%, #000000 100%);
        }

        .gray span::before {
            border-left-color: gray;
            border-top-color: gray;
        }

        .gray span::after {
            border-right-color: gray;
            border-top-color: gray;
        }

        .foo {
            clear: both;
        }

        .bar {
            content: "";
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79a70a;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79a70a;
        }

        .baz {
            font-size: 1rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 2em;
            transform: rotate(45deg);
            width: 100px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 100px;
            left: 1000px;
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
                                            <div class="col-12" style="height:426px; overflow:hidden;padding:10px;">
                                                <%# Eval("Mark") %>
                                                <a href="ModelHomeDetail.aspx?modelId=<%#Eval("Id") %>" class="img-title">
                                                    <image src="Upload/Photos/<%#Eval("Image") %>"></image>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 pt-4">
                                                <a href="ModelHomeDetail.aspx?modelId=<%#Eval("Id") %>">
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
