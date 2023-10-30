
<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewQuotes.aspx.cs" Inherits="sampleorders.ViewQuotes" ValidateRequest="false" %>

   <asp:Content ID="head" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 


<title>ViewQuotes</title>
<%--<script src="../Scripts/Main.js"></script>--%>
<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
 <%--   <script>

        function search() {  

            var errormsg = "following fields are invalid:\n";

            var err = false;
            var SearchStr;
            
            //var Pgno = document.getElementById("pg_no");
            //var pgnovalue = Pgno.options[Pgno.selectedIndex].value;

            //var PgSize = document.getElementById("pg_size");
            //var pgsizeValue = PgSize.options[PgSize.selectedIndex].value;


            SearchStr = document.getElementById("SearchItems");
            var e = document.getElementById("search_col");
            var searchcolval = e.options[e.selectedIndex].value;
            //alert(SearchStr + "," + text);

            if (SearchStr.value == null || SearchStr.value == "") {
                errormsg += "Search Str\n";
                err = true;
            }

            if (err) {
                alert(errormsg);
            }
            else {
                /* document.getElementById("hdn_saction").value = "searchval";*/
                //document.getElementById("hdn_pg_no").value = pgnovalue;
                //document.getElementById("hdn_pg_size").value = pgsizeValue;
                document.getElementById("hdn_optionval").value = searchcolval;
                document.getElementById("hdn_searchstr").value = SearchStr.value;
                
                //alert(document.getElementById("hdn_optionval").value);
                document.forms[0].submit();
            }
        }

        function pagination(paramtype) {
            var Pgno = document.getElementById("PageNo");
            var pgnovalue = Pgno.options[Pgno.selectedIndex].value;
            

            var PgSize = document.getElementById("PageSize");
            var pgsizeValue = PgSize.options[PgSize.selectedIndex].value;

            if (paramtype == "PageSize") { pgnovalue = 1; }
            //document.getElementById("hdn_pg_no").value = pgnovalue;
            //document.getElementById("hdn_pg_size").value = pgsizeValue;

            //document.forms[0].submit();


            window.location.href = "https://localhost:44313/ViewQuotes.aspx?PageNo="+pgnovalue + "&PageSize=" + pgsizeValue;
            
            
            
        }

    </script>--%>
 
       
    <form id="form1" >
        <input type="hidden" id="hdn_saction" name="hdn_saction" value="" />
        <input type="hidden" id="hdn_optionval" name="hdn_optionval" value="" />
        <input type="hidden" id="hdn_searchstr" name="hdn_searchstr" value="" />
        <input type="hidden" id="hdn_pg_no" name="hdn_pg_no" value="" />
        <input type="hidden" id="hdn_pg_size" name="hdn_pg_size" value="" />


         <div style="text-align: right;">
             
            
                      <select id="PageNo" onchange="pagination('Pageno');" value="<%=util.Pagination(PageNo,PageSize,20)%>" </select>
                            
                             <%--<option <%if (PageNo == 1) {  %> selected="selected" <%} %>value="1" >Page1</option> 
                             <option <%if (PageNo == 2) {  %> selected="selected" <%} %>value="2" >Page2</option>
                             <option <%if (PageNo == 3) {  %> selected="selected" <%} %>value="3" >Page3</option>--%>
                      

<span>     <%=util.RenderListBox("PageSize","lookupdisplay","lookupdisplay",util.GetPageSize(),PageSize.ToString(),"","onchange=\"pagination('PageSize');\"")%> </span>

                      <%--<select id="PageSize" value=" >
                            <option <%if (PageSize == 5) {  %> selected="selected" <%} %> value="5">5</option>
                             <option <%if (PageSize == 10) {  %> selected="selected" <%} %> value="10">10</option>
                             <option <%if (PageSize == 15) {  %> selected="selected" <%} %> value="15">15</option>
                             <option <%if (PageSize == 20) {  %> selected="selected" <%} %> value="20">20</option>
                      </select>--%>
                      <select id="search_col" style=" padding:7px; padding-left: 70px;">
                             <option value="QuoteId">QuoteId</option>
                             <option value="BillTo">BillTo</option>
                             <option value="ShipTo">ShipTo</option>
                             <option value="CustomerName">CustomerName</option>
                             <option value="ContactEmail">ContactEmail</option>
                             <option value="Phone">Phone</option>
                             <option value="ShippingMethod">ShippingMethod</option>
                             <option value="CustRef">CustRef</option>
                      </select>
            <input type="text" id="SearchItems" class="SearchItems" placeholder="Enter Keyword"
                style="margin: 10px; width: 500px; padding: 7px;" value="<%=SearchStr %>" />
                  
            <input type="button" value="search" style="padding: 7px;" onclick="search();" />
      
            <button style="padding: 7px;">Reset</button>
       </div>    
        <br />
        <br />


    
        <div>
            <table id="myTable" <%--id="matchKey"--%> class="table table-striped table-invoice" border="0" style="width:101.3% !important;max-width:101%;">
                <tr class="header">
                      <th class="tdrightalign">QuoteId</th>
                      <th class="tdrightalign">BillTo</th> 
                      <th class="tdrightalign">ShipTo</th> 
                      <th class="tdrightalign">Customer Name</th> 
                      <th class="tdrightalign">ContactEmail</th>
                      <th class="tdrightalign">Phone</th> 
                      <th class="tdrightalign">ShippingMethod</th> 
                      <th nowrap="" style="width:5%">CustRef</th>
                </tr>
                
                    <%  for (int i = 0; i < UserTbl2.Rows.Count; i++)
                       { %>

                         
                        <tr class="header">
                <td class="subjectName">
                    <a href="https://localhost:44313/orders.aspx?QuoteId=<%=util.GetColumnValue(UserTbl2, i, "QuoteId", "", "")%> ">
                    <%=util.GetColumnValue(UserTbl2, i, "QuoteId", "", "")%> </a>

                </td>                 
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "BillTo", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "ShipTo", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "ContactName", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "ContactEmail", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "Phone", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "ShippingMethod", "", "")%></td>
                        <td class="LineDetails"><%=util.GetColumnValue(UserTbl2, i, "CustRef", "", "")%></td>

                        </tr>
                           
                    <% }%> 
               
        
            </table>
            

        </div>
    </form>

   </asp:Content>
