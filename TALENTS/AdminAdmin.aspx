<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminAdmin.aspx.cs" Inherits="TALENTS.AdminAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <link rel="stylesheet" href="Content/CSS/core.min.css" type="text/css">
    <style>
        
        h2 {
            font-size: 28px;
            margin: 0px;
        }

        .main-menu ul {
            margin: 0px;
        }

        #v-pills-tab a {
            background-color: gray;
            font-size: 20px;
        }

        .custom-control-input:checked~.custom-control-label::before {
            border-color: #14a44d;
            background-color: #14a44d;
        }

        td {
            vertical-align: middle !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 110px; background-color: white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfAdminID" runat="server" ClientIDMode="Static" />
                    <div class="row" style="background-color: gray">
                        <div class="col-12 bg-gray text-center">
                            <div class="d-flex justify-content-center">
                                <div class="bg-white m-lg-5 p-lg-5" style="border-radius: 5px;" id="v-pills-language" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <div class="row justify-content-center">
                                        <h2 class="mb-4">ADMINS</h2>
                                    </div>
                                    <hr class="text-primary mb-4" />
                                    <div class="row" style="width: 1000px;">
                                        <div class="col-3">
                                            <button id="BtnAdd" class="btn btn-success btn-block btn-lg" data-toggle="modal" data-target="#myModal">+ ADD ADMIN</button>
                                        </div>
                                        <div class="offset-5 col-4">
                                            <div class="mb-4">
                                                <asp:TextBox runat="server" ID="TxtSearch" ClientIDMode="Static" PlaceHolder="Search..." CssClass="form-control form-control-lg"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 1000px;">
                                        <table class="table table-bordered table-striped text-center" id="admin-table">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>No</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>State</th>
                                                    <th>Azione</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content text-white" style="background-color: #353535;">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h2 class="modal-title">ADD ADMIN</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:ScriptManager ID="ScriptManagerUser" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelUser" ClientIDMode="Static">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left bg-gradient" ClientIDMode="Static" />
                                            <asp:RequiredFieldValidator ID="ReqValEmail" runat="server" ErrorMessage="Inserire un indirizzo Email." CssClass="text-bg-danger" ControlToValidate="TxtEmail" Display="None"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="ReqValPassword" runat="server" ErrorMessage="Inserire una Password." CssClass="text-black" ControlToValidate="TxtPassword" Display="None"></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="PasswordValidator" runat="server" ErrorMessage="Le Password non corrispondono." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="Email non è corretta." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Questo indirizzo Email è già registrato." Display="None"></asp:CustomValidator>
                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtUsername" ClientIDMode="Static" placeholder="Name" CssClass="form-control form-control-lg" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>

                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtEmail" ClientIDMode="Static" placeholder="Email" CssClass="form-control form-control-lg" TextMode="Email" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>

                                            <div class="form-white mb-4">
                                                <asp:TextBox runat="server" ID="TxtPassword" ClientIDMode="Static" placeholder="Password" CssClass="form-control form-control-lg" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>

                                            <div class="form-white">
                                                <asp:TextBox runat="server" ID="TxtPasswordRepeat" ClientIDMode="Static" placeholder="Repeat Password" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSaveAdmin" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnUpdateAdmin" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <asp:Button runat="server" ID="BtnSaveAdmin" ClientIDMode="Static" CssClass="btn btn-lg btn-success" Text="Save" OnClick="BtnSaveAdmin_Click" />
                                    <asp:Button runat="server" ID="BtnUpdateAdmin" ClientIDMode="Static" CssClass="btn btn-lg btn-success d-none" Text="Update" OnClick="BtnUpdateAdmin_Click"/>
                                    <asp:Button runat="server" ID="BtnClose" ClientIDMode="Static" Text="Close" CssClass="btn btn-lg btn-white"/>
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
    <script src="Scripts/core.min.js"></script>
    <script src="Scripts/jquery.dataTables.js"></script>
    <script src="Scripts/datatables.js"></script>
    <script>
        $("#BtnAdd").click(function () {
            $("#myModal").modal('show');
            return false;
        });
        $("#BtnClose").click(function () {

            $("#BtnSaveAdmin").removeClass('d-none');
            $("#BtnUpdateAdmin").addClass('d-none');
            $("#TxtUsername").val("");
            $("#TxtEmail").val("");
            $("#TxtPassword").val("");
            $("#TxtPasswordRepeat").val("");
            $(".modal-title").text("ADD ADMIN");

            $("#myModal").modal('hide');
            return false;
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var datatable = $('#admin-table').dataTable({
                "serverSide": true,
                "ajax": 'DataService.asmx/FindAdmins',
                "dom": '<"table-responsive"t>pr',
                "autoWidth": false,
                "pageLength": 20,
                "processing": true,
                "ordering": false,
                "columns": [{
                    "data": "Id",
                    "render": function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                }, {
                    "data": "Name",
                }, {
                    "data": "Email",
                }, {
                    /*"data": "State",*/
                    "render": function (data, type, row, meta) {
                        return "";
                    }
                }, {
                    "data": null,
                    "render": function (data, type, row, meta) {
                        return '<a href="#" class="btn-delete me-4"><i class="fa fa-trash" style="font-size:25px"></i></a>' + '<a href="#" class="btn-edit"><i class="fa fa-edit" style="font-size:25px"></i></a>';
                    }
                }],

                "fnServerParams": function (aoData) {
                    aoData.searchVal = $('#TxtSearch').val();
                }
            });

            $('#TxtSearch').on('input', function () {
                datatable.fnDraw();
            });

            datatable.on('click', '.btn-edit', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                $("#myModal").modal('show');
                $("#BtnSaveAdmin").addClass('d-none');
                $("#BtnUpdateAdmin").removeClass('d-none');

                $("#TxtUsername").val(row.Name);
                $("#TxtEmail").val(row.Email);
                $(".modal-title").text("UPDATE ADMIN");

                $("#HfAdminID").val(row.Id);
            });

            datatable.on('click', '.btn-delete', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                if (!confirm("Click OK per cancellare."))
                    return;

                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/AdminDeleteAdmin',
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
