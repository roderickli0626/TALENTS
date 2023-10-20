<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TALENTS.Login" %>

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

                                                <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                                <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                                <div class="mb-4">
                                                    <asp:TextBox runat="server" ID="TxtEmail" PlaceHolder="Email" CssClass="form-control form-control-lg" TextMode="Email" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>

                                                <div class="mb-4">
                                                    <asp:TextBox runat="server" ID="TxtPassword" PlaceHolder="Password" CssClass="form-control form-control-lg" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>

                                                <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="ForgotPassword.aspx">Forgot password?</a></p>

                                                <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left bg-gradient" ClientIDMode="Static" />
                                                <asp:RequiredFieldValidator ID="ReqValEmail" runat="server" ErrorMessage="Inserire l'email." CssClass="text-bg-danger" ControlToValidate="TxtEmail" Display="None"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="ReqValPassword" runat="server" ErrorMessage="Inserire la password." CssClass="text-black" ControlToValidate="TxtPassword" Display="None"></asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Email o Password errata." Display="None"></asp:CustomValidator>

                                                <asp:Button runat="server" ID="LogInBtn" CssClass="btn btn-outline-light btn-lg px-5" Text="Login" OnClick="LogInBtn_Click" />
                                                
                                            </div>
                                            
                                            <div>
                                                <p class="mb-0">
                                                    Don't have an account? <a href="Register.aspx" class="text-white-50 fw-bold">Register</a>
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
