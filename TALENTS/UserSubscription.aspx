<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserSubscription.aspx.cs" Inherits="TALENTS.UserSubscription1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <style>
        @charset "utf-8";
        /* CSS Document */
        @import url(http://fonts.googleapis.com/css?family=Open+Sans:300italic,500,400,300,800);
        @import url(http://fonts.googleapis.com/css?family=Ubuntu:300,400,700);
        @import url(http://fonts.googleapis.com/css?family=Roboto:100,300,400);

        h1, h3, h4, h6, input, p {
            font-family: "Open Sans";
            margin: 0px;
        }

        .view-more:hover, .view-more:focus {
            background-color: gray !important;
            color: black !important;
        }

        ul {
            margin: 0px;
            padding: 0px;
            list-style: none;
        }

        .pricing-table-container {
            padding: 50px 0px;
        }

        .description {
            padding: 15px 0px;
        }

        .description a {
            padding: 10px;
            font-size: 13px;
            display: block;
            font-weight: bold;
            border-bottom: 1px solid #DDD;
        }

        .description a.active {
            background-color: #FFF;
            padding-left: 25px;
        }

        @charset "utf-8";
        /* DEMO 01 */
        .pricing-table-3 {
            background-color: #FFF;
            margin: 15px auto;
            box-shadow: 0px 0px 25px rgba(0,0,0,0.1);
            max-width: 300px;
            border-radius: 0px 10px 0px 10px;
            overflow: hidden;
            position: relative;
            min-height: 250px;
            transition: all ease-in-out 0.25s;
        }

        .pricing-table-3:hover {
            transform: scale(1.1,1.1);
            cursor: pointer;
        }

        .pricing-table-3.basic .price {
            background-color: #28b6f6;
            color: #FFF;
        }

        .pricing-table-3.premium .price {
            background-color: #ff9f00;
            color: #FFF;
        }

        .pricing-table-3.business .price {
            background-color: #c3185c;
            color: #FFF;
        }

        .pricing-table-3 .pricing-table-header {
            background-color: #212121;
            color: #FFF;
            padding: 20px 0px 0px 20px;
            position: absolute;
            z-index: 5;
        }

        .pricing-table-3 .pricing-table-header p {
            font-size: 12px;
            opacity: 0.7;
        }

        .pricing-table-3 .pricing-table-header::before {
            content: "";
            position: absolute;
            left: -50px;
            right: -180px;
            height: 125px;
            top: -50px;
            background-color: #212121;
            z-index: -1;
            transform: rotate(-20deg)
        }

        .pricing-table-3 .price {
            position: absolute;
            top: 0px;
            text-align: right;
            padding: 110px 20px 0px 0px;
            right: 0px;
            left: 0px;
            font-size: 20px;
            z-index: 4;
        }

        .pricing-table-3 .price::before {
            content: "";
            position: absolute;
            left: 0px;
            right: 0px;
            height: 100px;
            bottom: -25px;
            background-color: inherit;
            transform: skewY(10deg);
            z-index: -1;
            box-shadow: 0px 5px 0px 5px rgba(0,0,0,0.05);
        }


        .pricing-table-3 .pricing-body {
            padding: 20px;
            padding-top: 200px;
        }

        .pricing-table-3 .pricing-table-ul li {
            color: rgba(0,0,0,0.7);
            font-size: 13px;
            padding: 10px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .pricing-table-3 .pricing-table-ul .fa {
            margin-right: 10px;
        }

        .pricing-table-3.basic .pricing-table-ul .fa {
            color: #28b6f6;
        }

        .pricing-table-3.premium .pricing-table-ul .fa {
            color: #ff9f00;
        }

        .pricing-table-3.business .pricing-table-ul .fa {
            color: #c3185c;
        }

        .pricing-table-3 .view-more {
            margin: 10px 20px;
            display: block;
            text-align: center;
            background-color: #212121;
            padding: 10px 0px;
            color: #FFF;
        }

        .pointer-event-none {
            pointer-events:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-md-8 mx-auto text-center bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row justify-content-center">
                                <asp:HiddenField ID="HfSubscriptionID" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField ID="HfGetAllow" runat="server" ClientIDMode="Static" />
                                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                    <ContentTemplate>
                                        <h2 class="mb-4 justify-content-center">PURCHASE SUBSCRIPTION (<%= CurrentCredits %> CREDITS)</h2>
                                        <h4 class="text-success float-end" runat="server" id="ExpireDate" visible="false">duration</h4>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnPayment" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <hr class="text-primary mb-4" />
                            <div class="row">
                                <div class="col-md-4 col-sm-12">
                                    <div class="pricing-table-3 basic">
                                        <div class="pricing-table-header bg-transparent d-flex">
                                            <h1 class="text-left text-white"><strong>1</strong></h1>
                                            <h3 class="text-white"><%= DAYTITLE %></h3>
                                        </div>
                                        <div class="price"><strong><%= DAYCREDIT %></strong> Credits</div>
                                        <div class="pricing-body">
                                            <ul class="pricing-table-ul mb-4">
                                                <li><i class="fa fa-send"></i>Live Chat With Active Model</li>
                                                <li><i class="fa fa-database"></i>User Noticeboard</li>
                                            </ul>
                                            <a href="#" id="btnWeek" data-id="<%= DAYID %>"" class="view-more" style="border-radius: 5px;">PURCHASE</a>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-md-4 col-sm-12">
                                    <div class="pricing-table-3 premium">
                                        <div class="pricing-table-header bg-transparent d-flex">
                                            <h1 class="text-left text-white"><strong>1</strong></h1>
                                            <h3 class="text-white"><%= WEEKTITLE %></h3>
                                        </div>
                                        <div class="price"><strong>€<%= WEEKPRICE %> / <%= WEEKCREDIT %></strong> Credits</div>
                                        <div class="pricing-body">
                                            <ul class="pricing-table-ul mb-4">
                                                <li><i class="fa fa-send"></i>Live Chat With Active Model</li>
                                                <li><i class="fa fa-database"></i>User Noticeboard</li>
                                            </ul>
                                            <a href="#" id="btnMonth" data-id="<%= WEEKID %>" class="view-more" style="border-radius: 5px;">PURCHASE</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="pricing-table-3 business">
                                        <div class="pricing-table-header bg-transparent d-flex">
                                            <h1 class="text-left text-white"><strong>1</strong></h1>
                                            <h3 class="text-white"><%= MONTHTITLE %></h3>
                                        </div>
                                        <div class="price"><strong>€<%= MONTHPRICE %> / <%= MONTHCREDIT %></strong> Credits</div>
                                        <div class="pricing-body">
                                            <ul class="pricing-table-ul mb-4">
                                                <li><i class="fa fa-send"></i>Live Chat With Active Model</li>
                                                <li><i class="fa fa-database"></i>User Noticeboard</li>
                                            </ul>
                                            <a href="#" id="btnQuarter" data-id="<%= MONTHID %>" class="view-more" style="border-radius: 5px;">PURCHASE</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center mt-5 mb-4">
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnPayment" ClientIDMode="Static" CssClass="btn btn-block btn-lg btn-dark text-white d-none" 
                                        style="border-radius: 30px;" Text="PAYMENT WITH PAYPAL / CREDITS" OnClick="btnPayment_Click" />
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
    <script>
        $(".view-more").on('blur', function (event) {
            if (event.relatedTarget != null && (event.relatedTarget.id) == "btnPayment") {
                return;
            }
            else
            {
                $("#btnPayment").addClass("d-none");
                $("#HfSubscriptionID").val('');
            }
        });

        $("#btnWeek").click(function () {
            if ($("#HfGetAllow").val() == "true") return;

            $("#btnPayment").removeClass("d-none");
            $("#HfSubscriptionID").val($("#btnWeek").data('id'));
        });

        $("#btnMonth").click(function () {
            if ($("#HfGetAllow").val() == "true") return;

            $("#btnPayment").removeClass("d-none");
            $("#HfSubscriptionID").val($("#btnMonth").data('id'));
        });

        $("#btnQuarter").click(function () {
            if ($("#HfGetAllow").val() == "true") return;

            $("#btnPayment").removeClass("d-none");
            $("#HfSubscriptionID").val($("#btnQuarter").data('id'));
        });

        $("#btnPayment").click(function () {
            return confirm("Pay with Paypal?");
        })

    </script>
</asp:Content>
