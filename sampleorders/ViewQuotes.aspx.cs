using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sampleorders
{
    public partial class ViewQuotes : System.Web.UI.Page
    {
        public Common util = new Common();
        public Dal idal = new Dal();
        public DataTable UserTbl1 = new DataTable();
        public DataTable UserTbl2 = new DataTable();
        public string saction = "";
        public string SearchStr = "";
        public int PageNo = 1;
        public int PageSize = 10;
        protected void Page_Load(object sender, EventArgs e)
        {

            saction = util.getPostValue("hdn_saction", "");
            PageNo = util.getPostValueInt("PageNo", 1);
            PageSize = util.getPostValueInt("PageSize", 10);
            SearchStr = util.getPostValue("hdn_searchstr", "");
            string SearchCol = util.getPostValue("hdn_optionval", "");
            UserTbl2 = idal.Getviewquotepagination(PageNo,PageSize,SearchStr,SearchCol);

            //Response.Redirect("ViewQuotes.aspx?PageNo="+PageNo);
            //Response.Write(saction);
            //Response.End();
            //if (saction == "searchval")
            //{
            //    string SearchStr = util.getPostValue("hdn_searchstr", "");
            //    string SearchCol = util.getPostValue("hdn_optionval", "");
            //    UserTbl1 = idal.Getviewquotepagination(SearchStr, SearchCol);

            //}
            //else
            //{
            //    UserTbl1 = idal.Getviewquotepagination("", "");
            //}
            //UserTbl1 = idal.OrderHeader();
         }
    }
}