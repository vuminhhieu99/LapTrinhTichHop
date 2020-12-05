//add class for slidebar
$('#GiaoVien').addClass('menu-open');
$('#GiaoVien>a').addClass('active');
//--------------//

var table = $("#example1").DataTable({
"paging": false,
    "lengthChange": false,
    "searching": false,
    "ordering": false,
    "info": false,
    "autoWidth": false,
    "responsive": true,
});

class GiaoVienJS {
    page;
    pagesize;
    search;
    idBoMon;
    pageTotal;
    constructor(page = 1, pagesize = 10, search = "", idBoMon = null) {
        this.page = page;
        this.pagesize = pagesize;
        this.search = search;
        this.idBoMon = idBoMon;

    }

    loadData() {
    table.clear().draw();
        $('.processing-example').addClass('spinner-border');
        var self = this;
        $.ajax({
    url: 'http://localhost:54555/api/GiaoVien/GetAllSearch',
            data: {pageNumber: this.page - 1, pageSize: this.pagesize, textSearch: this.search, idBoMon: this.idBoMon },
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {

            var counter = (self.page - 1) * self.pagesize + 1;
            $.each(data.items, function (index, item) {
                table.row.add([
                counter,
                item.Ma,
                item.Ten,
                item.IdBoMon == null ? "" : item.BoMon.Ten,
                item.DiaChi,
                item.NgaySinh == null ? "" : item.NgaySinh.substring(0, 10),
                item.Email,
                `<button type="button" class="btn btn-default edit" data-id="${item.Id}" data-idbomon="${item.IdBoMon == null ? "0" : item.IdBoMon}">
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

    loadBoMon(select, selectID = 0) {
    $(select).empty();
        $(select).append($('<option>', {
            value: "0",
            text: "--Loại bộ môn--"
        }));
        $.ajax({
            url: 'http://localhost:54555/api/BoMon/GetAllBoMon',
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

    getByID(id_Giaovien) {
    $.ajax({
        url: 'http://localhost:54555/api/GiaoVien/GetGiaoVienById',
        data: { idGiaoVien: id_Giaovien },
        dataType: 'json',
        method: 'GET'
    }).done(function (data) {
        $('#editModal input[name="Ma"]').val(data.Ma);
        $('#EditForm input[name="Ten"]').val(data.Ten);
        if (data.GioiTinh == true) {
            $('#EditForm input[name = "GioiTinh"][value="true').prop('checked', true);
        }
        else if (data.GioiTinh == false) {
            $('#EditForm input[name = "GioiTinh"][value="false').prop('checked', true);
        }

        $('#EditForm input[name="NgaySinh"]').val(data.NgaySinh == null ? "" : data.NgaySinh.substring(0, 10));
        $('#EditForm input[name="DiaChi"]').val(data.DiaChi);
        $('#EditForm input[name="DienThoai"]').val(data.DienThoai);
        $('#EditForm input[name="Email"]').val(data.Email);

        $('#EditGiaoVien').data('id', data.Id);
        var selectID = data.IdBoMon == null ? "0" : data.IdBoMon;
        giaovienJS.loadBoMon($('#EditForm select[name="IdBoMon"]'), selectID);
    });

    }

    // reponse after creat new Giaovien
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

    // reponse after edit Giaovien
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

    // reponse after delete GiaoVien
    DelSuccess(message) {
    //giaovienJS.pageTotal = giaovienJS.pageTotal - 1;
    //if ((giaovienJS.page - 1) * 10 + 1 > giaovienJS.pageTotal) {
    //    giaovienJS.page -= 1;
    //}
    giaovienJS.loadData();

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

    CheckTenGV(obj) {
        if ($(obj).val() == "") {
    $(obj).parent().append('<small class="text-danger float-right">Vui lòng điền thông tin !</small>')
            setTimeout(function () {
    $(obj).parent().find('.text-danger').remove();
            }, 3000);
            return false;
        }
        return true;
    }

    CheckBoMon(obj) {
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

var giaovienJS = new GiaoVienJS();
giaovienJS.loadData();
giaovienJS.loadBoMon($('select[name="BoMon"]'));
//----------------//

//select page
$(".pagination").delegate(".page-number a", "click", function () {
    var page = $(this).text();

    giaovienJS.page = page;
    giaovienJS.loadData();
});

// pagesize updade change
$('select[name="example1_length"]').change(function () {
    giaovienJS.pagesize = $(this).val();
    // redefaul page =1
    giaovienJS.page = 1;
    giaovienJS.loadData();
});

// searching change set giaovienJS

$('input[name="searching"]').on("change", function () {
    var search = $(this).val().toString();
    giaovienJS.search = search;
    giaovienJS.page = 1;
    giaovienJS.loadData();
})

// searching change set giaovienJS

$('select[name="BoMon"]').on("change", function () {
    var idBoMon = $(this).val().toString();
    if (idBoMon == "0") {
    idBoMon = null;
    }
    giaovienJS.idBoMon = idBoMon;
    giaovienJS.page = 1;
    giaovienJS.loadData();
})

// searching change set giaovienJS


$(".pagination").delegate(".next a", "click", function () {
    giaovienJS.page = parseInt(giaovienJS.page) + 1;
    giaovienJS.loadData();
});

$(".pagination").delegate(".previous a", "click", function () {
    giaovienJS.page = parseInt(giaovienJS.page) - 1;
    giaovienJS.loadData();
});

//delete
$("table").delegate(".delete", "click", function (event) {
    event.stopPropagation();
    var id_Giaovien = $(this).data('id').toString();
    $('#confirmDel').data('id', id_Giaovien);
    $('#confirmDeleteModal').modal('show');
    return false;
});

$('#confirmDel').click(function () {
    $('#confirmDeleteModal').modal('hide');
    var id_Giaovien = $(this).data('id').toString();

    $.ajax({
    url: 'http://localhost:54555/api/GiaoVien/XoaGiaoVien?Id=' + id_Giaovien,
        method: "DELETE",
        dataType: 'json',
        contentType: 'application/json'
    }).done(function (data) {
        if (data.status == true) {
    giaovienJS.DelSuccess(data.message);
        }
        else {
    alert("Lỗi! không thể xóa")
}

    }).fail(function () {
    alert("Lỗi! không thể xóa")
});
});
//----------//

//create giaovien
// reload select of loai de tai
// reset then open modal create Thanh Vien
$('#bt_createGiaoVien').click(function () {
    document.getElementById("createForm").reset();
    giaovienJS.loadBoMon($('#createForm select[name="IdBoMon"]'));
});
//----------------//

$('#CreateGiaoVien').click(function () {
    event.preventDefault();
    var model = { };
    var checkTen = giaovienJS.CheckTenGV($('#createForm input[name="Ten"]'));
    if (!checkTen) {
        return;
    }
    model.Ten = $('#createForm input[name="Ten"]').val();
    var checkLoai = giaovienJS.CheckBoMon($('#createForm select[name="IdBoMon"]'));
    if (!checkLoai) {
        return;
    }
    model.IdBoMon = $('#createForm select[name="IdBoMon"]').val();
    model.GioiTinh = $('#createForm input[name="GioiTinh"]:checked').val();
    model.NgaySinh = $('#createForm input[name="NgaySinh"]').val();
    model.DiaChi = $('#createForm input[name="DiaChi"]').val();
    model.DienThoai = $('#createForm input[name="DienThoai"]').val();
    model.Email = $('#createForm input[name="Email"]').val();

    $.ajax({
    url: 'http://localhost:54555/api/GiaoVien/ThemGiaoVien',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'POST',
        contentType: 'application/json'
    }).done(function (data) {
    giaovienJS.AddSuccess(data);
        $('#createModal').modal('hide');
    }).fail(function (data) {
    // to do
    giaovienJS.AddFail(data);
    });
    giaovienJS.AddSuccess("Tạo mới Thành công");
});
//--create giaovien

//edit giaovien
// reload select of loai de tai
$("table").on("click", ".edit", function (event) {
    event.stopPropagation();
    var id_Giaovien = $(this).data('id').toString();
    giaovienJS.getByID(id_Giaovien);
    $('#editModal').modal('show');
});

$('#EditGiaoVien').click(function () {
    event.preventDefault();
    var model = { };
    model.Id = $(this).data('id');
    model.Ma = $('#editModal input[name="Ma"]').val();
    var checkTen = giaovienJS.CheckTenGV($('#editModal input[name="Ten"]'));
    if (!checkTen) {
        return;
    }
    model.Ten = $('#editModal input[name="Ten"]').val();
    var checkLoai = giaovienJS.CheckBoMon($('#editModal select[name="IdBoMon"]'));
    if (!checkLoai) {
        return;
    }
    model.IdBoMon = $('#editModal select[name="IdBoMon"]').val();
    model.GioiTinh = $('#editModal input[name="GioiTinh"]:checked').val();
    model.NgaySinh = $('#editModal input[name="NgaySinh"]').val();
    model.DiaChi = $('#editModal input[name="DiaChi"]').val();
    model.DienThoai = $('#editModal input[name="DienThoai"]').val();
    model.Email = $('#editModal input[name="Email"]').val();

    $.ajax({
    url: 'http://localhost:54555/api/GiaoVien/SuaGiaoVien',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'PUT',
        contentType: 'application/json'
    }).done(function (data) {
    giaovienJS.EditSuccess(data);
        $('#editModal').modal('hide');
    }).fail(function (data) {
    // to do
    giaovienJS.AddFail(data);
    });
});
//--edit giaovien

//select page
$('tbody').delegate("td", "click", function () {
    var child = $(this).find('.edit');
    if (child.length == 0) {
        var id = $(this).parent().find('.edit').data('id').toString();
        window.location.href = "/GiaoVien/BaiBaoKhoaHoc?id=" + id;
    }
    return true;
});
