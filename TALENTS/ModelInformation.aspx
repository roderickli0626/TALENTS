﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelInformation.aspx.cs" Inherits="TALENTS.ModelInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/core.min.css" type="text/css">
    <link rel="stylesheet" href="Content/CSS/toastr.min.css" type="text/css">
    <style>
        .nav-link.active {
            background-color: white !important;
            color: black !important;
            font-size: 24px !important;
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

        #select2-ComboCity-container {
            text-align: center
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="row" style="background-color: gray">
                        <div class="col-3 p-lg-5" style="background-color: rgb(0,0,0,.5); padding-left: 80px;">
                            <h2 runat="server" id="ModelName" class="text-white text-center pb-5">Model Information</h2>
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active text-white" id="v-pills-bio-tab" data-toggle="pill" href="#v-pills-bio" role="tab" aria-controls="v-pills-home" aria-selected="true">Biografia</a>
                                <a class="nav-link text-white" id="v-pills-about-tab" data-toggle="pill" href="#v-pills-about" role="tab" aria-controls="v-pills-profile" aria-selected="false">About Me</a>
                                <a class="nav-link text-white" id="v-pills-language-tab" data-toggle="pill" href="#v-pills-language" role="tab" aria-controls="v-pills-messages" aria-selected="false">Language</a>
                                <a class="nav-link text-white" id="v-pills-service-tab" data-toggle="pill" href="#v-pills-service" role="tab" aria-controls="v-pills-messages" aria-selected="false">Services</a>
                                <a class="nav-link text-white" id="v-pills-workcity-tab" data-toggle="pill" href="#v-pills-workcity" role="tab" aria-controls="v-pills-settings" aria-selected="false">City of Work</a>
                                <a class="nav-link text-white" id="v-pills-workhours-tab" data-toggle="pill" href="#v-pills-workhours" role="tab" aria-controls="v-pills-settings" aria-selected="false">Work Hours</a>
                                <a class="nav-link text-white" id="v-pills-rates-tab" data-toggle="pill" href="#v-pills-rates" role="tab" aria-controls="v-pills-settings" aria-selected="false">Rates</a>
                                <a class="nav-link text-white" id="v-pills-contact-tab" data-toggle="pill" href="#v-pills-contact" role="tab" aria-controls="v-pills-settings" aria-selected="false">Contacts</a>
                                <a class="nav-link text-white" id="v-pills-photo-tab" data-toggle="pill" href="#v-pills-photo" role="tab" aria-controls="v-pills-settings" aria-selected="false">Photo Gallery</a>
                                <a class="nav-link text-white" id="v-pills-videos-tab" data-toggle="pill" href="#v-pills-videos" role="tab" aria-controls="v-pills-settings" aria-selected="false">Videos</a>
                                <a class="nav-link text-white" id="v-pills-naturalphoto-tab" data-toggle="pill" href="#v-pills-naturalphoto" role="tab" aria-controls="v-pills-settings" aria-selected="false">Natuarl Photo</a>
                                <a class="nav-link text-white" id="v-pills-tour-tab" data-toggle="pill" href="#v-pills-tour" role="tab" aria-controls="v-pills-settings" aria-selected="false">Tours</a>
                                <a class="nav-link text-white" id="v-pills-setting-tab" data-toggle="pill" href="#v-pills-setting" role="tab" aria-controls="v-pills-settings" aria-selected="false">Setting</a>
                            </div>
                        </div>
                        <div class="col-9 bg-gray text-center">
                            <div class="tab-content d-flex justify-content-center" id="v-pills-tabContent">
                                <div class="tab-pane fade show active bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-bio" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div class="row">
                                        <h2 class="mb-4 text-left col-6">BIOGRAPHY</h2>
                                        <p class="text-success col-6 text-right" runat="server" id="SuccessAlarm" visible="false">Save Biography Successed.</p>
                                    </div>
                                    <hr class="text-primary mb-4" />
                                    <%--<asp:ScriptManager ID="ScriptManagerBio" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelBio" ClientIDMode="Static">
                                        <ContentTemplate>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnBio" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                    <div class="row m-xs">
                                        <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                        <%--<asp:RequiredFieldValidator ID="ReqValName" runat="server" ErrorMessage="Please insert Name" ControlToValidate="TxtName" Display="None" Enabled="True"></asp:RequiredFieldValidator>--%>
                                        <asp:CustomValidator ID="ServerValidatorBio1" runat="server" ErrorMessage="Please insert Name." Display="None"></asp:CustomValidator>
                                        <asp:CustomValidator ID="ServerValidatorBio2" runat="server" ErrorMessage="Save Biography is failed." Display="None"></asp:CustomValidator>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtName" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtName">Name <span class="text-danger">*</span></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtSlogan" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtSlogan">Slogan</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-6">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtAge" CssClass="form-control form-control-lg" TextMode="Number"></asp:TextBox>
                                                <label class="form-label" for="TxtAge">Age</label>
                                            </div>
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
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtHeight" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtHeight">Altezza</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtWeight" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtWeight">Peso</label>
                                            </div>
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
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtShoes" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtShoes">Scarpe</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 800px;">
                                        <div class="col-3">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtBust" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtBust">Busto</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtWaist" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtWaist">Vita</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtHaunch" CssClass="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="TxtHaunch">Fianchi</label>
                                            </div>
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
                                            <div class="form-outline mb-4">
                                                <asp:TextBox runat="server" ID="TxtPeculiarities" CssClass="form-control form-control-lg" TextMode="MultiLine"></asp:TextBox>
                                                <label class="form-label" for="TxtPeculiarities">Particolarita</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <asp:Button runat="server" ID="BtnBio" Text="SAVE BIOGRAPHY" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnBio_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;"  id="v-pills-about" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <asp:ScriptManager ID="ScriptManagerAbout" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelAbout" ClientIDMode="Static">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">ABOUT ME</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmAbout" visible="false">Save Successed.</p>
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
                                <div class="tab-pane fade" id="v-pills-language" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-service" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-workcity" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-workhours" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-rates" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-contact" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-photo" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-videos" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-naturalphoto" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-tour" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                                <div class="tab-pane fade" id="v-pills-setting" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script src="Scripts/core.min.js"></script>
    <script src="Scripts/toastr.min.js"></script>
    <script>
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
    </script>

    <script>
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
    </script>
</asp:Content>