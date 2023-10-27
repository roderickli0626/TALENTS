<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserHomeDetail.aspx.cs" Inherits="TALENTS.UserHomeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/swiper-bundle.min.css">
    <link rel="stylesheet" href="Content/CSS/scroll-tab.css">
    <%--<link rel="stylesheet" href="Content/CSS/custom-user-model-details.css">--%>
    <style>
        .starrating > input {
            display: none;
        }
        /* Remove radio buttons */

        .starrating > label:before {
            content: "\f005"; /* Star */
            margin: 2px;
            font-size: 1.5em;
            font-family: FontAwesome;
            display: inline-block;
        }

        .starrating > label {
            color: #222222; /* Start color when not clicked */
        }

        .starrating > input:checked ~ label {
            color: #ffca08;
        }
        /* Set yellow color when star checked */

        .starrating > input:hover ~ label {
            color: #ffca08;
        }
        /* Set yellow color when star hover */
    </style>
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
            background-position: center;
        }

        .gallery-top .swiper-slide.swiper-slide-active {
            margin-right: 1050px !important;
        }

        .gallery-top {
            height: 100%;
            width: 45%;
        }

        .gallery-thumbs {
            height: 20%;
            box-sizing: border-box;
            padding: 10px 0;
            width: 200px;
            float: left;
            position: absolute;
            bottom: 0;
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
            height: auto !important;
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
            color: white;
        }

        h2 {
            font-family: Dosis;
            font-size: 28px;
        }

        .swiper-button-next {
            position: sticky;
            float: right;
        }

        .swiper-button-prev {
            position: sticky;
            float: left;
        }
    </style>
    <style>
        .preview-images-zone {
            /*width: 100%;*/
            border: 1px solid #ddd;
            min-height: 180px;
            /* display: flex; */
            padding: 5px 5px 0px 5px;
            position: relative;
            overflow: auto;
        }

            .preview-images-zone > .preview-image:first-child {
                height: 87px;
                width: 87px;
                position: relative;
                margin-right: 5px;
            }

            .preview-images-zone > .preview-image {
                height: 87px;
                width: 87px;
                position: relative;
                margin-right: 5px;
                float: left;
                margin-bottom: 5px;
            }

                .preview-images-zone > .preview-image > .image-zone {
                    width: 100%;
                    height: 100%;
                }

                    .preview-images-zone > .preview-image > .image-zone > img {
                        width: 100%;
                        height: 100%;
                    }

                .preview-images-zone > .preview-image > .tools-edit-image {
                    position: absolute;
                    z-index: 100;
                    color: #fff;
                    bottom: 0;
                    width: 100%;
                    text-align: center;
                    margin-bottom: 10px;
                    display: none;
                }

                .preview-images-zone > .preview-image > .image-cancel {
                    font-size: 18px;
                    position: absolute;
                    top: 0;
                    right: 0;
                    font-weight: bold;
                    margin-right: 10px;
                    cursor: pointer;
                    display: none;
                    z-index: 100;
                }

        .preview-image:hover > .image-zone {
            /*cursor: move;*/
            opacity: .5;
        }

        .preview-image:hover > .tools-edit-image,
        .preview-image:hover > .image-cancel {
            display: block;
        }

        .ui-sortable-helper {
            width: 90px !important;
            height: 90px !important;
        }
    </style>

    <style>
        .scrtabs-tabs-fixed-container {
            background-color: rgb(0,0,0,0.3);
        }

        .nav-item > .nav-link {
            color: white;
        }

        .scrtabs-tab-scroll-arrow > span {
            border-right: 3px solid white;
            border-bottom: 3px solid white;
        }

        .tab-content {
            background-color: rgb(0,0,0,0.6);
            border-radius: 5px;
            color: white;
            padding: 20px;
        }
    </style>
    <style>
        .swiper-button-next::after {
            font-size: 30px;
        }
        .swiper-button-prev::after {
            font-size: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: gray;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfPurchased" runat="server" ClientIDMode="Static" />
                    <div class="site-wrap" style="position: relative; height: 1000px; overflow: hidden">
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
                                <h4 runat="server" id="ModelHeight0" class="d-inline"></h4>
                            </div>
                            <div class="col-12 pb-2 pl-0">
                                <h4 class="d-inline">Peso: </h4>
                                <h4 runat="server" id="ModelWeight0" class="d-inline"></h4>
                            </div>
                            <div class="col-12 pb-2 pl-0">
                                <h4 class="d-inline">Occhi: </h4>
                                <h4 runat="server" id="ModelEye0" class="d-inline"></h4>
                            </div>
                            <div class="col-12 pb-2 pl-0">
                                <h4 class="d-inline">Capelli: </h4>
                                <h4 runat="server" id="ModelHairColor0" class="d-inline"></h4>
                            </div>
                        </div>
                        <div class="swiper-container gallery-top" style="padding-right: 200px;">
                            <div class="swiper-wrapper">
                                <asp:Repeater runat="server" ID="DefaultPhotoRepeater1">
                                    <ItemTemplate>
                                        <div class="swiper-slide" data-swiper-autoplay="6000"
                                            style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot; );">
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="pl-2 pr-2 text-white" style="width: auto; position: absolute; bottom: 20%; right: 30px;">
                            <div class="" style="width: 600px;">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist" style="display: none">
                                    <li class="nav-item"><a class="nav-link active" href="#tab1" role="tab" data-toggle="tab">Biography</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab2" role="tab" data-toggle="tab">About Me</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab4" role="tab" data-toggle="tab">Lingue</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab5" role="tab" data-toggle="tab">Servizi</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab6" role="tab" data-toggle="tab">Residenza</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab7" role="tab" data-toggle="tab">Orari</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab8" role="tab" data-toggle="tab">Tariffe</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab10" role="tab" data-toggle="tab">Contatti</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab11" role="tab" data-toggle="tab">Fotos</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab12" role="tab" data-toggle="tab">Video</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab13" role="tab" data-toggle="tab">Foto Nat.</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab14" role="tab" data-toggle="tab">Tour</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#tab15" role="tab" data-toggle="tab">Feedback</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="display: none; height: 300px; overflow: auto;">
                                    <div role="tabpanel" class="tab-pane fade show active" id="tab1">
                                        <div class="align-items-center pt-lg-5 ">
                                            <div class="row pl-lg-5 pb-3 ">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Name: </h4>
                                                    <h4 runat="server" id="ModelName" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Slogan: </h4>
                                                    <h4 runat="server" id="ModelSlogan" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Age: </h4>
                                                    <h4 runat="server" id="ModelAge" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Sex: </h4>
                                                    <h4 runat="server" id="ModelSex" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Ethnicity: </h4>
                                                    <h4 runat="server" id="ModelEthnicity" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Nationality: </h4>
                                                    <h4 runat="server" id="ModelNationality" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Residence: </h4>
                                                    <h4 runat="server" id="ModelResidence" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Hair Color: </h4>
                                                    <h4 runat="server" id="ModelHairColor" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Hair Length: </h4>
                                                    <h4 runat="server" id="ModelHairLength" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Eye: </h4>
                                                    <h4 runat="server" id="ModelEye" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Height: </h4>
                                                    <h4 runat="server" id="ModelHeight" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Weight: </h4>
                                                    <h4 runat="server" id="ModelWeight" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Dress Size: </h4>
                                                    <h4 runat="server" id="ModelDress" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Shoes: </h4>
                                                    <h4 runat="server" id="ModelShoes" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Bust: </h4>
                                                    <h4 runat="server" id="ModelBust" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Waist: </h4>
                                                    <h4 runat="server" id="ModelWaist" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Haunch: </h4>
                                                    <h4 runat="server" id="ModelHaunch" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Breast Size: </h4>
                                                    <h4 runat="server" id="ModelBreast" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Smoker: </h4>
                                                    <h4 runat="server" id="ModelSmoker" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Tattoos: </h4>
                                                    <h4 runat="server" id="ModelTattoos" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Drinker: </h4>
                                                    <h4 runat="server" id="ModelDrinker" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Piercing: </h4>
                                                    <h4 runat="server" id="ModelPiercing" class="d-inline"></h4>
                                                </div>
                                                <div class="col-8 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Peculiarities: </h4>
                                                    <h4 runat="server" id="ModelPeculiarities" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab2">
                                        <div class="pt-lg-5 ">
                                            <div class="row pl-lg-5 pb-3 ">
                                                <div class="col-12 pb-2 pl-0">
                                                    <h4 runat="server" id="ModelAbout" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab4">
                                        <div class="d-flex pt-lg-5 ">
                                            <asp:Repeater ID="LanguageRepeater" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive ">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Language</th>
                                                                    <th>Level</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Language")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Level")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab5">
                                        <div class="d-flex pt-lg-5 ">
                                            <asp:Repeater ID="RepeaterModServices" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive ">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Group Name</th>
                                                                    <th>Service</th>
                                                                    <th>Amount (/h)</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Group")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Service")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Amount")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab6">
                                        <div class="d-flex pt-lg-5 flex-column ">
                                            <h4 class="mb-3">Work Cities: </h4>
                                            <asp:Repeater ID="RepeaterModWorkCity" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Work City</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("WorkCity")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <h4 class="mb-3">Incall Places: </h4>
                                            <asp:Repeater ID="RepeaterModIncall" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Incall Place</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("IncallPlace")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <h4 class="mb-3">Outcall Places: </h4>
                                            <asp:Repeater ID="RepeaterModOutcall" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Outcall Place</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("OutcallPlace")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab7">
                                        <div class="d-flex pt-lg-5 ">
                                            <asp:Repeater ID="RepeaterModWorkHour" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive ">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Work Day</th>
                                                                    <th>Work Start Time</th>
                                                                    <th>Work End Time</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("WorkDay")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("WorkSHour")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("WorkEHour")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab8">
                                        <div class="d-flex pt-lg-5 flex-column ">
                                            <h4 class="mb-3">Incall Rates: </h4>
                                            <asp:Repeater ID="RepeaterModIncallRate" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Incall Place</th>
                                                                    <th>Duration</th>
                                                                    <th>Rate</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("IncallPlace")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Duration")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Rate")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <h4 class="mb-3">Outcall Rates: </h4>
                                            <asp:Repeater ID="RepeaterModOutcallRate" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Outcall Place</th>
                                                                    <th>Duration</th>
                                                                    <th>Rate</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("OutcallPlace")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Duration")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("Rate")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab10">
                                        <div class="pt-lg-5">
                                            <div class="row pl-lg-5 pb-3 ">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Social Chat: </h4>
                                                    <h4 runat="server" id="ModelSocialChat" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Instruction Chat: </h4>
                                                    <h4 runat="server" id="ModelInstructionChat" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3 purchasedDiv">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Email: </h4>
                                                    <h4 runat="server" id="ModelEmail" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Mobile Phone: </h4>
                                                    <h4 runat="server" id="ModelPhone" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3 purchasedDiv">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Address: </h4>
                                                    <h4 runat="server" id="ModelAddress" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline text-primary">Address Civ: </h4>
                                                    <h4 runat="server" id="ModelAddressCiv" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab11">
                                        <div class="d-flex pt-lg-5 ">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterPhotos" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 130px; width: 130px;">
                                                                <div class="image-zone photo-div" data-id="<%# Eval("Id") %>">
                                                                    <img src="<%#"/Upload/Photos/" + Eval("Image")%>" />
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </div>
                                                       
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab12">
                                        <div class="d-flex pt-lg-5 ">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterVideo" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 155px; width: 155px;">
                                                                <div class="image-zone">
                                                                    <video style="width: 130px; height: 130px;" controls>
                                                                        <source src="<%#"/Upload/Videos/" + Eval("Video")%>" type="video/mp4">
                                                                        <source src="<%#"/Upload/Videos/" + Eval("Video")%>" type="video/ogg">
                                                                    </video>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </div>
                                                           
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab13">
                                        <div class="d-flex pt-lg-5 ">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterNautralPhoto" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 130px; width: 130px;">
                                                                <div class="image-zone">
                                                                    <img src="<%#"/Upload/NaturalPhotos/" + Eval("Image")%>" />
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </div>
                                                       
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab14">
                                        <div class="d-flex pt-lg-5 ">
                                            <asp:Repeater ID="RepeaterTour" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive ">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>City</th>
                                                                    <th>From</th>
                                                                    <th>To</th>
                                                                    <th class="purchasedDiv">Phone</th>
                                                                    <th class="purchasedDiv">Email</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("City")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("From")%></td>
                                                        <td style="border-bottom: 1px solid #dee2e6"><%# Eval("To")%></td>
                                                        <td class="purchasedDiv" style="border-bottom: 1px solid #dee2e6"><%# Eval("Phone")%></td>
                                                        <td class="purchasedDiv" style="border-bottom: 1px solid #dee2e6"><%# Eval("Email")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                            </table>
                                                            </div>
                                               
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade show" id="tab15">
                                        <div class="pt-3">
                                            <div class="text-right pb-2">
                                                <button class="btn btn-white bg-white" id="BtnAddReview">+ ADD REVIEW</button>
                                            </div>
                                            <asp:Repeater ID="RepeaterReview" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive ">
                                                        <table class="table table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <%--<th>No</th>--%>
                                                                    <th>Content</th>
                                                                    <th>Date</th>
                                                                    <th>User</th>
                                                                    <th class="d-none"></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="ReviewBody">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <%--<td style="vertical-align: middle"><%# (Container.ItemIndex + 1).ToString() %></td>--%>
                                                        <td style="vertical-align: middle; border-bottom: 1px solid #dee2e6">
                                                            <%# Eval("Content") %>
                                                            <div class="text-white">
                                                                <%# Eval("Comment")%>
                                                            </div>
                                                        </td>
                                                        <td style="vertical-align: middle; border-bottom: 1px solid #dee2e6"><%# Eval("ReviewDate")%></td>
                                                        <td style="vertical-align: middle; border-bottom: 1px solid #dee2e6"><%# Eval("User")%></td>
                                                        <td class="d-none"><%# Eval("UserId") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-container gallery-thumbs" style="width: 100%; float: left">
                            <div class="swiper-wrapper">
                                <asp:Repeater runat="server" ID="DefaultPhotoRepeater2">
                                    <ItemTemplate>
                                        <div class="swiper-slide img-thumb" id="<%# Eval("Id") %>" data-index="<%# Container.ItemIndex %>"
                                            style="background-image: url(&quot;Upload/Photos/<%#Eval("Image") %>&quot; );">
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div style="width: 120px; margin-top:130px; margin-left: 3%;" class="mb-3 text-center position-absolute d-block">
                                    <div class="swiper-button-next swiper-button-white text-white float-end" style="margin-top:5px !important"></div>
                                    <button id="BtnSwaperPause" class="btn btn-lg bg-gradient text-white">
                                        <i class="fa fa-pause"></i>
                                    </button>
                                    <div class="swiper-button-prev swiper-button-white text-white float-start" style="margin-top:5px !important;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header pl-5">
                                    <h2 class="modal-title">ADD REVIEW</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:HiddenField ID="HfRating" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="HfUserID" runat="server" ClientIDMode="Static" />
                                    <asp:ScriptManager runat="server" ID="ScriptManagerForModal"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForModal">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-right text-danger" ClientIDMode="Static" />
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Save Failed" Display="None"></asp:CustomValidator>
                                            <div class="container">
                                                <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                                                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star" style="font-size:25px;"></label>
                                                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star" style="font-size:25px;"></label>
                                                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star" style="font-size:25px;"></label>
                                                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star" style="font-size:25px;"></label>
                                                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star" style="font-size:25px;"></label>
                                                </div>
                                            </div>
                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtPhone" ClientIDMode="Static" placeholder="Phone Number" CssClass="form-control form-control-lg"></asp:TextBox>
                                            </div>

                                            <div class="form-white">
                                                <asp:TextBox runat="server" ID="TxtComment" ClientIDMode="Static" placeholder="Comment" CssClass="form-control form-control-lg" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSaveReview" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer p-lg-5">
                                    <asp:Button runat="server" ID="BtnSaveReview" ClientIDMode="Static" CssClass="btn btn-lg btn-success" Text="OK" OnClientClick="SaveReview()" OnClick="BtnSaveReview_Click" />
                                    <asp:Button runat="server" ID="BtnClose" ClientIDMode="Static" Text="Cancel" CssClass="btn btn-lg btn-dark"/>
                                </div>
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
    <script src="Scripts/scroll-tab.js"></script>
    <script>
        $("#BtnClose").click(function () {
            $("#myModal").modal('hide');
            return false;
        });

        $("#BtnAddReview").click(function () {
            var reviews = $(".ReviewBody>tr>td");
            var userID = $("#HfUserID").val();
            for (var i = 0; i < reviews.length; i++) {
                if (reviews[i].textContent == userID) {
                    alert("You already left a review.");
                    return false;
                }
            }
            $("#TxtPhone").val("");
            $("#TxtComment").val("");
            $("input[name='rating'][value='1']")[0].checked = true;
            $("#myModal").modal('show');
            return false;
        });

        function SaveReview() {
            $("#HfRating").val($("input[name='rating']:checked").val());
            return true;
        };

        function SetVisible() {
            if ($("#HfPurchased").val() != "True") {
                $(".purchasedDiv").addClass('d-none');
            }
        };
        SetVisible();
    </script>
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

        $(document).on('click', '.photo-div', function (event) {
            var photoID = $(this)[0].dataset.id;
            var element = $("#" + photoID);
            var index = element[0].dataset.index;
            galleryTop.slideTo(index);
        });
    </script>
</asp:Content>
