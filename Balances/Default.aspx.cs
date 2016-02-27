using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balances {
    public partial class _Default : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
          //  EntityDataSource1.WhereParameters["CategoryId"].DefaultValue = 2.ToString();

            if(IsCallback)
            {
              
            }

        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
           var publication = e.Entity as Publication;
            if ( publication != null )
            {
                publication.Active = true;
                publication.PublishedDate = DateTime.Now;
               // publication.Expired = false;

                if(!String.IsNullOrEmpty(  ASPxTextBox1.Text))
                {
                    publication.ImageUrl = ASPxTextBox1.Text;
                    ASPxTextBox1.Text = "";
                }

            }
        }

        protected void PublicationGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ;
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            e.CallbackData = String.Format("/Images/Publication/{0}", e.UploadedFile.FileName);
            string pathToFiles = Server.MapPath("/Images/Publication/");
            if (e.IsValid)
            {
                var Id = Convert.ToInt32(PublicationGridView.GetRowValues(PublicationGridView.EditingRowVisibleIndex, "Id"));
                e.UploadedFile.SaveAs(Path.Combine(pathToFiles, e.UploadedFile.FileName));

                using (BalancesEntities db = new BalancesEntities())
                {
                    var item = db.Publication.Find(Id);
                    if (item != null)
                    {
                        item.ImageUrl = String.Format("/Images/Publication/{0}", e.UploadedFile.FileName);
                        e.CallbackData = item.ImageUrl;
                    }
                    db.SaveChanges();
                }
            }
        }

        protected void ASPxUploadControl1_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
           
        }

        protected void PublicationGridView_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            using (BalancesEntities db = new BalancesEntities())
            {
                var cat = Enumerable.FirstOrDefault(db.Category.Where(w => w.Name == e.Parameters));
                if(cat!=null)
                {
                    EntityDataSource1.WhereParameters["CategoryId"].DefaultValue = cat.Id.ToString();
                    PublicationGridView.DataBind();
                }
            }

           
        }
    }
}