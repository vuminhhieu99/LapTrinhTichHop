using PagedList;
using QLNCKHGV.EF;
using QLNCKHGV.Models;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Http;

namespace QLNCKHGV.Controllers
{
    public class AccountController : ApiController
    {
        private QuanLyGiaoVienDb db = new QuanLyGiaoVienDb();

        [Route("api/user/login")]
        public IHttpActionResult Login(User user)
        {
            var account = db.Users.Where(k => k.UserName == user.UserName).FirstOrDefault();
            if (account == null)
            {
                return Ok(new
                {
                    message = "Thất bại",
                    status = false,
                    userName = user.UserName
                });
            }
            else
            {
                return Ok(new
                {
                    message = "Thành công",
                    status = true,
                    userName = user.UserName,
                    Name = account.Name,
                    Email = account.Email
                });
            }

        }
        [Route("api/user/register")]
        public IHttpActionResult Register(User user)
        {
            if (!ModelState.IsValid)
                return Ok(new { status = false, message = "Sai dữ liệu đầu vào!" });
            MailMessage mail = new MailMessage();
            mail.From = new System.Net.Mail.MailAddress("openupmta99@gmail.com");

            // The important part -- configuring the SMTP client
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;   // [1] You can try with 465 also, I always used 587 and got success
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // [2] Added this
            smtp.UseDefaultCredentials = false; // [3] Changed this
            smtp.Credentials = new NetworkCredential("openupmta99@gmail.com", "tienmta99");  // [4] Added this. Note, first parameter is NOT string.
            smtp.Host = "smtp.gmail.com";

            //recipient address
            mail.To.Add(new MailAddress(user.Email));

            //Formatted mail body
            mail.IsBodyHtml = true;

            mail.Body = user.Password;
            smtp.Send(mail);
            db.Users.Add(user);
            db.SaveChanges();
            return Ok(new { status = true, message = "Thêm mới tài khoản thành công!" });
        }
    }
}