<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserHomeDetail.aspx.cs" Inherits="TALENTS.UserHomeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/swiper-bundle.min.css">
    <link rel="stylesheet" href="Content/CSS/custom-user-model-details.css">
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
            height: 80%;
            width: 65%;
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
    <style>
        .preview-images-zone {
    width: 100%;
    border: 1px solid #ddd;
    min-height: 180px;
    /* display: flex; */
    padding: 5px 5px 0px 5px;
    position: relative;
    overflow:auto;
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
    cursor: move;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: gray;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="row">
                        <div class="col-6">
                            <div class="site-wrap" style="position: relative; height: 1100px;">
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
                                <div class="p-4 pl-2 pr-2 rounded rounded-5 text-white" style="width: 120px; position: absolute; bottom: 20%; right: 30px; text-align: center;">
                                    <div class="swiper-button-next swiper-button-white text-white"></div>
                                    <button id="BtnSwaperPause" class="btn btn-lg bg-gradient text-white">
                                        <i class="fa fa-play"></i>
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
                        </div>
                        <div class="col-6 p-lg-5">
                            <div class="row pr-5 pt-5">
                                <div class="col-xs-12">
                                    <nav>
                                        <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-bio-tab" data-toggle="tab" href="#nav-bio" role="tab" aria-controls="nav-bio" aria-selected="true">Biography</a>
                                            <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">About Me</a>
                                            <a class="nav-item nav-link" id="nav-language-tab" data-toggle="tab" href="#nav-language" role="tab" aria-controls="nav-language" aria-selected="false">Language</a>
                                            <a class="nav-item nav-link" id="nav-service-tab" data-toggle="tab" href="#nav-service" role="tab" aria-controls="nav-service" aria-selected="false">Service</a>
                                            <a class="nav-item nav-link" id="nav-workcity-tab" data-toggle="tab" href="#nav-workcity" role="tab" aria-controls="nav-workcity" aria-selected="false">Work City</a>
                                            <a class="nav-item nav-link" id="nav-workhours-tab" data-toggle="tab" href="#nav-workhours" role="tab" aria-controls="nav-workhours" aria-selected="false">Work Hours</a>
                                            <a class="nav-item nav-link" id="nav-rates-tab" data-toggle="tab" href="#nav-rates" role="tab" aria-controls="nav-rates" aria-selected="false">Rates</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a>
                                            <a class="nav-item nav-link" id="nav-photo-tab" data-toggle="tab" href="#nav-photo" role="tab" aria-controls="nav-photo" aria-selected="false">Photos</a>
                                            <a class="nav-item nav-link" id="nav-video-tab" data-toggle="tab" href="#nav-video" role="tab" aria-controls="nav-video" aria-selected="false">Videos</a>
                                            <a class="nav-item nav-link" id="nav-naturalphoto-tab" data-toggle="tab" href="#nav-naturalphoto" role="tab" aria-controls="nav-naturalphoto" aria-selected="false">Natural Photos</a>
                                            <a class="nav-item nav-link" id="nav-tour-tab" data-toggle="tab" href="#nav-tour" role="tab" aria-controls="nav-tour" aria-selected="false">Tour</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                        <div class="tab-pane fade show active p-lg-4" id="nav-bio" role="tabpanel" aria-labelledby="nav-bio-tab">
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Name: </h4>
                                                    <h4 runat="server" id="ModelName" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Slogan: </h4>
                                                    <h4 runat="server" id="ModelSlogan" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Age: </h4>
                                                    <h4 runat="server" id="ModelAge" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Sex: </h4>
                                                    <h4 runat="server" id="ModelSex" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Ethnicity: </h4>
                                                    <h4 runat="server" id="ModelEthnicity" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Nationality: </h4>
                                                    <h4 runat="server" id="ModelNationality" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Residence: </h4>
                                                    <h4 runat="server" id="ModelResidence" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Hair Color: </h4>
                                                    <h4 runat="server" id="ModelHairColor" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Hair Length: </h4>
                                                    <h4 runat="server" id="ModelHairLength" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Eye: </h4>
                                                    <h4 runat="server" id="ModelEye" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Height: </h4>
                                                    <h4 runat="server" id="ModelHeight" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Weight: </h4>
                                                    <h4 runat="server" id="ModelWeight" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Dress Size: </h4>
                                                    <h4 runat="server" id="ModelDress" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Shoes: </h4>
                                                    <h4 runat="server" id="ModelShoes" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Bust: </h4>
                                                    <h4 runat="server" id="ModelBust" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Waist: </h4>
                                                    <h4 runat="server" id="ModelWaist" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Haunch: </h4>
                                                    <h4 runat="server" id="ModelHaunch" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Breast Size: </h4>
                                                    <h4 runat="server" id="ModelBreast" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Smoker: </h4>
                                                    <h4 runat="server" id="ModelSmoker" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Tattoos: </h4>
                                                    <h4 runat="server" id="ModelTattoos" class="d-inline"></h4>
                                                </div>
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Drinker: </h4>
                                                    <h4 runat="server" id="ModelDrinker" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-4 pb-2 pl-0">
                                                    <h4 class="d-inline">Piercing: </h4>
                                                    <h4 runat="server" id="ModelPiercing" class="d-inline"></h4>
                                                </div>
                                                <div class="col-8 pb-2 pl-0">
                                                    <h4 class="d-inline">Peculiarities: </h4>
                                                    <h4 runat="server" id="ModelPeculiarities" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-12 pb-2 pl-0">
                                                    <h4 runat="server" id="ModelAbout" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-language" role="tabpanel" aria-labelledby="nav-language-tab">
                                            <asp:Repeater ID="LanguageRepeater" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Language</th>
                                                                    <th>Level</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("Language")%></td>
                                                        <td><%# Eval("Level")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-service" role="tabpanel" aria-labelledby="nav-service-tab">
                                            <asp:Repeater ID="RepeaterModServices" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Group Name</th>
                                                                    <th>Service</th>
                                                                    <th>Amount (/h)</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("Group")%></td>
                                                        <td><%# Eval("Service")%></td>
                                                        <td><%# Eval("Amount")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-workcity" role="tabpanel" aria-labelledby="nav-workcity-tab">
                                            <h4 class="mb-3">Work Cities: </h4>
                                            <asp:Repeater ID="RepeaterModWorkCity" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Work City</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("WorkCity")%></td>
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
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Incall Place</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("IncallPlace")%></td>
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
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Outcall Place</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("OutcallPlace")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-workhours" role="tabpanel" aria-labelledby="nav-workhours-tab">
                                            <asp:Repeater ID="RepeaterModWorkHour" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Work Day</th>
                                                                    <th>Work Start Time</th>
                                                                    <th>Work End Time</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("WorkDay")%></td>
                                                        <td><%# Eval("WorkSHour")%></td>
                                                        <td><%# Eval("WorkEHour")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-rates" role="tabpanel" aria-labelledby="nav-rates-tab">
                                            <h4 class="mb-3">Incall Rates: </h4>
                                            <asp:Repeater ID="RepeaterModIncallRate" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Incall Place</th>
                                                                    <th>Duration</th>
                                                                    <th>Rate</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("IncallPlace")%></td>
                                                        <td><%# Eval("Duration")%></td>
                                                        <td><%# Eval("Rate")%></td>
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
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Outcall Place</th>
                                                                    <th>Duration</th>
                                                                    <th>Rate</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("OutcallPlace")%></td>
                                                        <td><%# Eval("Duration")%></td>
                                                        <td><%# Eval("Rate")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                                    </table>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Social Chat: </h4>
                                                    <h4 runat="server" id="ModelSocialChat" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Instruction Chat: </h4>
                                                    <h4 runat="server" id="ModelInstructionChat" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Email: </h4>
                                                    <h4 runat="server" id="ModelEmail" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Mobile Phone: </h4>
                                                    <h4 runat="server" id="ModelPhone" class="d-inline"></h4>
                                                </div>
                                            </div>
                                            <div class="row pl-lg-5 pb-3">
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Address: </h4>
                                                    <h4 runat="server" id="ModelAddress" class="d-inline"></h4>
                                                </div>
                                                <div class="col-6 pb-2 pl-0">
                                                    <h4 class="d-inline">Address Civ: </h4>
                                                    <h4 runat="server" id="ModelAddressCiv" class="d-inline"></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade p-lg-4" id="nav-photo" role="tabpanel" aria-labelledby="nav-photo-tab">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterPhotos" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 155px; width: 155px;">
                                                                <div class="image-zone">
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
                                        <div class="tab-pane fade p-lg-4" id="nav-video" role="tabpanel" aria-labelledby="nav-video-tab">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterVideo" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 155px; width: 155px;">
                                                                <div class="image-zone">
                                                                    <video style="width: 155px; height: 155px;" controls>
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
                                        <div class="tab-pane fade p-lg-4" id="nav-naturalphoto" role="tabpanel" aria-labelledby="nav-naturalphoto-tab">
                                            <div class="card-body">
                                                <div class="container">
                                                    <asp:Repeater ID="RepeaterNautralPhoto" runat="server" ClientIDMode="Static">
                                                        <HeaderTemplate>
                                                            <div class="preview-images-zone">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="preview-image" style="height: 155px; width: 155px;">
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
                                        <div class="tab-pane fade p-lg-4" id="nav-tour" role="tabpanel" aria-labelledby="nav-tour-tab">
                                            <asp:Repeater ID="RepeaterTour" runat="server" ClientIDMode="Static">
                                                <HeaderTemplate>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>City</th>
                                                                    <th>From</th>
                                                                    <th>To</th>
                                                                    <th>Phone</th>
                                                                    <th>Email</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                        <td><%# Eval("City")%></td>
                                                        <td><%# Eval("From")%></td>
                                                        <td><%# Eval("To")%></td>
                                                        <td><%# Eval("Phone")%></td>
                                                        <td><%# Eval("Email")%></td>
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
        galleryTop.autoplay.stop();
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
