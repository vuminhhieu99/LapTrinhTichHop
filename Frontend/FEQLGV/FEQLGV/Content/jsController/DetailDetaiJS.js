var table = $("#example1").DataTable({
    "paging": false,
    "lengthChange": false,
    "searching": false,
    "ordering": false,
    "info": false,
    "autoWidth": false,
    "responsive": true,

});
//----------------//

////Initialize Select2 Elements
$('.select2').select2()
////--------------//



//add class for slidebar
$('#DeTai').addClass('menu-open');
$('#DeTai>a').addClass('active');
//--------------//

//load data with change pagesize
$("#PageSize").change(function () {
    $("#form1").submit();
});
//-------------//

// set class css for ỉtemPage- because pagelist not compatial boostrap 4 in this version of adminLTE
$('.pagination a').addClass('page-link');
//-------------//

// reset then open modal create Product
$('#bt_createDeTai').click(function () {
    document.getElementById("createDeTai").reset();
});
//----------------//




class DetailDeTaiJS {
    idDetai;
    listThanhVien;
    total;
    constructor() {
        this.idDetai = $('#idDetai').text();
        this.listThanhVien = [];
    }
    loadDetai() {
        $.ajax({
            url: 'http://localhost:54555/api/DeTai/GetDeTaiById',
            data: { Id: this.idDetai },
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {
            $('.tenDeTai').text(data.Ten);
            $('.maDeTai').text(data.Ma);
        });

    }
    loadThanhVien() {
        table.clear().draw();
        $('.processing-example').addClass('spinner-border');
        var self = this;

        $.ajax({
            url: 'http://localhost:54555/api/GiaoVien/GetGiaoVienByDeTai',
            data: { id: this.idDetai },
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {

            var counter = 1;
            $.each(data, function (index, item) {
                var LaChutri = item.LaChuTri == null ? "" : item.LaChuTri;
                if (item.LaChuTri == 1) {
                    LaChutri = "Chủ trì";
                }
                if (item.LaChuTri == 0) {
                    LaChutri = "Thành viên";
                }
                table.row.add([
                    counter,
                    item.Ma,
                    item.Ten,
                    LaChutri,
                    `<button type="button" class="btn btn-default edit" data-idgvdt="${item.IdGVDT == null ? "0" : item.IdGVDT}" data-idgiaovien="${item.Id}" data-vaitro = "${item.LaChuTri == null ? "-1" : item.LaChuTri}">
                                                                <i class="fas fa-pen"></i> </button>
                                                        <button type="button" class="btn btn-default delete" data-id="${item.IdGVDT == null ? "0" : item.IdGVDT}">
                                                               <i class="fas fa-trash"></i> </button>`,

                ]).draw(false);
                self.listThanhVien.push(item.Id);
                counter++;
            });
            self.pageTotal = data == null ? "0" : data.length;
            $('.countItem').text(self.pageTotal);
            $('.processing-example').removeClass('spinner-border');
        });

    }
    loadSelectGiaoVien(select, selectID = 0) {
        $(select).empty();
        $(select).append($('<option>', {
            value: "0",
            text: "--Chọn giáo viên--"
        }));
        $.ajax({
            url: 'http://localhost:54555/api/GiaoVien/GetAllGiaoVien',
            dataType: 'json',
            method: 'GET'
        }).done(function (data) {
            $.each(data.items, function (i, item) {
                if (detailDeTaiJS.listThanhVien.indexOf(item.Id) == -1 || item.Id == selectID) {
                    $(select).append($('<option>', {
                        value: item.Id.toString(),
                        text: item.Ten.toString()
                    }));
                }

            });
            $(select).val(selectID);

        }).fail(function (data) {
            // to do
            detailDeTaiJS.DelSuccess(data);
        });
    }

    CheckGiaoVien(obj) {
        if ($(obj).val() == 0) {
            $(obj).parent().append('<small class="text-danger float-right">Vui lòng điền thông tin !</small>')
            setTimeout(function () {
                $(obj).parent().find('.text-danger').remove();
            }, 3000);
            return false;
        }
        return true;

    }

    // reponse after creat new Thanh vien
    RespondSuccess(data) {
        if (data.status == true) {
            toastr.success(data.message);
            this.loadThanhVien();
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

    // reponse after delete Thanh vien
    DelSuccess(message) {
        //detaiJS.pageTotal = detaiJS.pageTotal - 1;
        //if ((detaiJS.page - 1) * 10 + 1 > detaiJS.pageTotal) {
        //    detaiJS.page -= 1;
        //}
        this.listThanhVien.length = 0;
        this.loadThanhVien();

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
}

var detailDeTaiJS = new DetailDeTaiJS();
detailDeTaiJS.loadDetai();
detailDeTaiJS.loadThanhVien();

//create thanh vien
// reload select of giao vien
// reset then open modal create Thanh Vien
$('#bt_createThanhVien').click(function () {
    document.getElementById("createThanhVienForm").reset();
    detailDeTaiJS.loadSelectGiaoVien($('#createThanhVienForm select[name="IdGiaoVien"]'));
});
//----------------//

$('#CreateThanhVien').click(function (event) {
    event.preventDefault();
    var model = {};
    var check = detailDeTaiJS.CheckGiaoVien($('#createModal select[name="IdGiaoVien"]'));
    if (!check) {
        return;
    }

    model.IdGiaoVien = $('#createModal select[name="IdGiaoVien"]').val();
    model.IdDeTai = detailDeTaiJS.idDetai;
    model.LaChuTri = $('#createThanhVienForm select[name="VaiTro"]').val();
    if (model.LaChuTri == -1) {
        model.LaChuTri = null;
    }

    $.ajax({
        url: 'http://localhost:54555/api/DeTai/ThemThanhVien',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'POST',
        contentType: 'application/json'
    }).done(function (data) {
        detailDeTaiJS.RespondSuccess(data);
        $('#createModal').modal('hide');
    }).fail(function (data) {
        // to do
        detailDeTaiJS.AddFail(data);
    });
});
//--create thanh vien

//delete
$("table").delegate(".delete", "click", function (event) {
    event.stopPropagation();
    var IdGVDT = $(this).data('id').toString();
    $('#confirmDel').data('id', IdGVDT);
    $('#confirmDeleteModal').modal('show');
    return false;
});

$('#confirmDel').click(function () {
    $('#confirmDeleteModal').modal('hide');
    var IdGVDT = $(this).data('id').toString();

    $.ajax({
        url: 'http://localhost:54555/api/DeTai/XoaThanhVien?Id=' + IdGVDT,
        method: "DELETE",
        dataType: 'json',
        contentType: 'application/json'
    }).done(function (data) {
        if (data.status == true) {
            detailDeTaiJS.DelSuccess(data.message);
        }
        else {
            alert("Lỗi! không thể xóa")
        }

    }).fail(function () {
        alert("Lỗi! không thể xóa")
    });
});
//----------//


//edit detai
// reload select of loai de tai
$("table").on("click", ".edit", function (event) {
    event.stopPropagation();
    var IdGVDT = $(this).data('idgvdt').toString();
    $('#EditThanhVien').data('idgvdt', IdGVDT);
    var IdGiaoVien = $(this).data('idgiaovien').toString();
    $('#EditThanhVien').data('idgiaovien', IdGiaoVien);
    //add to form
    $('#edithModal input[name="IdDeTai"]').val(detailDeTaiJS.idDetai);
    var childOfRow = $(this).parent().parent().find('td');
    $('#edithModal input[name="IdGiaoVien"]').val(childOfRow[2].innerText);
    var vaitro = parseInt($(this).data('vaitro'))

    $('#edithModal select[name="VaiTro"]').val(vaitro);
    //---------//
    $('#edithModal').modal('show');
});

$('#EditThanhVien').click(function () {
    event.preventDefault();
    var model = {};
    model.Id = $(this).data('idgvdt');
    model.IdGiaoVien = $(this).data('idgiaovien');
    model.IdDeTai = $('#edithModal input[name="IdDeTai"]').val();
    model.LaChuTri = $('#edithModal select[name="VaiTro"]').val();
    if (model.LaChuTri == -1) {
        model.LaChuTri = null;
    }
    $.ajax({
        url: 'http://localhost:54555/api/DeTai/SuaThanhVien',
        data: JSON.stringify(model),
        dataType: 'json',
        method: 'PUT',
        contentType: 'application/json'
    }).done(function (data) {
        detailDeTaiJS.RespondSuccess(data);
        $('#edithModal').modal('hide');
    }).fail(function (data) {
        // to do
        detailDeTaiJS.AddFail(data);
    });
});
             //--edit detai