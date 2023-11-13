<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminModelSubscriptions.aspx.cs" Inherits="TALENTS.AdminModelSubscriptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <link rel="stylesheet" href="Content/CSS/gijgo.min.css" />
     <style>
        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
        }

        #select2-ComboUser-container {
            text-align: center;
            font-size: 1.25rem;
            font-family: Dosis;
        }

        #select2-ComboType-container {
            text-align: center;
            font-size: 1.25rem;
            font-family: Dosis;
        }

        .disabled {
            pointer-events: none;
            opacity: 0.5;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfSubID" runat="server" ClientIDMode="Static" />
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-8 mx-auto bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row justify-content-center">
                                <h2 class="mb-4 justify-content-center">ABBONAMENTI MODELLE</h2>
                            </div>
                            <hr class="text-primary mb-4" />
                            <div class="row pl-5 pr-5">
                                <div class="col-4">
                                    <button id="BtnAdd" class="btn btn-success btn-block btn-lg">+ Agg. ABBONAMENTO</button>
                                </div>
                                <div class="col-6 ml-auto">
                                    <div class="mb-4">
                                        <asp:TextBox runat="server" ID="TxtSearch" ClientIDMode="Static" PlaceHolder="Cerca..." CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center pl-5 pr-5">
                                <table class="table table-bordered table-striped text-center" id="subscription-table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No</th>
                                            <th>Modella</th>
                                            <th>Tipo</th>
                                            <th>Importo</th>
                                            <th>Dal</th>
                                            <th>Al</th>
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
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header pl-5">
                                    <h2 class="modal-title">AGG. ABBONAMENTO</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:ScriptManager runat="server" ID="ScriptManagerForModal"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForModal" ClientIDMode="Static">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left text-danger bg-gradient" ClientIDMode="Static" />
                                            <asp:CustomValidator ID="ServerValidator1" runat="server" ErrorMessage="Inserire una Model." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator2" runat="server" ErrorMessage="Inserire un Periodo." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Save Fallito" Display="None"></asp:CustomValidator>

                                            <div class="row mb-4" style="padding-left: 15px;padding-right: 15px;">
                                                <div class="col-12 form-control pt-0 pb-0 pr-0 form-control-lg ComboUser">
                                                    <asp:DropDownList runat="server" ID="ComboUser" CssClass="custom-select" ClientIDMode="Static" Style="height: 52px;"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="row mb-4" style="padding-left: 15px;padding-right: 15px;">
                                                <div class="col-12 form-control pt-0 pb-0 pr-0 form-control-lg ComboType">
                                                    <asp:DropDownList runat="server" ID="ComboType" CssClass="custom-select" ClientIDMode="Static" Style="height: 52px;"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSaveSubscription" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnUpdateSubscription" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer p-lg-5">
                                    <asp:Button runat="server" ID="BtnSaveSubscription" ClientIDMode="Static" CssClass="btn btn-lg btn-success" Text="Salva" OnClick="BtnSaveSubscription_Click" />
                                    <asp:Button runat="server" ID="BtnUpdateSubscription" ClientIDMode="Static" CssClass="btn btn-lg btn-primary d-none" Text="Aggiorna" OnClick="BtnUpdateSubscription_Click" />
                                    <asp:Button runat="server" ID="BtnClose" ClientIDMode="Static" Text="Chiudi" CssClass="btn btn-lg btn-dark"/>
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
            $("#ComboType").select2({ theme: 'bootstrap' });
        }
        
        $("#BtnAdd").click(function () {
            
            $(".modal-title").text("AGG. ABBONAMENTO");
            
            $("#ComboUser").val(0).trigger("change");
            $(".ComboUser").removeClass("disabled");
            $("#ComboType").val(0).trigger("change");
            $(".ComboType").removeClass("disabled");
            $("#ValSummary").addClass("d-none");
            $("#BtnSaveSubscription").removeClass('d-none');
            $("#BtnUpdateSubscription").addClass('d-none');
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
            var datatable = $('#subscription-table').dataTable({
                "serverSide": true,
                "ajax": 'DataService.asmx/FindModelSubscriptions',
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
                    "data": "Model"
                }, {
                    "data": "Type"
                }, {
                    "data": "Amount"
                }, {
                    "data": "StartDate"
                }, {
                    "data": "EndDate"
                }, {
                    "render": function (data, type, row, meta) {
                        return '<a href="#" class="btn-delete mr-4"><i class="fa fa-trash" style="font-size:25px"></i></a>' + '<a href="#" class="btn-edit"><i class="fa fa-edit" style="font-size:25px"></i></a>';
                    }
                }],

                "fnServerParams": function (aoData) {
                    aoData.searchVal = $('#TxtSearch').val();
                },

                "rowCallback": function (row, data, index) {
                    $("#subscription-table_wrapper").css('width', '100%');
                }
            });
            
            $('#TxtSearch').on('input', function () {
                datatable.fnDraw();
            });

            datatable.on('click', '.btn-edit', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                $("#myModal").modal('show');
                $("#BtnSaveSubscription").addClass('d-none');
                $("#BtnUpdateSubscription").removeClass('d-none');
                $("#ComboUser").val(row.ModelId).trigger("change");
                $(".ComboUser").addClass("disabled");
                $("#ComboType").val(row.SubMId).trigger("change");
                $("#ValSummary").addClass("d-none");
                $(".modal-title").text("AGGIORNA ABBONAMENTO");

                $("#HfSubID").val(row.Id);
            });

            datatable.on('click', '.btn-delete', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                if (!confirm("Click OK per cancellare."))
                    return;

                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/AdminDeleteModelSubscription',
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
