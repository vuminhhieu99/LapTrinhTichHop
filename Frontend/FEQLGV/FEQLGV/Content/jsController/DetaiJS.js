//add class for slidebar
$('#DeTai').addClass('menu-open');
$('#DeTai>a').addClass('active');
//--------------//
var table = $("#example1").DataTable({
    "paging": false,
    "lengthChange": false,
    "searching": false,
    "ordering": false,
    "info": false,
    "autoWidth": false,
    "responsive": true
});

class DetaiJS {

    page;
    pagesize;
    search;
    nam;
    ki;
    pageTotal;
    constructor(page = 1, pagesize = 10, search = "", nam = "", ki = null) {
        this.page = page;
        this.pagesize = pagesize;
        this.search = search;
        this.nam = nam;
        this.ki = ki;
    }

    loadData() {
        table.clear().draw();
        $('.processing-example').addClass('spinner-border');
        var self = this;
        $.ajax({
            url: 'http://localhost:54555/api/DeTai/GetAllSearch',
            data: { pageNumber: this.page - 1, pageSize: this.pagesize, textSearch: this.search, nam: this.nam, ki: this.ki },
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {

            var counter = (self.page - 1) * self.pagesize + 1;
            $.each(data.items, function (index, item) {
                table.row.add([
                    counter,
                    item.Ma,
                    item.Ten,
                    item.LoaiDeTai == null ? "" : item.LoaiDeTai.Ten,
                    item.CoQuanQuanLy,
                    item.SoThanhVien,
                    item.NamHoc,
                    item.KiHoc,
                    `<button type="button" class="btn btn-default edit" data-id="${item.Id}" data-idloaddt="${item.LoaiDeTai == null ? "0" : item.LoaiDeTai.Id}">
                                            <i class="fas fa-pen"></i> </button>
                                    <button type="button" class="btn btn-default delete" data-id="${item.Id}">
                                           <i class="fas fa-trash"></i> </button>`,

                ]).draw(false);
                counter++;
            });
            self.pageTotal = data.totals;


            //render Paging
            this.fnRenderPaging = function () {
                var pageCount = Math.floor(self.pageTotal / self.pagesize);
                // trang cuối là lẻ pagesize
                if (self.pageTotal % self.pagesize != 0) {
                    pageCount += 1;
                }
                var count = 1;
                $('.pagination').empty();
                $('.pagination').append('<li class="paginate_button page-item previous" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>')
                while (count <= pageCount) {
                    if (count == self.page) {
                        $('.pagination').append(`<li class="paginate_button page-item page-number active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">${count}</a></li>`)
                        if (count == 1) {
                            $('.previous').addClass('disabled');
                        }

                    }
                    else {
                        $('.pagination').append(`<li class="paginate_button page-item page-number"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">${count}</a></li>`)
                    }
                    count++;
                }
                $('.pagination').append('<li class="paginate_button page-item next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>')
                if (parseInt($('.active a').text()) == pageCount) {
                    $('.next').addClass('disabled');
                }
                $('.countItem').text(self.pageTotal);
                var startItemofPage = (self.page - 1) * self.pagesize + 1;
                if (startItemofPage > self.pageTotal) {
                    startItemofPage = self.pageTotal;
                }
                var endItemofPage = self.page * self.pagesize;
                if (endItemofPage > self.pageTotal) {
                    endItemofPage = self.pageTotal;
                }
                $('.startItemofPage').text(startItemofPage.toString())
                $('.endItemofPage').text(endItemofPage.toString())
            }
            this.fnRenderPaging();

            $('.processing-example').removeClass('spinner-border');
        });
    }

    loadLoaiDT(select, selectID = 0) {
        $(select).empty();
        $(select).append($('<option>', {
            value: "0",
            text: "--Loại đề tài--"
        }));
        $.ajax({
            url: 'http://localhost:54555/api/DeTai/GetLoaiDT',
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {
            $.each(data, function (i, item) {
                $(select).append($('<option>', {
                    value: item.Id.toString(),
                    text: item.Ten.toString()
                }));
            });
            $(select).val(selectID);
        }).fail(function (data) {
            // to do
           
        });
    }

    getByID(id_Detai) {
        $.ajax({
            url: 'http://localhost:54555/api/DeTai/GetDeTaiById',
            data: { Id: id_Detai },
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {
            $('#edithModal input[name="Ma"]').val(data.Ma);
            $('#EditForm input[name="Ten"]').val(data.Ten);
            $('#EditForm input[name="CoQuanQuanLy"]').val(data.CoQuanQuanLy);
            $('#EditForm select[name="NamHoc"]').val(data.NamHoc);
            $('#EditForm select[name="KiHoc"]').val(data.KiHoc);

            $('#EditDeTai').data('id', data.Id);
            var selectID = data.LoaiDeTai == null ? "0" : data.IdLoaiDeTai;
            detaiJS.loadLoaiDT($('#EditForm select[name="IdLoaiDeTai"]'), selectID);
        });

    }

    // reponse after creat new Detai
    AddSuccess(data) {
        if (data.status == true) {

            toastr.success(data.message);

            var lastPage = Math.floor((this.pageTotal + 1) / this.pagesize);
            // trang cuối là lẻ pagesize
            if ((this.pageTotal + 1) % this.pagesize != 0) {
                lastPage += 1;
            }
            this.page = lastPage;
            this.search = "";
            this.nam = null;
            this.ki = null;
            this.loadData();
        }
        else {
            setTimeout(function () {
                $('.modal-body > .card-body').append(data.message);
            }, 3000);

        }
    }

    // reponse after edit Detai
    EditSuccess(data) {
        if (data.status == true) {

            toastr.success(data.message);

            this.loadData();
        }
        else {
            setTimeout(function () {
                $('.modal-body > .card-body').append(data.message);
            }, 3000);

        }
    };

    AddFail(data) {
        setTimeout(function () {
            $('.modal-body > .card-body').append("<p>! Lỗi hệ thống</p>");
        }, 3000);

    };
    //-------------//

    // reponse after delete DeTai
    DelSuccess(message) {
        //detaiJS.pageTotal = detaiJS.pageTotal - 1;
        //if ((detaiJS.page - 1) * 10 + 1 > detaiJS.pageTotal) {
        //    detaiJS.page -= 1;
        //}
        detaiJS.loadData();

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 10000
        });
        Toast.fire({
            icon: 'success',
            title: message
        })
    };

    CheckTenDT(obj) {
        if ($(obj).val() == "") {
            $(obj).parent().append('<small class="text-danger float-right">Vui lòng điền thông tin !</small>')
            setTimeout(function () {
                $(obj).parent().find('.text-danger').remove();
            }, 3000);
            return false;
        }
        return true;
    }

    CheckloaiDT(obj) {
        if ($(obj).val() == "0") {
            $(obj).parent().append('<small class="text-danger float-right">Vui lòng điền thông tin !</small>')
            setTimeout(function () {
                $(obj).parent().find('.text-danger').remove();
            }, 3000);
            return false;
        }
        return true;
    }
}

var detaiJS = new DetaiJS();
detaiJS.loadData();
//----------------//

//select page
$(".pagination").delegate(".page-number a", "click", function () {
    var page = $(this).text();

    detaiJS.page = page;
    detaiJS.loadData();
});

// pagesize updade change
$('select[name="example1_length"]').change(function () {
    detaiJS.pagesize = $(this).val();
    // redefaul page =1
    detaiJS.page = 1;
    detaiJS.loadData();
});

// searching change set detaiJS        

$('input[name="searching"]').on("change", function () {
    var search = $(this).val().toString();
    detaiJS.search = search;
    detaiJS.page = 1;
    detaiJS.loadData();
})

// searching change set detaiJS        

$('#searchNam').on("change", function () {
    var nam = $(this).val().toString();
    if (nam == "0") {
        nam = null;
    }
    detaiJS.nam = nam;
    detaiJS.page = 1;
    detaiJS.loadData();
})

// searching change set detaiJS        

$('#searchKi').on("change", function () {
    var ki = $(this).val().toString();
    if (ki == "0") {
        ki = null;
    }
    detaiJS.ki = ki;
    detaiJS.page = 1;
    detaiJS.loadData();
})

$(".pagination").delegate(".next a", "click", function () {
    detaiJS.page = parseInt(detaiJS.page) + 1;
    detaiJS.loadData();
});

$(".pagination").delegate(".previous a", "click", function () {
    detaiJS.page = parseInt(detaiJS.page) - 1;
    detaiJS.loadData();
});

//delete
$("table").delegate(".delete", "click", function (event) {
    event.stopPropagation();
    var id_Detai = $(this).data('id').toString();
    $('#confirmDel').data('id', id_Detai);
    $('#confirmDeleteModal').modal('show');
    return false;
});

$('#confirmDel').click(function () {
    $('#confirmDeleteModal').modal('hide');
    var id_Detail = $(this).data('id').toString();

    $.ajax({
        url: 'http://localhost:54555/api/DeTai/XoaDeTai?Id=' + id_Detail,
        method: "DELETE",
        dataType: 'json',
        contentType: 'application/json'
    }).done(function (data) {
        if (data.status == true) {
            detaiJS.DelSuccess(data.message);
        }
        else {
            alert("Lỗi! không thể xóa")
        }

    }).fail(function () {
        alert("Lỗi! không thể xóa")
    });
});
//----------//

//create detai
// reload select of loai de tai
// reset then open modal create Thanh Vien
$('#bt_createDeTai').click(function () {
    document.getElementById("createForm").reset();
    detaiJS.loadLoaiDT($('#createForm select[name="IdLoaiDeTai"]'));
});
//----------------//

$('#CreateDeTai').click(function () {
    event.preventDefault();
    var model = {};
    var checkTen = detaiJS.CheckTenDT($('#createForm input[name="Ten"]'));
    if (!checkTen) {
        return;
    }
    model.Ten = $('#createForm input[name="Ten"]').val();
    var checkLoai = detaiJS.CheckloaiDT($('#createForm select[name="IdLoaiDeTai"]'));
    if (!checkLoai) {
        return;
    }
    model.IdLoaiDeTai = $('#createForm select[name="IdLoaiDeTai"]').val();
    model.CoQuanQuanLy = $('#createForm input[name="CoQuanQuanLy"]').val();
    model.NamHoc = $('#createForm select[name="NamHoc"]').val();
    model.KiHoc = $('#createForm select[name="KiHoc"]').val();

    $.ajax({
        url: 'http://localhost:54555/api/DeTai/ThemDeTai',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'POST',
        contentType: 'application/json'
    }).done(function (data) {
        detaiJS.AddSuccess(data);
        $('#createModal').modal('hide');
    }).fail(function (data) {
        // to do
        detaiJS.AddFail(data);
    });
    detaiJS.AddSuccess("Tạo mới Thành công");
});
//--create detai

//edit detai
// reload select of loai de tai     
$("table").on("click", ".edit", function (event) {
    event.stopPropagation();
    var id_Detai = $(this).data('id').toString();
    detaiJS.getByID(id_Detai);
    $('#edithModal').modal('show');
});

$('#EditDeTai').click(function () {
    event.preventDefault();
    var model = {};
    model.Id = $(this).data('id');
    model.Ma = $('#edithModal input[name="Ma"]').val();
    model.Ten = $('#EditForm input[name="Ten"]').val();
    var checkTen = detaiJS.CheckTenDT($('#EditForm input[name="Ten"]'));
    if (!checkTen) {
        return;
    }
    var checkLoai = detaiJS.CheckloaiDT($('#EditForm select[name="IdLoaiDeTai"]'));
    if (!checkLoai) {
        return;
    }
    model.IdLoaiDeTai = $('#EditForm select[name="IdLoaiDeTai"]').val();
    model.CoQuanQuanLy = $('#EditForm input[name="CoQuanQuanLy"]').val();
    model.NamHoc = $('#EditForm select[name="NamHoc"]').val();
    model.KiHoc = $('#EditForm select[name="KiHoc"]').val();

    $.ajax({
        url: 'http://localhost:54555/api/DeTai/SuaDeTai',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'PUT',
        contentType: 'application/json'
    }).done(function (data) {
        detaiJS.EditSuccess(data);
        $('#edithModal').modal('hide');
    }).fail(function (data) {
        // to do
        detaiJS.AddFail(data);
    });
});
//--edit detai

//select page
$('tbody').delegate("td", "click", function () {
    var child = $(this).find('.edit');
    if (child.length == 0) {
        var id = $(this).parent().find('.edit').data('id').toString();
        window.location.href = "/DeTai/Detail?id=" + id;
    }
    return true;
});