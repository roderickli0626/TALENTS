<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminReview.aspx.cs" Inherits="TALENTS.AdminReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="Content/CSS/datatables.css" />
    <link rel="stylesheet" href="Content/CSS/gijgo.min.css" />
    <style>
        .starrating > input {
            display: none;
        }
        /* Remove radio buttons */

        .starrating > label:before {
            content: "\f005"; /* Star */
            margin: 2px;
            font-size: 1.5em;
            font-family: FontAwesome;
            display: inline-block;
        }

        .starrating > label {
            color: #222222; /* Start color when not clicked */
        }

        .starrating > input:checked ~ label {
            color: #ffca08;
        }
        /* Set yellow color when star checked */

        .starrating > input:hover ~ label {
            color: #ffca08;
        }
        /* Set yellow color when star hover */
    </style>
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

        #select2-ComboModel-container {
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
                    <asp:HiddenField ID="HfReviewID" runat="server" ClientIDMode="Static" />
                    <div class="row justify-content-center" style="background-color: gray">
                        <div class="col-8 mx-auto bg-white m-lg-5 p-lg-5" style="height: auto; border-radius: 5px">
                            <div class="row justify-content-center">
                                <h2 class="mb-4 justify-content-center">REVIEWS</h2>
                            </div>
                            <hr class="text-primary mb-4" />
                            <div class="row pl-5 pr-5">
                                <div class="col-2">
                                    <button id="BtnAdd" class="btn btn-success btn-block btn-lg">+ ADD REVIEW</button>
                                </div>
                                <div class="col-6 ml-auto">
                                    <div class="mb-4">
                                        <asp:TextBox runat="server" ID="TxtSearch" ClientIDMode="Static" PlaceHolder="Search..." CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center pl-5 pr-5">
                                <table class="table table-bordered table-striped text-center" id="review-table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No</th>
                                            <th>Model</th>
                                            <th>Content</th>
                                            <th>Date</th>
                                            <th>User</th>
                                            <th>Azione</th>
                                            <th class="d-none"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="ReviewBody">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header pl-5">
                                    <h2 class="modal-title">ADD REVIEW</h2>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body p-lg-5">
                                    <asp:HiddenField ID="HfRating" runat="server" ClientIDMode="Static" />
                                    <asp:ScriptManager runat="server" ID="ScriptManagerForModal"></asp:ScriptManager>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForModal" ClientIDMode="Static">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValSummary" runat="server" CssClass="mt-lg mb-lg text-left text-danger bg-gradient" ClientIDMode="Static" />
                                            <asp:CustomValidator ID="ServerValidator1" runat="server" ErrorMessage="Inserire una User." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator2" runat="server" ErrorMessage="Inserire una Model." Display="None"></asp:CustomValidator>
                                            <asp:CustomValidator ID="ServerValidator" runat="server" ErrorMessage="Save Failed" Display="None"></asp:CustomValidator>

                                            <div class="row mb-4" style="padding-left: 15px; padding-right: 15px;">
                                                <div class="col-5 form-control pt-0 pb-0 pr-0 form-control-lg ComboUser">
                                                    <asp:DropDownList runat="server" ID="ComboUser" CssClass="custom-select" ClientIDMode="Static" Style="height: 52px;"></asp:DropDownList>
                                                </div>

                                                <div class="col-5 col-offset-2 ml-auto form-control pt-0 pb-0 pr-0 form-control-lg ComboModel">
                                                    <asp:DropDownList runat="server" ID="ComboModel" CssClass="custom-select" ClientIDMode="Static" Style="height: 52px;"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-white mb-4 rating-div" style="font-size: 30px;">
                                                <div class="container">
                                                    <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star"></label>
                                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star"></label>
                                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star"></label>
                                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star"></label>
                                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-5 pr-0">
                                                    <asp:TextBox runat="server" ID="TxtPhone" ClientIDMode="Static" placeholder="Phone Number" CssClass="form-control form-control-lg"></asp:TextBox>
                                                </div>

                                                <div class="col-6 custom-control custom-switch text-center" style="padding-top: 10px;">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="switch1" clientidmode="static">
                                                    <label class="custom-control-label" for="switch1">Allow Review</label>
                                                </div>
                                            </div>

                                            <div class="form-white">
                                                <asp:TextBox runat="server" ID="TxtComment" ClientIDMode="Static" placeholder="Comment" CssClass="form-control form-control-lg" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                            
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSaveReview" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnUpdateReview" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer p-lg-5">
                                    <asp:Button runat="server" ID="BtnSaveReview" ClientIDMode="Static" CssClass="btn btn-lg btn-success" Text="Save" OnClientClick="SaveReview()" OnClick="BtnSaveReview_Click" />
                                    <asp:Button runat="server" ID="BtnUpdateReview" ClientIDMode="Static" CssClass="btn btn-lg btn-primary d-none" Text="Update" OnClick="BtnUpdateReview_Click" />
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
            $("#ComboModel").select2({ theme: 'bootstrap' });
        }
        
        $("#BtnAdd").click(function () {
            $(".modal-title").text("ADD REVIEW");
            $("#TxtPhone").val("");
            $("#TxtComment").val("");
            var rating = '<div class="container">' + 
                            '<div class="starrating risingstar d-flex justify-content-center flex-row-reverse">' + 
                                '<input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star" ></label>' + 
                                '<input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star" ></label>' +
                                '<input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star" ></label>' +
                                '<input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star" ></label>' +
                                '<input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star" ></label>' +
                            '</div >' +
                        '</div > ';
            $(".rating-div").html(rating);
            $("#ComboUser").val(0).trigger("change");
            $(".ComboUser").removeClass("disabled");
            $("#ComboModel").val(0).trigger("change");
            $(".ComboModel").removeClass("disabled");
            $("#switch1").prop("checked", false);
            $("#ValSummary").addClass("d-none");
            $("#BtnSaveReview").removeClass('d-none');
            $("#BtnUpdateReview").addClass('d-none');
            $("#myModal").modal('show');
            return false;
        });
        $("#BtnClose").click(function () {
            $("#myModal").modal('hide');
            return false;
        });
        function SaveReview() {
            var userID = $("#ComboUser").val();
            var ModelID = $("#ComboModel").val();
            // Check If there is already a review
            var reviews = $(".ReviewBody>tr>td");
            for (var i = 0; i < reviews.length; i++) {
                if (reviews[i].textContent == "UM" + userID + ModelID) {
                    alert("The user already left a review to the model.");
                    return false;
                }
            }
            ////////////
            $("#HfRating").val($("input[name='rating']:checked").val());
            return true;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            var datatable = $('#review-table').dataTable({
                "serverSide": true,
                "ajax": 'DataService.asmx/FindAdminReviews',
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
                    "data": "Model",
                }, {
                    "width": "60%",
                    "data": "Content",
                    "render": function (data, type, row, meta) {
                        var allowed = row.Allowed;
                        if (allowed) {
                            var badge = '<span class="badge badge-pill badge-primary" style="float:right;font-size:12px;">ALLOWED</span>'
                        }
                        else {
                            var badge = '<span class="badge badge-pill badge-danger" style="float:right;font-size:12px;">UNALLOWED</span>'
                        }
                        return data + '<div>' + row.Comment + '</div>' + badge;
                    }
                }, {
                    "data": "ReviewDate",
                }, {
                    "data": "User",
                }, {
                    "width": "10%",
                    "render": function (data, type, row, meta) {
                        return '<a href="#" class="btn-delete mr-4"><i class="fa fa-trash" style="font-size:25px"></i></a>' + '<a href="#" class="btn-edit"><i class="fa fa-edit" style="font-size:25px"></i></a>';
                    }
                }, {
                "class": "d-none",
                "render": function (data, type, row, meta) {
                    return "UM" + row.UserId + row.ModelId;
                }
                }],

                "fnServerParams": function (aoData) {
                    aoData.searchVal = $('#TxtSearch').val();
                },

                "rowCallback": function (row, data, index) {
                    $(row).find('td').css({ 'vertical-align': 'middle' });
                    $("#review-table_wrapper").css('width', '100%');
                }
            });
            
            $('#TxtSearch').on('input', function () {
                datatable.fnDraw();
            });

            datatable.on('click', '.btn-edit', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                $("#myModal").modal('show');
                $("#BtnSaveReview").addClass('d-none');
                $("#BtnUpdateReview").removeClass('d-none');
                $("#TxtPhone").val(row.Phone);
                $("#TxtComment").val(row.Comment);
                $(".rating-div").html(row.Content.replaceAll('"rating', 'rat'));
                $("#ComboUser").val(row.UserId).trigger("change");
                $(".ComboUser").addClass("disabled");
                $("#ComboModel").val(row.ModelId).trigger("change");
                $(".ComboModel").addClass("disabled");
                $("#switch1").prop("checked", row.Allowed);
                $("#ValSummary").addClass("d-none");
                $(".modal-title").text("UPDATE REVIEW");

                $("#HfReviewID").val(row.Id);
            });

            datatable.on('click', '.btn-delete', function (e) {
                e.preventDefault();

                var row = datatable.fnGetData($(this).closest('tr'));

                if (!confirm("Click OK per cancellare."))
                    return;

                $.ajax({
                    type: "POST",
                    url: 'DataService.asmx/AdminDeleteReview',
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
