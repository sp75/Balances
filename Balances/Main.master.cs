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

            if (!IsPostBack)
            {
                ASPxNavBar1.ActiveGroup.Items.Clear();
                using (BalancesEntities db = new BalancesEntities())
                {
                    foreach (var item in db.Category)
                    {
                        ASPxNavBar1.ActiveGroup.Items.Add(new NavBarItem(item.Name, item.Name + item.Id));// (item.Name);
                    }

                }
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

        }

        protected void NavCallbackPanel_Callback(object sender, CallbackEventArgsBase e)
        {
            if(e.Parameter == "new_item")
            {
                using (BalancesEntities db = new BalancesEntities())
                {
                    db.Category.Add(new Category() { Name = ASPxTextBox1.Text });
                    db.SaveChanges();

                    ASPxNavBar1.ActiveGroup.Items.Clear();
                    foreach (var item in db.Category)
                    {
                        ASPxNavBar1.ActiveGroup.Items.Add(new NavBarItem(item.Name, item.Name + item.Id));// (item.Name);
                    }
                }
            }
        }
    }
}