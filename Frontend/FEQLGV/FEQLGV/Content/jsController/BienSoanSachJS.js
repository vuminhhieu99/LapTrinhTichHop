
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
            "responsive": true
        });



        class BSS_JS {
        idGiaoVien;
            page;
            pagesize;
            nam;
            ki;
            pageTotal;
            constructor(page = 1, pagesize = 10, nam = null, ki = null) {
        this.page = page;
                this.pagesize = pagesize;
                this.nam = nam;
                this.ki = ki;
                this.idGiaoVien = $('#idGiaoVien').text();

            }

            loadData() {
        table.clear().draw();
                $('.processing-example').addClass('spinner-border');
                var self = this;
                $.ajax({
        url: 'http://localhost:54555/api/Sach/GetSachByGiaoVien',
                    data: {pageNumber: this.page - 1, pageSize: this.pagesize, idGiaoVien: this.idGiaoVien, nam: this.nam, ki: this.ki },
                    dataType: 'json',
                    method: 'GET'
                }).done(function (data) {

                    var counter = (self.page - 1) * self.pagesize + 1;
                    $.each(data.items, function (index, item) {
        table.row.add([
            counter,
            item.Ma,
            item.Ten,
            item.IdLoaiSach == null ? "" : item.LoaiSach.Ten,
            item.NoiXuatBan,
            item.SoTrangDaViet,
            item.NamHoc,
            item.KiHoc,
            item.SoGio
        ]).draw(false);
                        counter++;
                    });
                    self.pageTotal = data.totals;
                    $('#Total').text(self.pageTotal);

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
            LoadGiaoVien() {
                var id_GiaoVien = this.idGiaoVien;
                $.ajax({
        url: 'http://localhost:54555/api/GiaoVien/GetGiaoVienById',
                    data: {idGiaoVien: id_GiaoVien },
                    dataType: 'json',
                    method: 'GET'
                }).done(function (data) {
        $('#NameGV').text(data.Ten);
                    $('#MaGV').text(data.Ma);
                    $('#DienThoaiGV').text(data.DienThoai);
                    $('#EmailGV').text(data.Email);
                });

            }



        }

        var bss_JS = new BSS_JS();
        bss_JS.loadData();
        bss_JS.LoadGiaoVien();
        //----------------//

        //select page
        $(".pagination").delegate(".page-number a", "click", function () {
            var page = $(this).text();

            bss_JS.page = page;
            bss_JS.loadData();
        });

        // pagesize updade change
        $('select[name="example1_length"]').change(function () {
        bss_JS.pagesize = $(this).val();
            // redefaul page =1
            bss_JS.page = 1;
            bss_JS.loadData();
        });


        // Nam change set BSS_JS

        $('#searchNam').on("change", function () {
            var nam = $(this).val().toString();
            if (nam == "0") {
        nam = null;
            }
            bss_JS.nam = nam;
            bss_JS.page = 1;
            bss_JS.loadData();
        })

        // Ki change set BSS_JS

        $('#searchKi').on("change", function () {
            var ki = $(this).val().toString();
            if (ki == "0") {
        ki = null;
            }
            bss_JS.ki = ki;
            bss_JS.page = 1;
            bss_JS.loadData();
        })


        // next and previous click to set BSS_JS
        $(".pagination").delegate(".next a", "click", function () {
        bss_JS.page = parseInt(bss_JS.page) + 1;
            bss_JS.loadData();
        });

        $(".pagination").delegate(".previous a", "click", function () {
        bss_JS.page = parseInt(bss_JS.page) - 1;
            bss_JS.loadData();
        });

