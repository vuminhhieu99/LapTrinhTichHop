using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FEQLGV.Controllers
{
    public class SachController : BaseController
    {
        // GET: Sach
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(string id)
        {
            ViewBag.id = id;
            return View();
        }
    }
}