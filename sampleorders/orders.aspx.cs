using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace sampleorders
{
    public partial class orders : System.Web.UI.Page
    {
        public Common util = new Common();
        public Dal idal = new Dal();
        public DataTable UserTbl = new DataTable();
        public DataTable UserTbl1 = new DataTable();
        string  ContactName = "", ContactEmail = "", Phone = "", ShippingMethod = "", CustRef = "", ExpirationDate = "", PaymentTerms = "", QuoteTitle = "", xmlstr = "";
        int QuoteId;
        protected void Page_Load(object sender, EventArgs e)
        {
            QuoteId = util.getPostValueInt("QuoteId", -999);
            ContactName = util.getPostValue("contactname", "");
            ContactEmail = util.getPostValue("contactemail", "");
            Phone = util.getPostValue("phone", "");
            ShippingMethod = util.getPostValue("Shipping", "");
            CustRef = util.getPostValue("Custref", "");
            ExpirationDate = util.getPostValue("expdate", "");
            PaymentTerms = util.getPostValue("paymentterms", "");
            QuoteTitle = util.getPostValue("QuoteTitle", "");
            xmlstr = util.getPostValue("xml", "");
            string saction = util.getPostValue("saction", "");

            if (saction == "Addemp")
            {
                idal.InsertQuote(QuoteId,ContactName, ContactEmail, Phone, ShippingMethod, CustRef, ExpirationDate, PaymentTerms, QuoteTitle, xmlstr);
            }



            UserTbl = idal.OrderLineDetails(QuoteId);
            //UserTbl1 = idal.OrderHeader();

        }
    }
}