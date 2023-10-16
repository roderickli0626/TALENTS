<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="TALENTS.ResetPassword" %>
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

                                            <div class="mt-md-4 pb-5">

                                                <h2 class="fw-bold mb-5 text-uppercase">Reset Password</h2>

                                                <div class="form-outline form-white mb-4">
                                                    <asp:TextBox runat="server" ID="TxtPassword" CssClass="form-control form-control-lg" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <label class="form-label" for="TxtPassword">Password</label>
                                                </div>

                                                <div class="form-outline form-white mb-5">
                                                    <asp:TextBox runat="server" ID="TxtRepeatPW" CssClass="form-control form-control-lg" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <label class="form-label" for="TxtRepeatPW">Repeat Password</label>
                                                </div>

                                                <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left bg-gradient" ClientIDMode="Static" />
                                                <asp:RequiredFieldValidator ID="ReqValPassword" runat="server" ErrorMessage="Inserire la password." CssClass="text-black" ControlToValidate="TxtPassword" Display="None"></asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Email o Password errata." Display="None"></asp:CustomValidator>

                                                <asp:Button runat="server" ID="ResetPW" CssClass="btn btn-outline-light btn-lg px-5" Text="Reset Password" OnClick="ResetPassword_Click" />
                                                
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
    <script src="Scripts/core.min.js"></script>
</asp:Content>
