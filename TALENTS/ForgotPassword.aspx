<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="TALENTS.ForgotPassword" %>
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

                                                <h2 class="fw-bold mb-2 text-uppercase mb-5">Recupero Password</h2>

                                                <div class="form-outline form-white mb-5">
                                                    <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control form-control-lg" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <label class="form-label" for="TxtEmail">Email</label>
                                                </div>

                                                <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left bg-gradient" ClientIDMode="Static" />
                                                <asp:RequiredFieldValidator ID="ReqValEmail" runat="server" ErrorMessage="Inserisci la tua email." CssClass="text-bg-danger" ControlToValidate="TxtEmail" Display="None"></asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Questa Email non esiste." Display="None"></asp:CustomValidator>

                                                <asp:Button runat="server" ID="SendEmail" CssClass="btn btn-outline-light btn-lg px-5" Text="Invia Email" OnClick="SendEmail_Click" />
                                                
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
