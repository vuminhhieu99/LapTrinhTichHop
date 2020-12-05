using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FEQLGV.Controllers
{
    public class DeTaiController : BaseController
    {
        // GET: DeTai
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