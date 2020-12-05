using FEQLGV.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace FEQLGV.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Login(string data)
        {
            if(data == null)
                return Json(new
                {
                    status = false
                });
            User user = new JavaScriptSerializer().Deserialize<User>(data);            
            Session.Add(CommonConstants.USER_SESSION, user.UserName);
            Session.Add(CommonConstants.NAME_SESSION, user.Name);
            Session.Add(CommonConstants.EMAIL_SESSION, user.Email);
            return Json(new
            {
                status = true
            });
        }
    }
}