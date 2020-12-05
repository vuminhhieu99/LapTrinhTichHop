
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



        class BBKH_JS {
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
        url: 'http://localhost:54555/api/BaiBao/GetBaiBaoByGiaoVien',
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
            item.IdLoaiBaiBao == null ? "" : item.LoaiBaiBao.Ten,
            item.TenTapChiCongBo,
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

        var bbkh_JS = new BBKH_JS();
        bbkh_JS.loadData();
        bbkh_JS.LoadGiaoVien();
        //----------------//

        //select page
        $(".pagination").delegate(".page-number a", "click", function () {
            var page = $(this).text();

            bbkh_JS.page = page;
            bbkh_JS.loadData();
        });

        // pagesize updade change
        $('select[name="example1_length"]').change(function () {
        bbkh_JS.pagesize = $(this).val();
            // redefaul page =1
            bbkh_JS.page = 1;
            bbkh_JS.loadData();
        });


        // Nam change set BBKH_JS

        $('#searchNam').on("change", function () {
            var nam = $(this).val().toString();
            if (nam == "0") {
        nam = null;
            }
            bbkh_JS.nam = nam;
            bbkh_JS.page = 1;
            bbkh_JS.loadData();
        })

        // Ki change set BBKH_JS

        $('#searchKi').on("change", function () {
            var ki = $(this).val().toString();
            if (ki == "0") {
        ki = null;
            }
            bbkh_JS.ki = ki;
            bbkh_JS.page = 1;
            bbkh_JS.loadData();
        })


        // next and previous click to set BBKH_JS
        $(".pagination").delegate(".next a", "click", function () {
        bbkh_JS.page = parseInt(bbkh_JS.page) + 1;
            bbkh_JS.loadData();
        });

        $(".pagination").delegate(".previous a", "click", function () {
        bbkh_JS.page = parseInt(bbkh_JS.page) - 1;
            bbkh_JS.loadData();
        });

