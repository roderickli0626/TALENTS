<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminNotice.aspx.cs" Inherits="TALENTS.AdminNotice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <link rel="stylesheet" href="Content/CSS/gijgo.min.css" />
     <style>
        .notice:hover {
            transform: scale(1.02);
            cursor: pointer;
        }
        .notice {
            transition: transform .2s;
            color: black;

        }

        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
        }

        #select2-ComboUser-container {
            text-align: center;
            font-size: 1.25rem;
            font-family: Dosis;
        }

        .disabled {
            pointer-events: none;
            opacity: 0.5;
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
                    <asp:HiddenField ID="HfNoticeID" runat="server" ClientIDMode="Static" />
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-8 mx-auto bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row justify-content-center">
                                <h2 class="mb-4 justify-content-center">BACHECA ANNUNCI</h2>
                            </div>
                            <hr class="text-primary mb-4" />
                            <div class="row pl-5 pr-5">
                                <div class="col-2">
                                    <button id="BtnAdd" class="btn btn-success btn-block btn-lg">+ ADD NOTICE</button>
                                </div>
                                <div class="col-6 ml-auto">
                                    <div class="mb-4">
                                        <asp:TextBox runat="server" ID="TxtSearch" ClientIDMode="Static" PlaceHolder="Search..." CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center pl-5 pr-5">
                                <table class="table table-bordered table-striped text-center" id="notice-table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No</th>
                                            <th>Notice</th>
                                            <th>Azione</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="myModal" data-backdrop="static">
                        <div class="modal-dialog modal-lg">
                            <div class="ribbon modal-ribbon"><span>NEW</span></div>
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header pl-5">
                                    <h2 class="modal-title">ADD NOTICE</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:ScriptManager runat="server" ID="ScriptManagerForModal"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForModal" ClientIDMode="Static">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left text-danger bg-gradient" ClientIDMode="Static" />
                                            <asp:RequiredFieldValidator ID="ReqValTitle" runat="server" ErrorMessage="Inserire un indirizzo Title." CssClass="text-bg-danger" ControlToValidate="TxtTitle" Display="None"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="ReqValContact" runat="server" ErrorMessage="Inserire una Contact." CssClass="text-black" ControlToValidate="TxtContact" Display="None"></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="ServerValidator1" runat="server" ErrorMessage="Inserire una User." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Save Failed" Display="None"></asp:CustomValidator>
                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtTitle" ClientIDMode="Static" placeholder="Title" CssClass="form-control form-control-lg" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>

                                            <div class="row mb-4" style="padding-left: 15px;">
                                                <div class="col-6 form-control pt-0 pb-0 pr-0 form-control-lg ComboUser">
                                                    <asp:DropDownList runat="server" ID="ComboUser" CssClass="custom-select" ClientIDMode="Static" Style="height: 52px;"></asp:DropDownList>
                                                </div>

                                                <div class="col-6 custom-control custom-switch text-center" style="padding-top: 10px;">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="switch1" clientidmode="static">
                                                    <label class="custom-control-label" for="switch1">Allow Notice</label>
                                                </div>
                                            </div>

                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtMessage" ClientIDMode="Static" placeholder="Message" CssClass="form-control form-control-lg" TextMode="MultiLine" Rows="4" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-6 form-white">
                                                    <asp:TextBox runat="server" ID="TxtStartDate" ClientIDMode="Static" PlaceHolder="Start Date/Time" CssClass="form-control form-control-lg" style="height: 50px;"></asp:TextBox>
                                                </div>

                                                <div class="col-6 form-white">
                                                    <asp:TextBox runat="server" ID="TxtEndDate" ClientIDMode="Static" PlaceHolder="End Date/Time" CssClass="form-control form-control-lg" style="height: 50px;"></asp:TextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="form-white">
                                                <asp:TextBox runat="server" ID="TxtContact" ClientIDMode="Static" placeholder="Contact Info" CssClass="form-control form-control-lg" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSaveNotice" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnUpdateNotice" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer p-lg-5">
                                    <asp:Button runat="server" ID="BtnSaveNotice" ClientIDMode="Static" CssClass="btn btn-lg btn-success" Text="Save" OnClick="BtnSaveNotice_Click" />
                                    <asp:Button runat="server" ID="BtnUpdateNotice" ClientIDMode="Static" CssClass="btn btn-lg btn-primary d-none" Text="Update" OnClick="BtnUpdateNotice_Click" />
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
    <script src="Scripts/gijgo.min.js"></script>
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedHandler);

        function pageLoadedHandler(sender, args) {
            // This function will be called after each UpdatePanel postback
            var updatedPanels = args.get_panelsUpdated();

            for (var i = 0; i < updatedPanels.length; i++) {
                var updatePanelID = updatedPanels[i].id;

                if (updatePanelID === "UpdatePanelForModal") {
                    SelectSetting();
                }
            }
        };
    </script>
    <script>
        SelectSetting();
        function SelectSetting() {
            $("#ComboUser").select2({ theme: 'bootstrap' });
        }
        
        $("#TxtStartDate").datetimepicker({
            uiLibrary: 'bootstrap4',
            modal: false,
            footer: true,
            format: "dd/mm/yyyy HH:MM"
        });

        $("#TxtEndDate").datetimepicker({
            uiLibrary: 'bootstrap4',
            modal: false,
            footer: true,
            format: "dd/mm/yyyy HH:MM"
        });

        $("#BtnAdd").click(function () {
            $(".modal-ribbon").removeClass("red");
            $(".modal-ribbon").removeClass("blue");
            $(".modal-ribbon").html("<span>NEW</span>");
            $(".modal-title").text("ADD NOTICE");
            $("#TxtTitle").val("");
            $("#TxtMessage").val("");
            $("#TxtContact").val("");
            $("#TxtStartDate").val("");
            $("#TxtEndDate").val("");
            $("#ComboUser").val(0).trigger("change");
            $(".ComboUser").removeClass("disabled");
            $("#switch1").prop("checked", false);
            $("#ValSummary").addClass("d-none");
            $("#BtnSaveNotice").removeClass('d-none');
            $("#BtnUpdateNotice").addClass('d-none');
            $("#myModal").modal('show');
            return false;
        });
        $("#BtnClose").click(function () {
            $("#myModal").modal('hide');
            return false;
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var datatable = $('#notice-table').dataTable({
                "serverSide": true,
                "ajax": 'DataService.asmx/FindAdminNotices',
                "dom": '<"table-responsive"t>pr',
                "autoWidth": false,
                "pageLength": 10,
                "processing": true,
                "ordering": false,
                "columns": [{
                    "render": function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                }, {
                    "width": "80%",
                    "render": function (data, type, row, meta) {
                        var allowed = row.Allowed;
                        if (allowed) {
                            var ribbon = '<div class="ribbon blue"><span>ALLOWED</span></div>';
                            var badge = 'badge-primary';
                        }
                        else {
                            var ribbon = '<div class="ribbon red"><span>UNALLOWED</span></div>';
                            var badge = 'badge-danger';
                        }
                        return '<div class="mb-4 noticeDiv">' + 
                                    '<div class="p-4 box notice bg-transparent" style="width: 100%;">' + 
                                        ribbon +
                                        '<div class="d-flex pl-3 pr-3">' + 
                                            '<image src="Upload/Photos/user-default.jpg" style="height:60px;width:60px;border-radius:30px;"></image>' + 
                                            '<h2 class="mx-auto">' + row.Title + '</h2>' + 
                                        '</div>' + 
                                        '<p class="text-left p-3 mb-0">' + row.Message + 
                                        '</p>' + 
                                        '<span class="badge badge-pill ' + badge + '" style="float:right;font-size:15px;">' + row.Username + ', ' + row.From + ' - ' + row.To + '</span>' + 
                                    '</div>' + 
                                '</div> ';
                    }
                }, {
                    "render": function (data, type, row, meta) {
                        return '<a href="#" class="btn-delete mr-4"><i class="fa fa-trash" style="font-size:25px"></i></a>' + '<a href="#" class="btn-edit"><i class="fa fa-edit" style="font-size:25px"></i></a>';
                    }
                }],

                "fnServerParams": function (aoData) {
                    aoData.searchVal = $('#TxtSearch').val();
                },

                "rowCallback": function (row, data, index) {
                    $(row).find('td').css({ 'vertical-align': 'middle', 'padding': 0 });
                    $("#notice-table_wrapper").css('width', '100%');
                }
            });
            
            $('#TxtSearch').on('input', function () {
                datatable.fnDraw();
            });

            datatable.on('click', '.btn-edit', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));
                var allowed = row.Allowed;
                var badgeInfo = row.From + ' - ' + row.To;
                if (allowed) {
                    $(".modal-ribbon").removeClass("red");
                    $(".modal-ribbon").addClass("blue").html("<span>ALLOWED</span>");
                }
                else {
                    $(".modal-ribbon").removeClass("blue");
                    $(".modal-ribbon").addClass("red").html("<span>UNALLOWED</span>");
                }

                $("#myModal").modal('show');
                $("#BtnSaveNotice").addClass('d-none');
                $("#BtnUpdateNotice").removeClass('d-none');
                $("#TxtTitle").val(row.Title);
                $("#TxtMessage").val(row.Message);
                $("#TxtContact").val(row.Contact);
                $("#TxtStartDate").val(row.From);
                $("#TxtEndDate").val(row.To);
                $("#ComboUser").val(row.UserId).trigger("change");
                $(".ComboUser").addClass("disabled");
                $("#switch1").prop("checked", row.Allowed);
                $("#ValSummary").addClass("d-none");
                $(".modal-title").text("UPDATE NOTICE");

                $("#HfNoticeID").val(row.Id);
            });

            datatable.on('click', '.btn-delete', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                if (!confirm("Click OK per cancellare."))
                    return;

                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/AdminDeleteNotice',
                    data: {
                        id: row.Id
                    },
                    success: function () {
                        onSuccess({ success: true });
                    }
                }).error(function () {
                    onSuccess({ success: false });
                });
            });

            var onSuccess = function (data) {
                if (data.success) {

                    datatable.fnDraw();

                } else {
                    alert("Failed!");
                }
            };
        })
    </script>
</asp:Content>
