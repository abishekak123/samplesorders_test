using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace sampleorders
{
    public class Dal
    {
        Common iutils = new Common();

        public SqlConnection Cnxn = new SqlConnection();


        public Dal()
        {
            Cnxn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

        }

        public Dal(string servername, string Dbname, string username, string password)
        {
            string DbConnection = iutils.GetUserDBConnactionString(servername, Dbname, username, password);
            Cnxn.ConnectionString = DbConnection;
        }

       
        public void OpenConnection()
        {
            if (Cnxn.State == ConnectionState.Closed)
            {
                Cnxn.Open();
            }

        }

        public void CloseConnection()
        {
            if (Cnxn.State == ConnectionState.Open)
            {
                Cnxn.Close();
            }

        }
        public DataTable OrderLineDetails(int QuoteId)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable ReturnTbl = new DataTable();
            cmd.Connection = Cnxn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "T_OrderLineDetails";
            cmd.Parameters.AddWithValue("@QuoteId", QuoteId);
            da.SelectCommand = cmd;
            da.Fill(ReturnTbl);
            return ReturnTbl;
        }

        public DataTable OrderHeader()
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable ReturnTbl = new DataTable();
            cmd.Connection = Cnxn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "T_OrderHeader";
            da.SelectCommand = cmd;
            da.Fill(ReturnTbl);
            return ReturnTbl;
        }

        public DataTable Getviewquotepagination(int PageNo, int PageSize, string SearchStr, string SearchCol )

        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable ReturnTbl = new DataTable();
            cmd.Connection = Cnxn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "T_GetViewQuote_Pagination";
            cmd.Parameters.AddWithValue("@PageNo", PageNo);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.AddWithValue("@SearchStr", SearchStr);
            cmd.Parameters.AddWithValue("@SearchCol", SearchCol);
            

            da.SelectCommand = cmd;
            da.Fill(ReturnTbl);
            return ReturnTbl;
        }
        public Boolean InsertQuote(int QuoteId, string contactname, string ContactEmail, string phone, string Shipping, string Custref, string expdate, string PaymentTerms, string QuoteTitle, string xmlstr)
        {
            SqlCommand cmd = new SqlCommand();
            Boolean Return = false;
            cmd.Connection = Cnxn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertQuoteHeader"; // Stored Procedure Name
            cmd.Parameters.AddWithValue("@QuoteId", QuoteId);
            cmd.Parameters.AddWithValue("@ContactName", contactname); //Stored Procedure Parameter Name & value
            cmd.Parameters.AddWithValue("@ContactEmail", ContactEmail);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@ShippingMethod", Shipping);
            cmd.Parameters.AddWithValue("@CustRef", Custref);
            cmd.Parameters.AddWithValue("@ExpirationDate", expdate);
            cmd.Parameters.AddWithValue("@PaymentTerms", PaymentTerms);
            cmd.Parameters.AddWithValue("@QuoteTitle", QuoteTitle);
            cmd.Parameters.AddWithValue("@XML", xmlstr);
            Cnxn.Open();

            cmd.ExecuteNonQuery();
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    Return = true;

            //}
            //else
            //{
            //    Return = false;
            //}
            Cnxn.Close();
            return Return;
        }
    }
}