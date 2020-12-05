using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FEQLGV.Controllers
{
    public class BaiBaoController : BaseController
    {
        // GET: BaiBao
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