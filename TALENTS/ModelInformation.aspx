<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelInformation.aspx.cs" Inherits="TALENTS.ModelInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/core.min.css" type="text/css">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <link rel="stylesheet" href="Content/CSS/gijgo.min.css" />
    <style>
        .nav-link.active {
            background-color: white !important;
            color: black !important;
            font-size: 24px !important;
        }

        .nav-link.active>span {
            color: black !important;
        }

        h2 {
            font-size: 28px;
            margin: 0px;
        }

        .main-menu ul {
            margin: 0px;
        }

        #v-pills-tab a {
            background-color: gray;
            font-size: 20px;
        }

        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
        }

        .textField {
            box-shadow: none !important;
            border: none;
            text-align: center;
        }

        .btn.btn-outline-secondary.border-left-0 {
            border:none;
        }

        #select2-ComboCity-container {
            text-align: center
        }

        .custom-control-input:checked~.custom-control-label::before {
            border-color: #14a44d;
            background-color: #14a44d;
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
    <style>
        .left-menu {
            width: 0px;
        }
        .left-menu-item {
            width: 0px;
            padding-left: 0px !important;
            padding-right: 0px !important;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfSignedModelID" runat="server" ClientIDMode="Static" />
                    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
                    <div class="row" style="background-color: gray">
                        <div class="col-3 p-lg-5 menu" style="background-color: rgb(0,0,0,.5); padding-left: 80px;">
                            <div class="text-right me-2">
                                <a href="#" id="hideMenu" class="ms-auto"><i class="fa fa-bars text-white" style="font-size:22px;"></i></a>
                            </div>
                            <h2 runat="server" id="ModelName" clientIDMode="static" class="text-white text-center pb-5">Model Information</h2>
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active text-white" id="v-pills-bio-tab" data-toggle="pill" href="#v-pills-bio" role="tab" aria-controls="v-pills-home" aria-selected="true"><i class ="fa fa-book"></i><span class="ps-2 menu-subitem">Biografia</span></a>
                                <a class="nav-link text-white" id="v-pills-about-tab" data-toggle="pill" href="#v-pills-about" role="tab" aria-controls="v-pills-profile" aria-selected="false"><i class ="fa fa-user"></i><span class="ps-2 menu-subitem">About Me</span></a>
                                <a class="nav-link text-white" id="v-pills-language-tab" data-toggle="pill" href="#v-pills-language" role="tab" aria-controls="v-pills-messages" aria-selected="false"><i class ="fa fa-language"></i><span class="ps-2 menu-subitem">Language</span></a>
                                <a class="nav-link text-white" id="v-pills-service-tab" data-toggle="pill" href="#v-pills-service" role="tab" aria-controls="v-pills-messages" aria-selected="false"><i class ="fa fa-server"></i><span class="ps-2 menu-subitem">Services</span></a>
                                <a class="nav-link text-white" id="v-pills-workcity-tab" data-toggle="pill" href="#v-pills-workcity" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-user"></i><span class="ps-2 menu-subitem">City of Work</span></a>
                                <a class="nav-link text-white" id="v-pills-workhours-tab" data-toggle="pill" href="#v-pills-workhours" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-hourglass"></i><span class="ps-2 menu-subitem">Work Hours</span></a>
                                <a class="nav-link text-white" id="v-pills-rates-tab" data-toggle="pill" href="#v-pills-rates" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-money"></i><span class="ps-2 menu-subitem">Rates</span></a>
                                <a class="nav-link text-white" id="v-pills-contact-tab" data-toggle="pill" href="#v-pills-contact" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-user"></i><span class="ps-2 menu-subitem">Contacts</span></a>
                                <a class="nav-link text-white" id="v-pills-photo-tab" data-toggle="pill" href="#v-pills-photo" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-photo"></i><span class="ps-2 menu-subitem">Photo Gallery</span></a>
                                <a class="nav-link text-white" id="v-pills-videos-tab" data-toggle="pill" href="#v-pills-videos" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-video-camera"></i><span class="ps-2 menu-subitem">Videos</span></a>
                                <a class="nav-link text-white" id="v-pills-naturalphoto-tab" data-toggle="pill" href="#v-pills-naturalphoto" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-photo"></i><span class="ps-2 menu-subitem">Natuarl Photo</span></a>
                                <a class="nav-link text-white" id="v-pills-tour-tab" data-toggle="pill" href="#v-pills-tour" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-train"></i><span class="ps-2 menu-subitem">Tours</span></a>
                                <a class="nav-link text-white" id="v-pills-setting-tab" data-toggle="pill" href="#v-pills-setting" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i class ="fa fa-search"></i><span class="ps-2 menu-subitem">Setting</span></a>
                            </div>
                        </div>
                        <div class="col-9 bg-gray text-center mx-auto">
                            <div class="tab-content d-flex justify-content-center" id="v-pills-tabContent">
                                <div class="tab-pane fade show active bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-bio" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div class="row">
                                        <h2 class="mb-4 text-left col-6">BIOGRAPHY</h2>
                                        <p class="text-success col-6 text-right" runat="server" id="SuccessAlarm" clientIDMode="static" visible="false">Save Biography Successed.</p>
                                    </div>
                                    <hr class="text-primary mb-4" />
                                    <div class="row m-xs">
                                        <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                        <%--<asp:RequiredFieldValidator ID="ReqValName" runat="server" ErrorMessage="Please insert Name" ControlToValidate="TxtName" Display="None" Enabled="True"></asp:RequiredFieldValidator>--%>
                                        <asp:CustomValidator ID="ServerValidatorBio1" runat="server" ErrorMessage="Please insert Name." Display="None"></asp:CustomValidator>
                                        <asp:CustomValidator ID="ServerValidatorBio2" runat="server" ErrorMessage="Save Biography is failed." Display="None"></asp:CustomValidator>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtName">Name</label>
                                                    <asp:TextBox runat="server" ID="TxtName" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtName" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtName">Name <span class="text-danger">*</span></label>
                                            </div>--%>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtSlogan">Slogan</label>
                                                    <asp:TextBox runat="server" ID="TxtSlogan" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtSlogan" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtSlogan">Slogan</label>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtAge">Age</label>
                                                    <asp:TextBox runat="server" ID="TxtAge" CssClass="form-control textField" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtAge" CssClass="form-control form-control-lg" TextMode="Number"></asp:TextBox>
                                                <label class="form-label" for="TxtAge">Age</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboSex">Sex</label>
                                                    <asp:DropDownList runat="server" ID="ComboSex" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboEth">Ethnicity</label>
                                                    <asp:DropDownList runat="server" ID="ComboEth" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboNation">Nationality</label>
                                                    <asp:DropDownList runat="server" ID="ComboNation" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboRes">Residence</label>
                                                    <asp:DropDownList runat="server" ID="ComboRes" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row text-left">
                                        <h5 class="text-primary text-bold text-left">Caratteristiche Fisiche</h5>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboHairColor">Colore_Capelli</label>
                                                    <asp:DropDownList runat="server" ID="ComboHairColor" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboHairLeng">Lunghezza_Capelli</label>
                                                    <asp:DropDownList runat="server" ID="ComboHairLeng" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboEye">Colore_Occhi</label>
                                                    <asp:DropDownList runat="server" ID="ComboEye" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtHeight">Altezza</label>
                                                    <asp:TextBox runat="server" ID="TxtHeight" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtHeight" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtHeight">Altezza</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtWeight">Peso</label>
                                                    <asp:TextBox runat="server" ID="TxtWeight" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtWeight" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtWeight">Peso</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboDress">Taglia_Vestito</label>
                                                    <asp:DropDownList runat="server" ID="ComboDress" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtShoes">Scarpe</label>
                                                    <asp:TextBox runat="server" ID="TxtShoes" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtShoes" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtShoes">Scarpe</label>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtBust">Busto</label>
                                                    <asp:TextBox runat="server" ID="TxtBust" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtBust" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtBust">Busto</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtWaist">Vita</label>
                                                    <asp:TextBox runat="server" ID="TxtWaist" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtWaist" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtWaist">Vita</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtHaunch">Fianchi</label>
                                                    <asp:TextBox runat="server" ID="TxtHaunch" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtHaunch" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtHaunch">Fianchi</label>
                                            </div>--%>
                                        </div>
                                        <div class="col-3">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboBreast">Seno</label>
                                                    <asp:DropDownList runat="server" ID="ComboBreast" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row text-left">
                                        <h5 class="text-primary text-bold text-left">Informazioni Aggiuntive</h5>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboSmoker">Fumatrice</label>
                                                    <asp:DropDownList runat="server" ID="ComboSmoker" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboDrink">Bevitrice</label>
                                                    <asp:DropDownList runat="server" ID="ComboDrink" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboTattoos">Tatuaggi</label>
                                                    <asp:DropDownList runat="server" ID="ComboTattoos" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="ComboPiercing">Piercing</label>
                                                    <asp:DropDownList runat="server" ID="ComboPiercing" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-12">
                                            <div class="mb-4">
                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                    <label class="form-label" for="TxtPeculiarities">Particolarita</label>
                                                    <asp:TextBox runat="server" ID="TxtPeculiarities" CssClass="form-control textField"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtPeculiarities" CssClass="form-control form-control-lg" TextMode="MultiLine"></asp:TextBox>
                                                <label class="form-label" for="TxtPeculiarities">Particolarita</label>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <asp:Button runat="server" ID="BtnBio" Text="SAVE BIOGRAPHY" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnBio_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;"  id="v-pills-about" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelAbout" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">ABOUT ME</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmAbout" clientIDMode="static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <%--<asp:RequiredFieldValidator ID="ReqValName" runat="server" ErrorMessage="Please insert Name" ControlToValidate="TxtName" Display="None" Enabled="True"></asp:RequiredFieldValidator>--%>
                                                <asp:CustomValidator ID="ServerValidatorAbout1" runat="server" ErrorMessage="Please insert About Me." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorAbout2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-12">
                                                    <div class="mb-5">
                                                        <div class="wrapper">
                                                            <h5 class="text-primary text-bold text-left">About Me<span class="text-danger">*</span></h5>
                                                            <textarea runat="server" id="TxtItaly" style="width: 100%;padding: 10px;min-height: 350px;" clientIDMode="static" maxlength="1000" placeholder="Start Typin..." autofocus></textarea>
                                                            <div id="the-ital-count" class="float-end">
                                                                <span id="italCurrent">0</span>
                                                                <span id="italMaximum">/ 1000</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnAbout" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <asp:Button runat="server" ID="BtnAbout" Text="SAVE ABOUT ME" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnAbout_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-language" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelLang" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">LANGUAGE</h2>
                                                <p class="text-success col-6 text-right" runat="server" ClientIDMode="Static" id="SuccessAlarmLang" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorLang1" runat="server" ErrorMessage="Please select Language and Level." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorLang2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-5">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboLang">Language</label>
                                                            <asp:DropDownList runat="server" ID="ComboLang" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-5">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboLevel">Level</label>
                                                            <asp:DropDownList runat="server" ID="ComboLevel" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <asp:Button runat="server" ID="BtnLang" Text="+ Add" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnLang_Click"/>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <asp:Repeater ID="LanguageRepeater" runat="server" ClientIDMode="Static" OnItemCreated="LanguageRepeater_ItemCreated">
                                                    <HeaderTemplate>
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th>Language</th>
                                                                        <th>Level</th>
                                                                        <th>Azioni</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                            <td><%# Eval("Language")%></td>
                                                            <td><%# Eval("Level")%></td>
                                                            <td>
                                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash" style="font-size:25px"></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="LanguageRepeater" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-service" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelService" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">SERVICES</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmService" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary3" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="servervalidatorService1" runat="server" ErrorMessage="Please select Service." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="servervalidatorService2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-4">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboServiceGroup">Groups</label>
                                                            <asp:DropDownList runat="server" ID="ComboServiceGroup" ClientIDMode="Static" CssClass="custom-select" style="width:100%" AutoPostBack="true" 
                                                                OnSelectedIndexChanged="ComboServiceGroup_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboService">Services</label>
                                                            <asp:DropDownList runat="server" ID="ComboService" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtServiceAmount">Amount</label>
                                                            <asp:TextBox runat="server" ID="TxtServiceAmount" CssClass="form-control textField p-0"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <asp:Button runat="server" ID="BtnService" Text="+ Add" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnService_Click"/>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <asp:Repeater ID="RepeaterModServices" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModServices_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th>Group Name</th>
                                                                        <th>Service</th>
                                                                        <th>Amount (/h)</th>
                                                                        <th>Azioni</th>
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
                                                            <td>
                                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash style="font-size:25px""></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModServices" />
                                            <asp:AsyncPostBackTrigger ControlID="ComboServiceGroup" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-workcity" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelWorkCity" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">WORK CITIES</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmWorkCity" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary4" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorWorkCity1" runat="server" ErrorMessage="Please select Work City." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorWorkCity3" runat="server" ErrorMessage="Please select Incall Place." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorWorkCity4" runat="server" ErrorMessage="Please select Outcall Place." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorWorkCity2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Work Cities</h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-8">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboWorkCity">Work_City</label>
                                                            <asp:DropDownList runat="server" ID="ComboWorkCity" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <asp:Button runat="server" ID="BtnWorkCity" Text="+ Add Work City" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnWorkCity_Click"/>
                                                </div>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <asp:Repeater ID="RepeaterModWorkCity" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModWorkCity_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th>Work City</th>
                                                                        <th>Azioni</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                            <td><%# Eval("WorkCity")%></td>
                                                            <td>
                                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash style="font-size:25px""></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Incall/Outcall Places</h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6" style="border-right: 1px solid lightblue;">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <div class="mb-4">
                                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                                    <label class="form-label" for="ComboIncall">Incall</label>
                                                                    <asp:DropDownList runat="server" ID="ComboIncall" ClientIDMode="Static" CssClass="custom-select" Style="width: 100%"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <asp:Button runat="server" ID="BtnIncall" Text="+ Incall" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnIncall_Click"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Repeater ID="RepeaterModIncall" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModIncall_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <div class="table-responsive">
                                                                    <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                        <thead class="thead-dark">
                                                                            <tr>
                                                                                <th>No</th>
                                                                                <th>Incall Place</th>
                                                                                <th>Azioni</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                                    <td><%# Eval("IncallPlace")%></td>
                                                                    <td>
                                                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                            CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                            <i class="fa fa-trash style="font-size:25px""></i>
                                                                        </asp:LinkButton>
                                                                    </td>
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
                                                <div class="col-6">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <div class="mb-4">
                                                                <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                                    <label class="form-label" for="ComboOutcall">Outcall</label>
                                                                    <asp:DropDownList runat="server" ID="ComboOutcall" ClientIDMode="Static" CssClass="custom-select" Style="width: 100%"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <asp:Button runat="server" ID="BtnOutcall" Text="+ Outcall" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnOutcall_Click" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Repeater ID="RepeaterModOutcall" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModOutcall_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <div class="table-responsive">
                                                                    <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                        <thead class="thead-dark">
                                                                            <tr>
                                                                                <th>No</th>
                                                                                <th>Outcall Place</th>
                                                                                <th>Azioni</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><%# (Container.ItemIndex + 1).ToString() %></td>
                                                                    <td><%# Eval("OutcallPlace")%></td>
                                                                    <td>
                                                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                            CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                            <i class="fa fa-trash style="font-size:25px""></i>
                                                                        </asp:LinkButton>
                                                                    </td>
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
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModWorkCity" />
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModIncall" />
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModOutcall" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnOutcall" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnIncall" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-workhours" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelWorkDayHours" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">WORKING HOURS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmWorkHours" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary5" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorWorkHours1" runat="server" ErrorMessage="Please select Work Day and Hours." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorWorkHours2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-4">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboWorkDay">Work_Day</label>
                                                            <asp:DropDownList runat="server" ID="ComboWorkDay" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboSHour">Start_Time</label>
                                                            <asp:DropDownList runat="server" ID="ComboSHour" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboEHour">End_Time</label>
                                                            <asp:DropDownList runat="server" ID="ComboEHour" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <asp:Button runat="server" ID="BtnWorkHour" Text="+ Add" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnWorkHour_Click"/>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <asp:Repeater ID="RepeaterModWorkHour" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModWorkHour_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th>Work Day</th>
                                                                        <th>Work Start Time</th>
                                                                        <th>Work End Time</th>
                                                                        <th>Azioni</th>
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
                                                            <td>
                                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash style="font-size:25px""></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModWorkHour" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-rates" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelRates" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">RATES</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmRate" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary6" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorRate1" runat="server" ErrorMessage="Please select Incall Rate." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorRate2" runat="server" ErrorMessage="Please select Outcall Rate." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorRate3" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-5">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboModIncallPlace">Incall_Place</label>
                                                            <asp:DropDownList runat="server" ID="ComboModIncallPlace" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboDuration">Duration</label>
                                                            <asp:DropDownList runat="server" ID="ComboDuration" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtIncallRate">Rate</label>
                                                            <asp:TextBox runat="server" ID="TxtIncallRate" CssClass="form-control textField p-0"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <asp:Button runat="server" ID="BtnIncallRate" Text="+ Add" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnIncallRate_Click"/>
                                                </div>
                                            </div>
                                            <div class="row mt-3" style="width: 800px;">
                                                <div class="col-5">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboModOutcallPlace">Outcall_Place</label>
                                                            <asp:DropDownList runat="server" ID="ComboModOutcallPlace" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboDuration1">Duration</label>
                                                            <asp:DropDownList runat="server" ID="ComboDuration1" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtOutcallRate">Rate</label>
                                                            <asp:TextBox runat="server" ID="TxtOutcallRate" CssClass="form-control textField p-0"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <asp:Button runat="server" ID="BtnOutcallRate" Text="+ Add" CssClass="btn btn-success btn-block btn-lg btn-rounded" OnClick="BtnOutcallRate_Click"/>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6" style="border-right: 1px solid lightblue;">
                                                    <asp:Repeater ID="RepeaterModIncallRate" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModIncallRate_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                    <thead class="thead-dark">
                                                                        <tr>
                                                                            <th>No</th>
                                                                            <th>Incall Place</th>
                                                                            <th>Duration</th>
                                                                            <th>Rate</th>
                                                                            <th>Azioni</th>
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
                                                                <td>
                                                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                        CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash style="font-size:25px""></i>
                                                                </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                        </table>
                                                        </div>
                                                   
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Repeater ID="RepeaterModOutcallRate" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterModOutcallRate_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered table-striped text-center" style="font-size: 18px;">
                                                                    <thead class="thead-dark">
                                                                        <tr>
                                                                            <th>No</th>
                                                                            <th>Outcall Place</th>
                                                                            <th>Duration</th>
                                                                            <th>Rate</th>
                                                                            <th>Azioni</th>
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
                                                                <td>
                                                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                        CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash style="font-size:25px""></i>
                                                                </asp:LinkButton>
                                                                </td>
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
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModIncallRate" />
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModOutcallRate" />
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModOutcall" />
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterModIncall" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnOutcall" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnIncall" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-contact" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelContact" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">CONTACTS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmContact" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary7" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please select Language and Level." Display="None"></asp:CustomValidator>--%>
                                                <asp:CustomValidator ID="ServerValidatorContact" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboSocialChat">Social_Chat</label>
                                                            <asp:DropDownList runat="server" ID="ComboSocialChat" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboInstructionChat">Instruction_Chat</label>
                                                            <asp:DropDownList runat="server" ID="ComboInstructionChat" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtEmail">Email</label>
                                                            <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtMobilePhone">Mobile_Phone</label>
                                                            <asp:TextBox runat="server" ID="TxtMobilePhone" CssClass="form-control textField" TextMode="Phone"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtAddress">Address</label>
                                                            <asp:TextBox runat="server" ID="TxtAddress" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtAddressCiv">AddressCiv</label>
                                                            <asp:TextBox runat="server" ID="TxtAddressCiv" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <div class="col-12">
                                                    <asp:Button runat="server" ID="BtnContact" Text="SAVE CONTACT INFORMATION" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnContact_Click"/>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-photo" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <div class="row">
                                        <h2 class="mb-4 text-left col-6">PHOTO GALLERY</h2>
                                        <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmPhoto" ClientIDMode="Static" visible="false">Save Successed.</p>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <table class="table text-left" id="photo-table">
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-videos" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelVideos" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">VIDEOS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmVideo" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row" style="width: 800px;">
                                                <div class="card-body">
                                                    <div class="container">
                                                        <fieldset class="form-group text-center">
                                                            <%--<asp:Button runat="server" ID="BtnUploadVideo" CssClass="btn btn-success" Text="<i class='fa fa-upload'></i>Upload Video" OnClick="BtnUploadVideo_Click" OnClientClick="$('#FileUpload').click();"></asp:Button>--%>
                                                            <button id="BtnUploadVideo" class="btn btn-success"><i class='fa fa-upload'></i> Upload Video</button>
                                                            <%--<asp:FileUpload runat="server" ID="FileUpload" ClientIDMode="Static" CssClass="form-control" style="display: none;" />--%>
                                                            <input type="file" id="fileUpload" style="display: none;" class="form-control" multiple>
                                                            <asp:Button runat="server" ID="BtnReload" ClientIDMode="Static" style="display:none;" OnClick="BtnReload_Click" />
                                                        </fieldset>
                                                        <asp:Repeater ID="RepeaterVideo" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterVideo_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <div class="preview-images-zone">
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div class="preview-image" style="height:165px; width:165px;">
                                                                    <asp:LinkButton ID="DeleteButton" runat="server" CssClass="image-cancel" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                            CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                        <i class="fa fa-close" style="font-size:25px"></i>
                                                                    </asp:LinkButton>
                                                                    
                                                                    <div class="image-zone">
                                                                        <video style="width:165px; height:165px;" controls>
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
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterVideo" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-naturalphoto" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelNaturalPhoto" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <asp:Button runat="server" ID="BtnReloadNatural" style="display:none" OnClick="BtnReloadNatural_Click" />
                                                <h2 class="mb-4 text-left col-6">NATURAL PHOTOS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmNaturalPhoto" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row" style="width: 800px;">
                                                <div class="card-body">
                                                    <div class="container">
                                                        <fieldset class="form-group text-center">
                                                            <%--<asp:Button runat="server" ID="BtnUploadVideo" CssClass="btn btn-success" Text="<i class='fa fa-upload'></i>Upload Video" OnClick="BtnUploadVideo_Click" OnClientClick="$('#FileUpload').click();"></asp:Button>--%>
                                                            <button id="BtnUploadNaturalPhoto" class="btn btn-success"><i class='fa fa-upload'></i> Upload Natural Photo</button>
                                                            <%--<asp:FileUpload runat="server" ID="FileUpload" ClientIDMode="Static" CssClass="form-control" style="display: none;" />--%>
                                                            <input type="file" id="fileUploadNatural" style="display: none;" class="form-control" multiple>
                                                        </fieldset>
                                                        <asp:Repeater ID="RepeaterNautralPhoto" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterNautralPhoto_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <div class="preview-images-zone">
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div class="preview-image" style="height:147px; width:147px;">
                                                                    <asp:LinkButton ID="DeleteButton" runat="server" CssClass="image-cancel" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                            CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                        <i class="fa fa-close" style="font-size:25px"></i>
                                                                    </asp:LinkButton>
                                                                    
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
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterNautralPhoto" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-tour" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelTour" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">TOURS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmTour" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary8" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorTour1" runat="server" ErrorMessage="Please select City." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorTour2" runat="server" ErrorMessage="Please select Start/End Date." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidatorTour3" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Visita Citta</h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="ComboTourCity">Scegli_Citta<span class="text-danger">*</span></label>
                                                            <asp:DropDownList runat="server" ID="ComboTourCity" ClientIDMode="Static" CssClass="custom-select" style="width:100%"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Periodo<span class="text-danger">*</h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtSDate">Start_Date/Time</label>
                                                            <asp:TextBox runat="server" ID="TxtSDate" ClientIDMode="Static" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtEDate">End_Date/Time</label>
                                                            <asp:TextBox runat="server" ID="TxtEDate" ClientIDMode="Static" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Contatti</h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtTourPhone">Numero_di_Telefono</label>
                                                            <asp:TextBox runat="server" ID="TxtTourPhone" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtTourEmail">Indirizzo_email</label>
                                                            <asp:TextBox runat="server" ID="TxtTourEmail" CssClass="form-control textField"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row" style="width: 800px;">
                                                <asp:Repeater ID="RepeaterTour" runat="server" ClientIDMode="Static" OnItemCommand="RepeaterTour_ItemCommand" OnItemDataBound="RepeaterModServices_ItemDataBound">
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
                                                                        <th>Azioni</th>
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
                                                            <td>
                                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Click OK per cancellare.');"
                                                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>'>
                                                                    <i class="fa fa-trash" style="font-size:25px"></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <div class="col-12">
                                                    <asp:Button runat="server" ID="BtnTour" Text="SAVE TOUR" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnTour_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RepeaterTour" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-setting" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelSetting" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">SETTINGS</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmSetting" ClientIDMode="Static" visible="false">Save Successed.</p>
                                            </div>
                                            <hr class="text-primary mb-4" />
                                            <div class="row m-xs">
                                                <asp:ValidationSummary ID="ValidationSummary9" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                                <asp:CustomValidator ID="ServerValidatorSetting" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                            </div>
                                            <div class="row text-left" runat="server" id="ModActiveTitle">
                                                <h5 class="text-primary text-bold text-left">Stato del Profilo</h5>
                                            </div>
                                            <div class="row" style="width: 800px;" runat="server" id="ModActive">
                                                <div class="col-12">
                                                    <div class="mb-4">
                                                        <div class="custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="switch1" clientIDMode="static">
                                                            <label class="custom-control-label" for="switch1">Lo Stato del tuo Profilo: Attivo</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row text-left">
                                                <h5 class="text-primary text-bold text-left">Cambia Password <span class="text-danger">*</span></h5>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtOldPassword">Inserisci_la_password_attuale</label>
                                                            <asp:TextBox runat="server" ID="TxtOldPassword" CssClass="form-control textField" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="width: 800px;">
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtNewPassword">Inserisci_la_nuova_password</label>
                                                            <asp:TextBox runat="server" ID="TxtNewPassword" CssClass="form-control textField" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4">
                                                        <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                            <label class="form-label" for="TxtNewPWRepeat">Conferma_la_nuova_password</label>
                                                            <asp:TextBox runat="server" ID="TxtNewPWRepeat" CssClass="form-control textField" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="text-primary mb-4 mt-0" />
                                            <div class="row mb-3 mt-3">
                                                <div class="col-12">
                                                    <asp:Button runat="server" ID="BtnSetting" Text="SAVE SETTINGS" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnSetting_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                        </Triggers>
                                    </asp:UpdatePanel>
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
    <script src="Scripts/jquery.dataTables.js"></script>
    <script src="Scripts/datatables.js"></script>
    <script src="Scripts/gijgo.min.js"></script>
    <script src="Scripts/custom-photo.js"></script>
    <script>
        $("#hideMenu").click(function () {
            if ($(".menu").hasClass('left-menu')) {
                $("#ModelName").removeClass("d-none");
                $(".menu").removeClass('left-menu');
                $(".nav-link").removeClass("left-menu-item");
                $(".menu-subitem").removeClass("d-none");
            }
            else
            {
                $("#ModelName").addClass("d-none");
                $(".menu").addClass('left-menu');
                $(".nav-link").addClass("left-menu-item");
                $(".menu-subitem").addClass("d-none");
            }
        });
    </script>

    <script>
        // Natural Photo Upload
        $("#BtnUploadNaturalPhoto").click(function () {
            $("#fileUploadNatural").click();
            return false;
        });
        $("#fileUploadNatural").on('change', readNaturalPhoto);

        function readNaturalPhoto() {
            if (window.File && window.FileList && window.FileReader) {
                var data = new FormData(); // To Save Photo to DB
                var files = event.target.files; //FileList object
                for (let i = 0; i < files.length; i++) {
                    var file = files[i];
                    if (!file.type.match('image')) continue;
                    data.append('files', file); // To Save Photo to DB
                }

                // TODO Save Image to DB
                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/SaveNaturalPhotos',
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function () {
                        onSuccess1({ success: true });
                    },
                    error: function () {
                        onSuccess1({ success: false });
                    }
                });
                ///////
                return true;
            } else {
                console.log('Browser not support');
                return false;
            }
        };

        var onSuccess1 = function (data) {
            if (data.success) {
                //$("#BtnReloadNatural").click();
                $("#<%= BtnReloadNatural.ClientID %>").click();
            } else {
                alert("Failed!");
            }
        };
    </script>

    <script>
        // Video Upload
        $("#BtnUploadVideo").click(function () {
            $("#fileUpload").click();
            return false;
        });
        $("#fileUpload").on('change', readVideo);

        function readVideo() {
            if (window.File && window.FileList && window.FileReader) {
                var data = new FormData(); // To Save Video to DB
                var files = event.target.files; //FileList object
                for (let i = 0; i < files.length; i++) {
                    var file = files[i];
                    if (!file.type.match('video')) continue;
                    data.append('files', file); // To Save Video to DB
                }

                // TODO Save Video to DB
                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/SaveVideo',
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function () {
                        onSuccess({ success: true });
                    },
                    error: function () {
                        onSuccess({ success: false });
                    }
                });
                ///////
                $("#BtnReload").click();
                return true;
            } else {
                console.log('Browser not support');
                return false;
            }
        };

        var onSuccess = function (data) {
            if (data.success) {
                $("#BtnReload").click();
            } else {
                alert("Failed!");
            }
        };
    </script>

    <script>
        // Biography Tab
        BioSelect2Setting();
        function BioSelect2Setting() {
            $("#ComboSex").select2({ theme: 'bootstrap' });
            $("#ComboEth").select2({ theme: 'bootstrap' });
            $("#ComboNation").select2({ theme: 'bootstrap' });
            $("#ComboRes").select2({ theme: 'bootstrap' });
            $("#ComboHairColor").select2({ theme: 'bootstrap' });
            $("#ComboHairLeng").select2({ theme: 'bootstrap' });
            $("#ComboEye").select2({ theme: 'bootstrap' });
            $("#ComboDress").select2({ theme: 'bootstrap' });
            $("#ComboBreast").select2({ theme: 'bootstrap' });
            $("#ComboSmoker").select2({ theme: 'bootstrap' });
            $("#ComboDrink").select2({ theme: 'bootstrap' });
            $("#ComboTattoos").select2({ theme: 'bootstrap' });
            $("#ComboPiercing").select2({ theme: 'bootstrap' });
        };
        // Language Tab
        LanSelectSetting();
        function LanSelectSetting() {
            $("#ComboLevel").select2({ theme: 'bootstrap' });
            $("#ComboLang").select2({ theme: 'bootstrap' });
        }
        // Service Tab
        ServiceSelectSetting();
        function ServiceSelectSetting() {
            $("#ComboServiceGroup").select2({ theme: 'bootstrap' });
            $("#ComboService").select2({ theme: 'bootstrap' });
        }
        // Work City Tab
        WorkCitySeletSetting();
        function WorkCitySeletSetting() {
            $("#ComboWorkCity").select2({ theme: 'bootstrap' });
            $("#ComboIncall").select2({ theme: 'bootstrap' });
            $("#ComboOutcall").select2({ theme: 'bootstrap' });
        }
        // Work Day/Hour Tab
        WorkDayHourSelectSetting();
        function WorkDayHourSelectSetting() {
            $("#ComboWorkDay").select2({ theme: 'bootstrap' });
            $("#ComboSHour").select2({ theme: 'bootstrap' });
            $("#ComboEHour").select2({ theme: 'bootstrap' });
        }
        // Rate Tab
        RateSelectSetting();
        function RateSelectSetting() {
            $("#ComboModIncallPlace").select2({ theme: 'bootstrap' });
            $("#ComboModOutcallPlace").select2({ theme: 'bootstrap' });
            $("#ComboDuration").select2({ theme: 'bootstrap' });
            $("#ComboDuration1").select2({ theme: 'bootstrap' });
        }
        // Contact Tab
        ContactSelectSetting();
        function ContactSelectSetting() {
            $("#ComboInstructionChat").select2({ theme: 'bootstrap' });
            $("#ComboSocialChat").select2({ theme: 'bootstrap' });
        }
        // Tour Tab
        TourSelectSetting();
        function TourSelectSetting() {
            $("#ComboTourCity").select2({ theme: 'bootstrap' });

            $("#TxtSDate").datetimepicker({
                uiLibrary: 'bootstrap4',
                modal: false,
                footer: true,
                language: 'it',
                format: "dd/mm/yyyy HH.MM"
            });

            $("#TxtEDate").datetimepicker({
                uiLibrary: 'bootstrap4',
                modal: false,
                footer: true,
                format: "dd/mm/yyyy HH.MM"
            });
        }
    </script>

    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedHandler);

        function pageLoadedHandler(sender, args) {
            // This function will be called after each UpdatePanel postback
            var updatedPanels = args.get_panelsUpdated();

            for (var i = 0; i < updatedPanels.length; i++) {
                var updatePanelID = updatedPanels[i].id;

                // About Me Tab
                if (updatePanelID === "UpdatePanelAbout") {
                    // Handle the toggle event for the About Me UpdatePanel
                    $('#TxtItaly').keyup(function () {
                        var characterCount = $('#TxtItaly').val().length,
                            current = $('#italCurrent'),
                            maximum = $('#italMaximum'),
                            theCount = $('#the-ital-count');

                        current.text(characterCount);

                        /*This isn't entirely necessary, just playin around*/
                        if (characterCount < 170) {
                            current.css('color', '#666');
                        }
                        if (characterCount > 170 && characterCount < 290) {
                            current.css('color', '#6d5555');
                        }
                        if (characterCount > 290 && characterCount < 500) {
                            current.css('color', '#793535');
                        }
                        if (characterCount > 500 && characterCount < 620) {
                            current.css('color', '#841c1c');
                        }
                        if (characterCount > 620 && characterCount < 739) {
                            current.css('color', '#8f0001');
                        }

                        if (characterCount >= 740) {
                            maximum.css('color', '#8f0001');
                            current.css('color', '#8f0001');
                            theCount.css('font-weight', 'bold');
                        } else {
                            maximum.css('color', '#666');
                            theCount.css('font-weight', 'normal');
                        }
                    });
                }
                // Language Tab
                if (updatePanelID === "UpdatePanelLang") {
                    LanSelectSetting();
                }
                // Service Tab
                if (updatePanelID === "UpdatePanelService") {
                    ServiceSelectSetting();
                }
                // Work City Tab
                if (updatePanelID === "UpdatePanelWorkCity") {
                    WorkCitySeletSetting();
                }
                // Work Day/Hour Tab
                if (updatePanelID === "UpdatePanelWorkDayHours") {
                    WorkDayHourSelectSetting();
                }
                // Rate Tab
                if (updatePanelID === "UpdatePanelRates") {
                    RateSelectSetting();
                }
                // Contact Tab
                if (updatePanelID === "UpdatePanelContact") {
                    ContactSelectSetting();
                }
                // Video Tab
                if (updatePanelID === "UpdatePanelVideos") {
                    $("#BtnUploadVideo").click(function () {
                        $("#fileUpload").click();
                        return false;
                    });
                    $("#fileUpload").on('change', readVideo);
                }
                // Natural Photo Tab
                if (updatePanelID === "UpdatePanelNaturalPhoto") {
                    $("#BtnUploadNaturalPhoto").click(function () {
                        $("#fileUploadNatural").click();
                        return false;
                    });
                    $("#fileUploadNatural").on('change', readNaturalPhoto);
                }
                // Tour Tab
                if (updatePanelID === "UpdatePanelTour") {
                    TourSelectSetting();
                }
            }
        };
        // About Me Tab
        $('#TxtItaly').keyup(function () {
            var characterCount = $('#TxtItaly').val().length,
                current = $('#italCurrent'),
                maximum = $('#italMaximum'),
                theCount = $('#the-ital-count');

            current.text(characterCount);

            /*This isn't entirely necessary, just playin around*/
            if (characterCount < 170) {
                current.css('color', '#666');
            }
            if (characterCount > 170 && characterCount < 290) {
                current.css('color', '#6d5555');
            }
            if (characterCount > 290 && characterCount < 500) {
                current.css('color', '#793535');
            }
            if (characterCount > 500 && characterCount < 620) {
                current.css('color', '#841c1c');
            }
            if (characterCount > 620 && characterCount < 739) {
                current.css('color', '#8f0001');
            }

            if (characterCount >= 740) {
                maximum.css('color', '#8f0001');
                current.css('color', '#8f0001');
                theCount.css('font-weight', 'bold');
            } else {
                maximum.css('color', '#666');
                theCount.css('font-weight', 'normal');
            }
        });

        $(document).click(function () {
            $("#SuccessAlarm").addClass("d-none");
            $("#SuccessAlarmAbout").addClass("d-none");
            $("#SuccessAlarmLang").addClass("d-none");
            $("#SuccessAlarmService").addClass("d-none");
            $("#SuccessAlarmWorkCity").addClass("d-none");
            $("#SuccessAlarmWorkHours").addClass("d-none");
            $("#SuccessAlarmRate").addClass("d-none");
            $("#SuccessAlarmContact").addClass("d-none");
            $("#SuccessAlarmPhoto").addClass("d-none");
            $("#SuccessAlarmVideo").addClass("d-none");
            $("#SuccessAlarmNaturalPhoto").addClass("d-none");
            $("#SuccessAlarmTour").addClass("d-none");
            $("#SuccessAlarmSetting").addClass("d-none");
        });
    </script>
</asp:Content>
