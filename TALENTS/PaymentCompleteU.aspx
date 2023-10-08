<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="PaymentCompleteU.aspx.cs" Inherits="TALENTS.PaymentCompleteU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-8 mx-auto text-center bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row">
                                <h1>Pagamento Completato</h1>
                                <div id="divPaymentDetails" runat="server"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>
