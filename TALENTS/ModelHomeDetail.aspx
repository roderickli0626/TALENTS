<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelHomeDetail.aspx.cs" Inherits="TALENTS.ModelHomeDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/baguetteBox.min.css" />
    <link rel="stylesheet" href="Content/CSS/grid-gallery.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" data-setbg="Content/Images/slider-1.jpg" style="padding-top: 180px;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <section class="gallery-block grid-gallery pt-0">
                        <div class="container">
                            <div class="heading">
                                <h2 runat="server" id="ModelName" class="text-white" style="font-size:36px">Model Name</h2>
                            </div>
                            <div class="row p-4 pl-5 pr-5 rounded rounded-5 text-white mx-auto mb-5" style="background-color: #353535; width: 350px">
                                <div class="col-12 pb-2">
                                    <h4 class="d-inline">Name: </h4>
                                    <h4 runat="server" id="ModelSurname" class="d-inline float-right"></h4>
                                </div>
                                <div class="col-12 pb-2">
                                    <h4 class="d-inline">Age: </h4>
                                    <h4 runat="server" id="ModelAge" class="d-inline float-right"></h4>
                                </div>
                                <div class="col-12 pb-2">
                                    <h4 class="d-inline">Height: </h4>
                                    <h4 runat="server" id="ModelHeight" class="d-inline float-right"></h4>
                                </div>
                                <div class="col-12 pb-2">
                                    <h4 class="d-inline">Weight: </h4>
                                    <h4 runat="server" id="ModelWeight" class="d-inline float-right"></h4>
                                </div>
                                <div class="col-12 pb-2">
                                    <h4 class="d-inline">Nationality: </h4>
                                    <h4 runat="server" id="ModelEth" class="d-inline float-right"></h4>
                                </div>
                                <div class="col-12">
                                    <h4 class="d-inline">Residence: </h4>
                                    <h4 runat="server" id="ModelResid" class="d-inline float-right"></h4>
                                </div>
                            </div>
                            <div class="row">
                                <asp:Repeater runat="server" ID="DefaultPhotoRepeater">
                                    <ItemTemplate>
                                        <div class="col-md-6 col-lg-4 item text-center">
                                            <a class="lightbox" href="Upload/Photos/<%#Eval("Image") %>">
                                                <img class="img-fluid image scale-on-hover rounded rounded-5" style="height:300px; width:300px;" src="Upload/Photos/<%#Eval("Image") %>">
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </section>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script src="Scripts/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.grid-gallery', { animation: 'slideIn' });
    </script>
</asp:Content>
