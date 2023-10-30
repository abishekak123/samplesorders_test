using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Configuration;

namespace sampleorders
{
    public class Common
    {
        public int age = 16;
        public string gender = "Male";


        public string getPostValue(string fname, string ifnullvalue = "")
        {
            HttpRequest srequest = default(HttpRequest);
            srequest = System.Web.HttpContext.Current.Request;
            if (srequest == null)
            {
                return ifnullvalue;
            }
            else
            {
                if (srequest[fname] == null)
                {
                    return ifnullvalue;
                }
                else
                {
                    return srequest[fname].ToString().Trim();
                }
            }
        }

        internal bool GetColumnValue(string v1, string v2, string v)
        {
            throw new NotImplementedException();
        }

        public int getPostValueInt(string fname, int ifnullvalue = -999)
        {
            HttpRequest srequest = default(HttpRequest);
            srequest = System.Web.HttpContext.Current.Request;
            if (srequest == null)
            {
                return Convert.ToInt32(ifnullvalue);
            }
            else
            {
                if (srequest[fname] == null || srequest[fname] == "")
                {
                    return Convert.ToInt32(ifnullvalue);
                }
                else
                {
                    return Convert.ToInt32(srequest[fname]);
                }
            }
        }



        public string GetColumnValue(DataTable source, int rowcount, string columname, string Format = "", string nullval = "")
        {
            string retval = null;
            string Returnstr = nullval;
            if (!(renderTable(source) == false))
            {
                if (source.Rows.Count >= rowcount + 1)
                {
                    if ((source.Rows[rowcount][columname] != null))
                    {
                        if ((source.Rows[rowcount][columname]) != DBNull.Value)
                        {
                            if (!(Format == string.Empty))
                            {
                                if ((string.Format(Format, source.Rows[rowcount][columname])) == "01/01/1900" | (string.Format(Format, source.Rows[rowcount][columname])) == "01/01/2100" | (string.Format(Format, source.Rows[rowcount][columname])) == "12/31/2100" | (string.Format(Format, source.Rows[rowcount][columname])) == "1/1/1900" | (string.Format(Format, source.Rows[rowcount][columname])) == "1/1/2100")
                                {
                                    return "";
                                }
                                else
                                {
                                    return string.Format(Format, source.Rows[rowcount][columname]);
                                }
                            }
                            else
                            {
                                retval = source.Rows[rowcount][columname].ToString();
                                if (string.IsNullOrEmpty(retval))
                                {
                                    return Returnstr;
                                }
                                else
                                {
                                    return retval;
                                }
                            }
                        }
                        else
                        {
                            return Returnstr;
                        }
                    }
                    else
                    {
                        return Returnstr;
                    }
                }
                else
                {
                    return Returnstr;
                }
            }
            else
            {
                return Returnstr;
            }


        }
        public string GetColumnValue(DataRow sdatarow, string columname, string Format = "")
        {
            string Returnstr = string.Empty;
            if ((sdatarow != null))
            {
                if (sdatarow.Table.Columns.Contains(columname))
                {
                    if ((sdatarow[columname] != null))
                    {
                        if ((sdatarow[columname]) != DBNull.Value)
                        {

                            if (!(Format == string.Empty))
                            {
                                if ((string.Format(Format, sdatarow[columname])) == "01/01/1900" | (string.Format(Format, sdatarow[columname])) == "01/01/2100" | (string.Format(Format, sdatarow[columname])) == "12/31/2100" | (string.Format(Format, sdatarow[columname])) == "1/1/1900" | (string.Format(Format, sdatarow[columname])) == "1/1/2100")
                                {
                                    return "";
                                }
                                else
                                {
                                    return string.Format(Format, sdatarow[columname]);
                                }
                            }
                            else
                            {
                                return sdatarow[columname].ToString();
                            }
                        }
                    }
                }
            }
            return Returnstr;
        }
        public int GetColumnValueInt(DataTable source, int rowcount, string columname, string nullval = "-999")
        {
            string retval = null;
            string Returnstr = nullval;
            if (!(renderTable(source) == false))
            {
                if (source.Rows.Count >= rowcount + 1)
                {
                    if ((source.Rows[rowcount][columname] != null))
                    {
                        if ((source.Rows[rowcount][columname]) != DBNull.Value)
                        {

                            retval = source.Rows[rowcount][columname].ToString();
                            if (string.IsNullOrEmpty(retval))
                            {
                                return Convert.ToInt32(Returnstr);
                            }
                            else
                            {
                                return Convert.ToInt32(retval);
                            }

                        }
                        else
                        {
                            return Convert.ToInt32(Returnstr);
                        }
                    }
                    else
                    {
                        return Convert.ToInt32(Returnstr);
                    }
                }
                else
                {
                    return Convert.ToInt32(Returnstr);
                }
            }
            else
            {
                return Convert.ToInt32(Returnstr);
            }


        }
        public bool renderTable(System.Data.DataTable dt)
        {
            if ((dt != null))
            {
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
            }
            return false;
        }
        public void AddCookie(string CookieName, string CookieValue, int minute)
        {
            HttpResponse sResponse = default(HttpResponse);
            sResponse = System.Web.HttpContext.Current.Response;

            HttpCookie mycookie = default(HttpCookie);
            mycookie = new HttpCookie(CookieName, CookieValue);
            sResponse.Cookies.Add(mycookie);
            sResponse.Cookies[CookieName].Expires = DateTime.Now.AddMinutes(minute);

        }
        public void AddCookie(string CookieName, string CookieValue)
        {
            HttpResponse sResponse = default(HttpResponse);
            sResponse = System.Web.HttpContext.Current.Response;

            HttpCookie mycookie = default(HttpCookie);
            mycookie = new HttpCookie(CookieName, CookieValue);
            sResponse.Cookies.Add(mycookie);

        }
        public string getCookie(string cookiename, string nullifvalue = "")
        {
            HttpRequest srequest = default(HttpRequest);
            srequest = System.Web.HttpContext.Current.Request;
            if ((srequest.Cookies[cookiename] == null))
            {
                return nullifvalue;
            }
            else
            {
                return srequest.Cookies[cookiename].Value.ToString();
            }
        }

        public string GetHostName(string url)
        {
            string hostname = "";
            Uri Cururi = new Uri(url);
            hostname = Cururi.Authority;
            if (string.IsNullOrEmpty(hostname)) { hostname = ""; }
            return hostname;
        }
        public string getPageName()
        {
            string sPagePath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
            System.IO.FileInfo oFileInfo = new System.IO.FileInfo(sPagePath);
            return oFileInfo.Name.ToLower();
        }
        public string CustomRenderDropdown(string DefaultName, string DefaultValue, string Name, string TextField, string ValueField, DataTable SourceTable, string SelectedValue = "", string StyleInfo = "", string onclick = "")
        {
            StringBuilder SB = new StringBuilder();
            SB.Append("<select name ='" + Name + "'" + " id='" + Name + "'" + " " + StyleInfo + " " + onclick + " " + ">");
            if (DefaultName != "")
            {
                SB.Append("<option value='" + DefaultValue + "'>" + DefaultName + "</option>");
            }
            foreach (System.Data.DataRow row in SourceTable.Rows)
            {
                if (row[ValueField].ToString().Trim().ToLower() == SelectedValue.ToLower() | row[TextField].ToString().Trim().ToLower() == SelectedValue.ToLower())
                {
                    SB.Append("<option value='" + row[ValueField].ToString() + "' selected='Selected' >");
                }
                else
                {
                    SB.Append("<option value='" + row[ValueField].ToString() + "'>");
                }
                SB.Append(row[TextField]);
                SB.Append("</option>");
            }
            SB.Append("</select>");
            return SB.ToString();
        }
        public string RenderDropdown(string Name, string TextField, string ValueField, DataTable SourceTable, string SelectedValue = "", string StyleInfo = "", string onclick = "", string DefaultSelectedValue = "default")
        {
            StringBuilder SB = new StringBuilder();
            SB.Append("<select name ='" + Name + "'" + " id='" + Name + "'" + " " + StyleInfo + " " + onclick + " " + ">");
            if (DefaultSelectedValue != "default" && DefaultSelectedValue != "")
            {
                SB.Append("<option value='" + DefaultSelectedValue + "'>" + DefaultSelectedValue + "</option>");

            } 
            else
            {
                SB.Append("<option value='Please Select'>Please Select</option>");
            }

            if (renderTable(SourceTable))
            {
                foreach (System.Data.DataRow row in SourceTable.Rows)
                {
                    if (row[ValueField].ToString().Trim().ToLower() == SelectedValue.ToLower() | row[TextField].ToString().Trim().ToLower() == SelectedValue.ToLower())
                    {
                        SB.Append("<option value='" + row[ValueField].ToString() + "' selected='Selected' >");
                    }
                    else
                    {
                        SB.Append("<option value='" + row[ValueField].ToString() + "'>");
                    }
                    SB.Append(row[TextField]);
                    SB.Append("</option>");
                }

            }
            SB.Append("</select>");
            return SB.ToString();
        }
        public string RenderListBox(string Name, string TextField, string ValueField, DataTable SourceTable, string SelectedValue = "", string StyleInfo = "", string onclick = "")
        {
            StringBuilder SB = new StringBuilder();
            SB.Append("<select name ='" + Name + "'" + " id='" + Name + "'" + " " + StyleInfo + " " + onclick + " " + ">");

            if (renderTable(SourceTable))
            {
                foreach (System.Data.DataRow row in SourceTable.Rows)
                {
                    if (row[ValueField].ToString().Trim().ToLower() == SelectedValue.ToLower() | row[TextField].ToString().Trim().ToLower() == SelectedValue.ToLower())
                    {
                        SB.Append("<option value='" + row[ValueField].ToString() + "' selected='Selected' >");
                    }
                    else
                    {
                        SB.Append("<option value='" + row[ValueField].ToString() + "'>");
                    }
                    SB.Append(row[TextField]);
                    SB.Append("</option>");
                }

            }
            SB.Append("</select>");
            return SB.ToString();
        }
        public string Pagination(int PageNo, int PageSize, int ResultCount)
        {
            string ReturnStr = null;
            StringBuilder sb = new StringBuilder();
            int i = 1;
            int NoOfPages = 0;
            NoOfPages = ResultCount / PageSize;
            if (!(NoOfPages * PageSize == ResultCount))
            {
                if ((NoOfPages * PageSize < ResultCount))
                {
                    NoOfPages = NoOfPages + 1;
                }
            }
            sb.Append("<select style=\"background-color:white;color:black;\" class=\"htxt s12 anone cblack\" id='pageno' name='pageno' class='stdtxt' onchange='javascript:alterpage(this.options[this.selectedIndex].value);'>");
            for (i = 1; i <= NoOfPages; i++)
            {
                if (PageNo == i)
                {
                    sb.Append("<option value= " + i.ToString() + " selected= " + "selected" + "> Page");
                    sb.Append(i.ToString());
                }
                else
                {
                    sb.Append("<option value= " + i.ToString() + "> Page");
                    sb.Append(i.ToString());
                }
                sb.Append("</option>");
            }
            sb.Append("</select>");

            ReturnStr = sb.ToString();
            return ReturnStr;
        }
        public string GetUserDBConnactionString(string servername, string DBname, string Username, string Password)
        {
            string returnstr = ConfigurationManager.AppSettings["DYNAMIC_CONNECTIONSTRING"].ToString();

            returnstr = returnstr.Replace("$#servername#$", servername).Replace("$#catalog#$", DBname).Replace("$#username#$", Username).Replace("$#password#$", Password);
            //returnstr = string.Empty;
            return returnstr;
        }

        public DataTable GetPageSize()
        {
            string xstring;
            xstring = "5,10,15,20";
            DataTable returntbl = new DataTable();
            returntbl.Columns.Add("lookupdisplay", Type.GetType("System.String"));
            foreach (string Str in xstring.Split(','))
            {
                DataRow dr;
                dr = returntbl.NewRow();
                dr["lookupdisplay"] = Str;
                returntbl.Rows.Add(dr);
            }
            return returntbl;
        }
    }
}