using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wikiDog
{
    public partial class wikiDog : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UrlRest.Value = ConfigurationManager.AppSettings["UrlRest"];
        }
    }
}