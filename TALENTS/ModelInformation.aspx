<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelInformation.aspx.cs" Inherits="TALENTS.ModelInformation" %>

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
                                    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelAbout" ClientIDMode="Static" UpdateMode="Conditional">
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
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-language" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelLang" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">LANGUAGE</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmLang" visible="false">Save Successed.</p>
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
                                                                <thead>
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
                                            <asp:AsyncPostBackTrigger ControlID="LanguageRepeater" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="tab-pane fade bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-service" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelService" ClientIDMode="Static" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row">
                                                <h2 class="mb-4 text-left col-6">SERVICES</h2>
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmService" visible="false">Save Successed.</p>
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
                                                        <asp:TextBox runat="server" ID="TxtServiceAmount" PlaceHolder="Amount" CssClass="form-control form-control-lg"></asp:TextBox>
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
                                                                <thead>
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
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmWorkCity" visible="false">Save Successed.</p>
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
                                                                <thead>
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
                                                                        <thead>
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
                                                                        <thead>
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
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmWorkHours" visible="false">Save Successed.</p>
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
                                                                <thead>
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
                                                <p class="text-success col-6 text-right" runat="server" id="SuccessAlarmRate" visible="false">Save Successed.</p>
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
                                                        <asp:TextBox runat="server" ID="TxtIncallRate" PlaceHolder="Incall Rate" CssClass="form-control form-control-lg"></asp:TextBox>
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
                                                        <asp:TextBox runat="server" ID="TxtOutcallRate" PlaceHolder="Outcall Rate" CssClass="form-control form-control-lg"></asp:TextBox>
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
                                                                    <thead>
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
                                                                    <thead>
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

                                </div>
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
    </script>
</asp:Content>
