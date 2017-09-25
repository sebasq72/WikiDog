using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wikiDog.wsWikiDog;

namespace wikiDog
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            wsWikiDog.WikiDog ws = new wsWikiDog.WikiDog();
            

            ws.CrearSesion("sebasq72");

        }
    }
}