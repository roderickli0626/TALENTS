<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TALENTS.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/core.min.css" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" data-setbg="Content/Images/slider-1.jpg" style="padding-top: 180px;">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <section class="gradient-custom">
                        <div class="container py-5">
                            <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                    <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                        <div class="card-body p-5 text-center">

                                            <div class="mb-md-5 mt-md-4 pb-5">

                                                <h2 class="fw-bold mb-2 text-uppercase">Register</h2>
                                                <p class="text-white-50 mb-5">Please enter your register information!</p>

                                                <div class="mb-4">
                                                    <asp:TextBox runat="server" ID="TxtUsername" PlaceHolder="Name" CssClass="form-control form-control-lg" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>

                                                <div class="mb-4">
                                                    <asp:TextBox runat="server" ID="TxtEmail" PlaceHolder="Email" CssClass="form-control form-control-lg" TextMode="Email" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>

                                                <div class="mb-4">
                                                    <asp:TextBox runat="server" ID="TxtPassword" PlaceHolder="Password" CssClass="form-control form-control-lg" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>

                                                <div class="mb-5">
                                                    <asp:TextBox runat="server" ID="TxtPasswordRepeat" PlaceHolder="Confirm Password" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                </div>

                                                <div class="form-outline form-white mb-5">
                                                    <div class="custom-control custom-radio custom-control-inline mr-5">
                                                        <input type="radio" runat="server" clientidmode="static" class="custom-control-input" id="RadioModel" name="example" value="model" checked="true">
                                                        <label class="custom-control-label" for="RadioModel">Model</label>
                                                    </div>

                                                    <div class="custom-control custom-radio custom-control-inline ml-5">
                                                        <input type="radio" runat="server" clientidmode="static" class="custom-control-input" id="RadioUser" name="example" value="user">
                                                        <label class="custom-control-label" for="RadioUser">User</label>
                                                    </div>
                                                </div>

                                                <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left bg-gradient" ClientIDMode="Static" />
                                                <asp:RequiredFieldValidator ID="ReqValEmail" runat="server" ErrorMessage="Inserire un indirizzo Email." CssClass="text-bg-danger" ControlToValidate="TxtEmail" Display="None"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="ReqValPassword" runat="server" ErrorMessage="Inserire una Password." CssClass="text-black" ControlToValidate="TxtPassword" Display="None"></asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="PasswordValidator" runat="server" ErrorMessage="Le Password non corrispondono." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="Email non è corretta." Display="None"></asp:CustomValidator>
                                                <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Questo indirizzo Email è già registrato." Display="None"></asp:CustomValidator>

                                                <asp:Button runat="server" ID="BtnRegister" Text="Register" OnClick="BtnRegister_Click" CssClass="btn btn-outline-light btn-lg px-5" />
                                            </div>

                                            <div>
                                                <p class="mb-0">
                                                    Do you have an account? <a href="Login.aspx" class="text-white-50 fw-bold">LogIn</a>
                                                </p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>
