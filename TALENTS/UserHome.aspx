<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="TALENTS.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <style>
        .img-title img {
            width:370px;
            min-width:100%;
        }

        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
        }

        #select2-ComboCity-container {
            text-align: center
        }
        
    </style>
    <style>
        .box {
            position: relative;
            background: #eeee;
            float: left;
        }

        .ribbon {
            position: absolute;
            right: -5px;
            top: -5px;
            z-index: 1;
            overflow: hidden;
            width: 93px;
            height: 93px;
            text-align: right;
        }

        .ribbon span {
            font-size: 0.8rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 32px;
            transform: rotate(45deg);
            width: 125px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 17px;
            // change this, if no border right: -29px;
            // change this, if no border
        }

        .ribbon span::before {
            content: '';
            position: absolute;
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79A70A;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .ribbon span::after {
            content: '';
            position: absolute;
            right: 0%;
            top: 100%;
            z-index: -1;
            border-right: 3px solid #79A70A;
            border-left: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .red span {
            background: linear-gradient(#f70505 0%, #8f0808 100%);
        }

        .red span::before {
            border-left-color: #8f0808;
            border-top-color: #8f0808;
        }

        .red span::after {
            border-right-color: #8f0808;
            border-top-color: #8f0808;
        }

        .blue span {
            background: linear-gradient(#2989d8 0%, #1e5799 100%);
        }

        .blue span::before {
            border-left-color: #1e5799;
            border-top-color: #1e5799;
        }

        .blue span::after {
            border-right-color: #1e5799;
            border-top-color: #1e5799;
        }

        .gray span {
            background: linear-gradient(#555555 0%, #000000 100%);
        }

        .gray span::before {
            border-left-color: gray;
            border-top-color: gray;
        }

        .gray span::after {
            border-right-color: gray;
            border-top-color: gray;
        }

        .foo {
            clear: both;
        }

        .bar {
            content: "";
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79a70a;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79a70a;
        }

        .baz {
            font-size: 1rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 2em;
            transform: rotate(45deg);
            width: 100px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 100px;
            left: 1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 180px;background-color:white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfPurchased" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HfModelID" runat="server" ClientIDMode="Static" />
                    <div class="container" style="max-width: 1200px; padding-bottom: 50px;">
                        <div class="row mb-5" style="border: 1px solid; border-color: black; border-radius:4px; margin-left: auto; margin-right: auto; padding: 20px">
                            <h2 class="text-black pt-3 pb-5 d-block text-center col-12">RICERCA</h2>
                            <div class="input-group mb-4 input-group-lg col-6 offset-2 text-right">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">CITTA</span>
                                </div>
                                <div class="form-control pt-0 pb-0 pr-0">
                                    <asp:DropDownList runat="server" ID="ComboCity" CssClass="custom-select" ClientIDMode="Static"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-2 text-right">
                                <asp:Button runat="server" ID="BtnSearch" Text="RICERCA" CssClass="btn btn-block btn-dark btn-lg text-white" OnClick="BtnSearch_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Repeater runat="server" ID="ModelPhotoRepeater">
                                <ItemTemplate>
                                    <div class="col-lg-4 col-12 text-center p-3">
                                        <div class="row">
                                            <div class="col-12" style="height:426px; overflow:hidden;padding:10px;">
                                                <%# Eval("Mark") %>
                                                <a href="UserHomeDetail.aspx?modelId=<%#Eval("Id") %>" class="img-title">
                                                    <image src="Upload/Photos/<%#Eval("Image") %>"></image>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 pt-4">
                                                <a href="UserHomeDetail.aspx?modelId=<%#Eval("Id") %>">
                                                    <h2 class="text-black pb-3 text-left"><%#Eval("Name") %></h2>
                                                </a>
                                                <h5 class="text-black text-left"><%#Eval("CityResidence") %></h5>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content text-white" style="background-color: #353535;">
                                <!-- Modal Header -->
                                <div class="modal-header pl-5">
                                    <h2 class="modal-title">LIVE CHAT</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:ScriptManager runat="server" ID="ScriptManagerForModal"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForModal">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="HfMeetingLink" runat="server" ClientIDMode="Static" />
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-3 text-left bg-gradient text-danger" ClientIDMode="Static" />
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Create Link Failed" Display="None"></asp:CustomValidator>
                                            <asp:RadioButtonList ID="LinkType" CssClass="mx-auto" style="font-size: 22px;" runat="server">
                                                <asp:ListItem Text="Only Chat" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Video Call" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Chat & Video Call" Value="3"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnCreateLink" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer p-lg-5 justify-content-around">
                                    <asp:Button runat="server" ID="BtnCreateLink" ClientIDMode="Static" CssClass="btn btn-lg btn-success mr-5" Text="CREAT LINK" OnClick="BtnCreateLink_Click" />
                                    <asp:Button runat="server" ID="BtnCreateLinkHidden" ClientIDMode="Static" CssClass="btn btn-lg btn-success mr-5 d-none" />
                                    <asp:Button runat="server" ID="BtnClose" ClientIDMode="Static" Text="CANCEL" CssClass="btn btn-lg bg-white"/>
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
        $("#ComboCity").select2({ theme: 'bootstrap' });

        $("#BtnClose").click(function () {
            $("#myModal").modal('hide');
            return false;
        });

    </script>
    <!-- Add the Tawk.to chat widget code snippet here -->
    <script>
        $(".live-chat").click(function () {
            // Only Possible between Purchased User and Model with Green Light
            if ($(this).hasClass("red")) return;
            if ($("#HfPurchased").val() == "False") return;
            // Open Creat Link Modal
            $("#HfModelID").val($(this)[0].dataset.id);
            $("#myModal").modal('show');
            $("#ValSummary").addClass("d-none");
            return false;
        })
    </script>



    <script src="Scripts/jquery.signalR-2.4.3.js"></script>
    <script src="signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            var proxy = $.connection.notificationHub;

            $("#BtnCreateLinkHidden").click(function () {
                var modelID = $("#HfModelID").val();
                var meetingLink = $("#HfMeetingLink").val();

                proxy.server.sendNotifications("MODELID-" + modelID + "," + meetingLink);

                $("#myModal").modal('hide');
                window.open(meetingLink, "_blank");
                return false;
            });

            $.connection.hub.start();
        });
    </script>
</asp:Content>