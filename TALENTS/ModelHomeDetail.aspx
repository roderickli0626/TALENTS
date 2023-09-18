<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelHomeDetail.aspx.cs" Inherits="TALENTS.ModelHomeDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/baguetteBox.min.css" />
    <link rel="stylesheet" href="Content/CSS/grid-gallery.css">
    <link rel="stylesheet" href="Content/CSS/magnific-popup.css">
    <link rel="stylesheet" href="Content/CSS/jquery-ui.css">
    <link rel="stylesheet" href="Content/CSS/owl.carousel.min.css">
    <link rel="stylesheet" href="Content/CSS/owl.theme.default.min.css">
    <link rel="stylesheet" href="Content/CSS/bootstrap-datepicker.css">
    <link rel="stylesheet" href="Content/CSS/flaticon.css">
    <link rel="stylesheet" href="Content/CSS/aos.css">
    <link rel="stylesheet" href="Content/CSS/jquery.scrollbar.css">
    <link rel="stylesheet" href="Content/CSS/fancybox.min.css">
    <link rel="stylesheet" href="Content/CSS/swiper.min.css">
    <link rel="stylesheet" href="Content/CSS/style(1).css">
    <link rel="stylesheet" href="Content/CSS/style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 180px; background-color: gray;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <section class="gallery-block grid-gallery pt-0">
                        <div class="site-wrap" style="position: relative;">
                            <div class="p-4 pl-2 pr-2 rounded rounded-5 text-white mx-auto mb-5" style="background-color: #353535; width: 300px; position: absolute; bottom: 100px; left: 100px;">
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
                            <div class="swiper-container gallery-top swiper-container-fade swiper-container-initialized swiper-container-horizontal"
                                style="width: 50%;">
                                <div class="swiper-wrapper" style="transition-duration: 300ms;">
                                    <asp:Repeater runat="server" ID="DefaultPhotoRepeater1">
                                    <ItemTemplate>
                                        <div class="swiper-slide cover"
                                            style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot;); width: 960px; opacity: 1; transform: translate3d(0px, 0px, 0px); transition-duration: 300ms;">
                                        </div>
                                    </ItemTemplate>
                                    </asp:Repeater>
                                    <div class="swiper-button-next swiper-button-white" tabindex="0" role="button" aria-label="Next slide"
                                        aria-disabled="false">
                                    </div>
                                    <div class="swiper-button-prev swiper-button-white" tabindex="0" role="button" aria-label="Previous slide"
                                        aria-disabled="false">
                                    </div>
                                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs swiper-container-initialized swiper-container-horizontal swiper-container-free-mode swiper-container-thumbs">
                                <div class="swiper-wrapper" style="transition-duration: 300ms; transform: translate3d(0px, 0px, 0px); justify-content: center;">
                                    <asp:Repeater runat="server" ID="DefaultPhotoRepeater2">
                                    <ItemTemplate>
                                        <div class="swiper-slide cover swiper-slide-visible swiper-slide-active"
                                            style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot;); width: 183px; margin-right: 10px;">
                                        </div>
                                    </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
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

    <script async="true" type="text/javascript" src="Scripts/analytics.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery-migrate-3.0.1.min.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/owl.carousel.min.js"></script>

    <script src="Scripts/jquery.countdown.min.js"></script>
    <script src="Scripts/jquery.magnific-popup.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/aos.js"></script>
    <script src="Scripts/jquery.fancybox.min.js"></script>
    <script src="Scripts/swiper.min.js"></script>
    <script src="Scripts/jquery.scrollbar.js"></script>
    <script src="Scripts/main(1).js"></script>
</asp:Content>
