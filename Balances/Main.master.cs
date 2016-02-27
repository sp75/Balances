using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace Balances {
    public partial class MainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

            using (BalancesEntities db = new BalancesEntities())
            {
                foreach (var item in db.Category)
                {
                    ASPxNavBar1.ActiveGroup.Items.Add(new NavBarItem(item.Name, item.Name+item.Id));// (item.Name);
                }
                
            }
        }
    }
}