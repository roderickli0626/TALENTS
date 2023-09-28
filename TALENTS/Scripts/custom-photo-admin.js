$(function () {
    var datatable = $('#photo-table').dataTable({
        "serverSide": true,
        "ajax": 'DataService.asmx/AdminFindPhotos',
        "dom": '<"table-responsive"t>',
        "autoWidth": false,
        "pageLength": 20,
        "processing": true,
        "ordering": false,
        "columns": [{
            "render": function (data, type, row, meta) {
                var photoContentDetail = "";
                var images = row.Images;
                var num = 1;
                images.forEach(function (image) {
                    var html = '<div class="preview-image preview-show-' + num + '">' +
                        '<div class="image-cancel" data-no="' + num + '" data-id="' + image.ImageId + '">x</div>' +
                        '<div class="image-zone"><img id="pro-img-' + num + '" src="Upload/Photos/' + image.ImageName + '"></div>' +
                        '</div>';

                    photoContentDetail += html;
                    num = num + 1;
                })

                var photoContent = '<div class="card" style="border-left:3px solid lightgreen;">\
                                                <div class="card-header" >\
                                                    <a class="card-link" style="font-size:20px;" data-toggle="collapse" href="#collapse' + row.Id + '">\
                                                        ' + row.Title + '\
                                                    </a>\
                                                    <span class="badge badge-dark float-end">' + row.Length + ' photos</span>\
                                                </div >\
                                                <div id="collapse' + row.Id + '" class="collapse show" data-parent="">\
                                                    <div class="card-body">' +
                    '<div class="container">\
                                                            <fieldset class="form-group text-center">\
                                                                <button class="btnUpload btn btn-success"><i class="fa fa-upload"></i> Upload Photo</button>\
                                                                <input type="file" class="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>\
                                                            </fieldset>\
                                                            <div class="preview-images-zone">' +
                    photoContentDetail
                    + '</div>\
                                                        </div >\
                                                    </div>\
                                                </div>\
                                            </div>';
                return photoContent;
            }
        }],

        "fnServerParams": function (aoData) {
            aoData.modelId = $('#HfModelID').val();
        }
    });

    datatable.on('change', '.pro-image', readImage);
    function readImage() {
        if (window.File && window.FileList && window.FileReader) {
            var data = new FormData(); // To Save Photo to DB
            var files = event.target.files; //FileList object
            var output = $(this).parent().next();
            var groupId = datatable.fnGetData($(this).closest('tr')).Id;
            data.append('groupId', groupId); // To Save Photo to DB
            data.append('modelId', $('#HfModelID').val());
            var num = output[0].childElementCount;
            for (let i = 0; i < files.length; i++) {
                var file = files[i];
                if (!file.type.match('image')) continue;
                data.append('files', file); // To Save Photo to DB

                var picReader = new FileReader();

                picReader.addEventListener('load', function (event) {
                    var picFile = event.target;
                    var html = '<div class="preview-image preview-show-' + num + '">' +
                        '<div class="image-cancel" data-no="' + num + '">x</div>' +
                        '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>' +
                        '</div>';

                    output.append(html);
                    num = num + 1;
                });

                picReader.readAsDataURL(file);
            }

            // TODO Save Image to DB
            $.ajax({
                type: "POST",
                url: 'DataService.asmx/AdminSavePhoto',
                data: data,
                contentType: false,
                //contentType: 'multipart/form-data',
                processData: false,
                success: function () {
                    onSuccess({ success: true });
                },
                error: function () {
                    onSuccess({ success: false });
                }
            });
            ///////

            $("#pro-image").val('');
            return false;
        } else {
            console.log('Browser not support');
            return false;
        }
    }

    datatable.on('click', '.btnUpload', function (e) {
        $(this).next().click();
        return false;
    });

    datatable.on('click', '.image-cancel', function (e) {
        if (!confirm("Click OK per cancellare.")) return;
        $(this).parent().remove();

        // TODO: Remove from DB. Need Ajax request
        var imageId = $(this).data('id');
        $.ajax({
            type: "POST",
            url: 'DataService.asmx/AdminDeletePhoto',
            data: {
                id: imageId
            },
            success: function () {
                onSuccess({ success: true });
            },
            error: function () {
                onSuccess({ success: false });
            }
        });
    });

    var onSuccess = function (data) {
        if (data.success) {
            datatable.fnDraw();
        } else {
            alert("Failed!");
        }
    };
});