using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FEQLGV.Controllers
{
    public class GiaoVienController : BaseController
    {
        // GET: GiaoVien
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult BaiBaoKhoaHoc(string id)
        {
            ViewBag.id = id;
            return View();
        }

        public ActionResult NghienCuuDeTai(string id)
        {

            ViewBag.id = id;       
            return View();
        }

        public ActionResult BienSoanSach(string id)
        {
            ViewBag.id = id;
            return View();
        }
    }
}