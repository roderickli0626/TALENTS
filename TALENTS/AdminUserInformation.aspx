<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminUserInformation.aspx.cs" Inherits="TALENTS.AdminUserInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/bootstrap-datepicker3.css" type="text/css">
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

        .textField {
            box-shadow: none !important;
            border: none;
            text-align: center;
        }

        #select2-ComboCity-container {
            text-align: center
        }

        .custom-control-input:checked~.custom-control-label::before {
            border-color: #14a44d;
            background-color: #14a44d;
        }

        @media screen and (min-width:480px) {
            .wd-800 {
                width: 800px;
            }
            .wd-870 {
                width: 870px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="row" style="background-color: gray; justify-content: center;">
                        <div class="bg-gray text-center">
                            <div class="bg-white m-lg-5 p-lg-5 mx-auto wd-870" style="border-radius: 5px;margin-left:auto !important; margin-right:auto !important; padding: 20px;">
                                <div class="row">
                                    <h2 class="mb-4 text-left col-md-6">USER INFORMATION</h2>
                                    <p class="text-success col-md-6 text-right" runat="server" id="SuccessAlarm" visible="false">Save Successed.</p>
                                </div>
                                <hr class="text-primary mb-4" />
                                <div class="row m-xs">
                                    <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="col-sm-12 text-left text-danger asp-validation-message" />
                                    <asp:CustomValidator ID="ServerValidatorInfo1" runat="server" ErrorMessage="Please insert Name." Display="None"></asp:CustomValidator>
                                    <asp:CustomValidator ID="ServerValidatorInfo2" runat="server" ErrorMessage="Save failed." Display="None"></asp:CustomValidator>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
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
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtSurname">Surname</label>
                                                <asp:TextBox runat="server" ID="TxtSurname" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtSurname" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtSurname">Surname</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtAddress">Address</label>
                                                <asp:TextBox runat="server" ID="TxtAddress" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtAddress" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtAddress">Address</label>
                                        </div>--%>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtCAP">CAP</label>
                                                <asp:TextBox runat="server" ID="TxtCAP" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtCAP" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtCAP">CAP</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="ComboRes">Residence</label>
                                                <asp:DropDownList runat="server" ID="ComboRes" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="ComboNation">Nationality</label>
                                                <asp:DropDownList runat="server" ID="ComboNation" ClientIDMode="Static" CssClass="custom-select"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtCAP">BirthDay</label>
                                                <asp:TextBox runat="server" ID="TxtBirthDay" CssClass="form-control textField" ClientIDMode="Static"
                                                    data-plugin-datepicker="" data-plugin-options='{ "format": "dd/mm/yyyy", "todayHighlight": "true" }'></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtSociety">Society</label>
                                                <asp:TextBox runat="server" ID="TxtSociety" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtSociety" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtSociety">Society</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label text-nowrap" for="TxtVat">Vat Number</label>
                                                <asp:TextBox runat="server" ID="TxtVat" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtVat" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtVat">Vat_Number</label>
                                        </div>--%>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label text-nowrap" for="TxtLicenze">Licenze Number</label>
                                                <asp:TextBox runat="server" ID="TxtLicenze" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtLicenze" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtLicenze">Licenze_Number</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtWebSite">WebSite</label>
                                                <asp:TextBox runat="server" ID="TxtWebSite" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtWebSite" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtWebSite">WebSite</label>
                                        </div>--%>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtEmail">Email</label>
                                                <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtEmail">Email</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtMobile">Mobile</label>
                                                <asp:TextBox runat="server" ID="TxtMobile" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtMobile" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtMobile">Mobile</label>
                                        </div>--%>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtPhone">Phone</label>
                                                <asp:TextBox runat="server" ID="TxtPhone" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtPhone" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="TxtPhone">Phone</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row wd-800">
                                    <div class="col-12">
                                        <div class="mb-4">
                                            <div class="form-control form-control-lg d-flex" style="outline-color: darkgray; outline-style: solid; outline-width: 0px;">
                                                <label class="form-label" for="TxtNote">Note</label>
                                                <asp:TextBox runat="server" ID="TxtNote" CssClass="form-control textField"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="TxtNote" CssClass="form-control form-control-lg" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            <label class="form-label" for="TxtNote">Note</label>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-2">
                                        <asp:Button runat="server" ID="BtnUserInfo" Text="SAVE INFORMATION" CssClass="btn btn-success btn-block btn-lg" OnClick="BtnUserInfo_Click" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button runat="server" ID="BtnCancel" Text="Cancel" CausesValidation="False" CssClass="btn btn-dark btn-block btn-lg" PostBackUrl="~/AdminUser.aspx" />
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
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script>
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

        $("#TxtBirthDay").datepicker({
            autoclose: true,
            format: "dd/mm/yyyy"
        });
    </script>
</asp:Content>
