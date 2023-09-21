<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelHomeDetail.aspx.cs" Inherits="TALENTS.ModelHomeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/swiper-bundle.min.css">
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #000;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .swiper-container {
            width: 100%;
            height: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-slide {
            background-size: cover;
            background-position: cover;
        }

        .gallery-top {
            height: 80%;
            width: 30%;
        }

        .gallery-thumbs {
            height: 20%;
            box-sizing: border-box;
            padding: 10px 0;
            width: 200px;
            float: left;
        }

            .gallery-thumbs .swiper-slide {
                width: 25%;
                height: 100%;
                opacity: 0.4;
            }

            .gallery-thumbs .swiper-slide-thumb-active {
                opacity: 1;
            }

        .img-thumb {
            width: 126px !important;
            height: 126px !important;
            margin-right: 0px !important;
        }

        h1 {
            font-size: 50px;
            font-family: Dosis;
            letter-spacing: 3.5px;
        }

        h4 {
            font-size: 18px;
            font-family: Dosis;
            font-style: italic;
        }

        h2 {
            font-family: Dosis;
            font-size: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: gray;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    
                        <div class="site-wrap" style="position: relative;height:1000px;">
                            <div class="p-4 pl-2 pr-2 rounded rounded-5 text-white mx-auto" style="background-color: rgb(0,0,0,.5); width: auto; position: absolute; bottom: 20%; left: 30px;">
                                <h1 runat="server" id="ModelSurname" class="pb-3"></h1>
                                <div class="col-12 pl-0">
                                    <h4 class="d-inline">Citta: </h4>
                                    <h4 runat="server" id="ModelResid" class="d-inline"></h4>
                                </div>
                                <div class="col-12 pb-2 pl-0">
                                    <h4 class="d-inline">Nazione: </h4>
                                    <h4 runat="server" id="ModelEth" class="d-inline"></h4>
                                </div>
                                <div class="col-12 pb-2 pl-0">
                                    <h4 class="d-inline">Altezza: </h4>
                                    <h4 runat="server" id="ModelHeight" class="d-inline"></h4>
                                </div>
                                <div class="col-12 pb-2 pl-0">
                                    <h4 class="d-inline">Taglia: </h4>
                                    <h4 runat="server" id="ModelWeight" class="d-inline"></h4>
                                </div>
                                <div class="col-12 pb-2 pl-0">
                                    <h4 class="d-inline">Occhi: </h4>
                                    <h4 runat="server" id="ModelEye" class="d-inline"></h4>
                                </div>
                                <div class="col-12 pb-2 pl-0">
                                    <h4 class="d-inline">Capelli: </h4>
                                    <h4 runat="server" id="ModelHairColor" class="d-inline"></h4>
                                </div>
                            </div>
                            <div class="swiper-container gallery-top">
                                <div class="swiper-wrapper">
                                    <asp:Repeater runat="server" ID="DefaultPhotoRepeater1">
                                        <ItemTemplate>
                                            <div class="swiper-slide"
                                                style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot; );">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="p-4 pl-2 pr-2 rounded rounded-5 text-white" style="width: 120px; position: absolute; bottom: 20%; right: 30px; text-align:center;">
                                <div class="swiper-button-next swiper-button-white text-white"></div>
                                <button id="BtnSwaperPause" class="btn btn-lg bg-gradient text-white">
                                    <i class="fa fa-pause"></i>
                                </button>
                                <div class="swiper-button-prev swiper-button-white text-white"></div>
                            </div>
                            <div class="swiper-container gallery-thumbs" style="width: 50%; float: left">
                                <div class="swiper-wrapper">
                                    <asp:Repeater runat="server" ID="DefaultPhotoRepeater2">
                                        <ItemTemplate>
                                            <div class="swiper-slide img-thumb"
                                                style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot; );">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script src="Scripts/swiper-bundle.min.js"></script>
    <script>
        var galleryThumbs = new Swiper('.gallery-thumbs', {
            spaceBetween: 10,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
            loop: true,
        });
        var galleryTop = new Swiper('.gallery-top', {
            spaceBetween: 1000,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: galleryThumbs,
            },
            autoplay:
            {
                deply: 5000,
            },
            loop: true,
        });

        // Stop autoplay when stop button is clicked
        var stopButton = document.querySelector('#BtnSwaperPause');
        stopButton.addEventListener('click', function (e) {
            if (galleryTop.autoplay.running) {
                galleryTop.autoplay.stop();
                stopButton.innerHTML = '<i class="fa fa-play"></i>';
            } else {
                galleryTop.autoplay.start();
                stopButton.innerHTML = '<i class="fa fa-pause"></i>';
            }
            e.preventDefault();
        });
    </script>
</asp:Content>