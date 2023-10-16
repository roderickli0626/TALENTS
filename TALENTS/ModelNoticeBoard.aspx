<%@ Page Title="" Language="C#" MasterPageFile="~/ModelPage.Master" AutoEventWireup="true" CodeBehind="ModelNoticeBoard.aspx.cs" Inherits="TALENTS.ModelNoticeBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <style>
        .notice:hover {
            transform: scale(1.02);
            cursor: pointer;
        }
        .notice {
            transition: transform .2s;
            color: black;

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
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-8 mx-auto text-center bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row justify-content-center">
                                <h2 class="mb-4 justify-content-center">BACHECA ANNUNCI</h2>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-6">
                                    <div class="mb-5">
                                        <asp:TextBox runat="server" ID="TxtSearch" ClientIDMode="Static" PlaceHolder="Search..." CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <table class="table table-responsive" id="notice-table">
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-lg">
                            <div class="ribbon modal-ribbon"><span>NEW</span></div>
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header justify-content-center">
                                    <h2 class="modal-title">USER NOTICE</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <div class="row">
                                        <p class="modal-message" style="color: black;"></p>
                                    </div>
                                    <div class="row pb-3">
                                        <span class="badge badge-pill modal-badge" style="margin-left: auto;font-size:15px;"></span>
                                    </div>
                                    <div class="row">
                                        <p class="modal-contact" style="color: darkgray;"></p>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <asp:Button runat="server" ID="BtnClose" ClientIDMode="Static" Text="Close" CssClass="btn btn-lg btn-dark"/>
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
    <script src="Scripts/jquery.dataTables.js"></script>
    <script src="Scripts/datatables.js"></script>
    <script>
        $("#BtnClose").click(function () {
            $("#myModal").modal('hide');
            return false;
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var datatable = $('#notice-table').dataTable({
                "serverSide": true,
                "ajax": 'DataService.asmx/FindNotices',
                "dom": '<"table-responsive"t>pr',
                "autoWidth": false,
                "pageLength": 10,
                "processing": true,
                "ordering": false,
                "columns": [{
                    "render": function (data, type, row, meta) {
                        var state = row.State;
                        if (state == 1) {
                            var ribbon = '<div class="ribbon"><span>NEW</span></div>';
                            var badge = 'badge-success';
                        }
                        if (state == 2) {
                            var ribbon = '<div class="ribbon red"><span>EXPIRED</span></div>';
                            var badge = 'badge-danger';
                        }
                        if (state == 3) {
                            var ribbon = '<div class="ribbon blue"><span>CONTACTABLE</span></div>';
                            var badge = 'badge-primary';
                        }
                        return '<div class="col-12 mb-4 pl-5 pr-5 noticeDiv">' + 
                                    '<div class="p-4 bg-gradient box notice" style = "border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);width:100%;" >' + 
                                        ribbon +
                                        '<div class="d-flex pl-3 pr-3">' + 
                                            '<image src="Upload/Photos/user-default.jpg" style="height:60px;width:60px;border-radius:30px;"></image>' + 
                                            '<h2 class="mx-auto">' + row.Title + '</h2>' + 
                                        '</div>' + 
                                        '<p class="text-left p-3 mb-0">' + row.Message + 
                                        '</p>' + 
                                        '<span class="badge badge-pill ' + badge + '" style="float:right;font-size:15px;">' + row.Username + ', ' + row.From + ' - ' + row.To + ', ' + row.City + '</span>' + 
                                    '</div>' + 
                                '</div> ';
                    }
                }],

                "fnServerParams": function (aoData) {
                    aoData.searchVal = $('#TxtSearch').val();
                }
            });

            $('#TxtSearch').on('input', function () {
                datatable.fnDraw();
            });

            datatable.on('click', '.noticeDiv', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));
                var state = row.State;
                var badgeInfo = row.Username + ', ' + row.From + ' - ' + row.To + ', ' + row.City;
                if (state == 1) {
                    $(".modal-ribbon").removeClass("red");
                    $(".modal-ribbon").removeClass("blue");
                    $(".modal-ribbon").html("<span>NEW</span>");
                    $(".modal-badge").removeClass("badge-danger").removeClass("badge-primary").addClass("badge-success").text(badgeInfo);

                }
                if (state == 2) {
                    $(".modal-ribbon").removeClass("blue");
                    $(".modal-ribbon").addClass("red").html("<span>EXPIRED</span>");
                    $(".modal-badge").removeClass("badge-success").removeClass("badge-primary").addClass("badge-danger").text(badgeInfo);
                }
                if (state == 3) {
                    $(".modal-ribbon").removeClass("red");
                    $(".modal-ribbon").addClass("blue").html("<span>CONTACTABLE</span>");
                    $(".modal-badge").removeClass("badge-danger").removeClass("badge-success").addClass("badge-primary").text(badgeInfo);
                }
                $(".modal-message").text(row.Message);
                $(".modal-contact").text(row.Contact);

                $("#myModal").modal('show');

                $(".modal-title").text(row.Title);
            });
        })
    </script>
</asp:Content>
