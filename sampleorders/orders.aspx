 <%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="sampleorders.orders" ValidateRequest="false" %>


<asp:Content ID="head" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div class="box">
            <div class="box-title" style="padding-left: 1.5%;">
                <h3><span>
                    <i class="fa fa-money"></i>
                    Order:
                        <%--<input type="text" readonly="readonly" value=" <%= util.GetColumnValue(UserTbl1,0,"QuoteId","","") %>" />--%>
                </span>
                </h3>
                <div style="float: right; padding-right: 1%;">
                    <h3 style="color: cornflowerblue">KFC</h3>
                </div>
            </div>
            <div class="col-sm-12 mat-10 zero-padding">
                <div style="width: 100%; text-align: center; color: green; font-weight: bold;"></div>
                <div class="col-md-6 zero-padding">
                    <ul class="tabs tabs-inline tabs-top">
                        <li id="tab_main" class="active">
                            <a href="https://salesqa.axelliant.com/Subscription/Quote?id=05514f05-57be-4523-9b5a-9d3083a9e9e9#maintab" onclick="setselectedtab(&#39;maintab&#39;);" data-toggle="tab">Main
                            </a>
                        </li>
                        <li id="tab_response">
                            <a href="https://salesqa.axelliant.com/Subscription/Quote?id=05514f05-57be-4523-9b5a-9d3083a9e9e9#userresponsetab" onclick="setselectedtab(&#39;userresponsetab&#39;);" data-toggle="tab">Comments
                            </a>
                        </li>
                        <li id="tab_addiflds">
                            <a href="https://salesqa.axelliant.com/Subscription/Quote?id=05514f05-57be-4523-9b5a-9d3083a9e9e9#additionalfldstab" onclick="setselectedtab(&#39;additionalfldstab&#39;);" data-toggle="tab">Additional Details
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6 text-right">
                    <a href="https://salesqa.axelliant.com/Subscription/Quote?id=05514f05-57be-4523-9b5a-9d3083a9e9e9#" id="PublishQuote" class="btn btn-primary btn-white-cust" style="display: inline-block" onclick="updatelineitems(&#39;1&#39;,&#39;save&#39;,&#39;1&#39;,&#39;False&#39;);">Save and Publish</a>

                    &nbsp;
                <a href="https://salesqa.axelliant.com/Subscription/Quote?id=05514f05-57be-4523-9b5a-9d3083a9e9e9#modal-export" data-toggle="modal" class="btn btn-primary btn-red-cust">Export</a>
                    &nbsp;

                <a href="javascript:readytoorder(&#39;05514f05-57be-4523-9b5a-9d3083a9e9e9&#39;);" style="display: inline-block;" class="btn btn-primary btn-white-cust">Ready to Order</a>
                    &nbsp;
                <button type="button" onclick="myFunction(<%=UserTbl.Rows.Count %>);">save</button>

                </div>


                <div class="tab-content padding tab-content-inline tab-content-bottom">
                    <div class="tab-pane" id="maintab">
                        <div class="invoice-info">
                            <div class="invoice-name" style="margin-bottom: 21px;">
                            </div>

                            <div class="col-sm-12">&nbsp;</div>
                            <div class="col-sm-3" style="margin-bottom: 25px;">
                                <span class="invoice-header">Bill-To &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </span>
                                <br />
                                <%--<strong>
                                        Klatch Coffee Rancho
                                    </strong>--%>
                                <address>
                                    <%= util.GetColumnValue(UserTbl,0,"BillTo","","") %>
                                </address>
                            </div>
                            <div class="col-sm-2" style="margin-bottom: 7px;">
                                <span class="invoice-header">Ship-To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </span>
                                <br />
                                <%--<strong>
                                        Klatch Coffee Rancho

                                    </strong>--%>
                                <address>
                                    <%= util.GetColumnValue(UserTbl,0,"ShipTo","","") %>
                                </address>
                            </div>
                            <div class="col-sm-4" style="margin-bottom: 30px; position: relative; bottom: 7px; padding-right: 0px;">
                                <table style="line-height: 2.5;">

                                    <tr style="height: 30px;">
                                        <td align="right">
                                            <font class="control-label">Contact name :&nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <input type="text" name="contactname" id="contactname" value="<%= util.GetColumnValue(UserTbl,0,"ContactName","","") %>" />

                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right">
                                            <font class="control-label">Contact email :&nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <%-- <input type="hidden" name="hdn_ContactEmail" id="hdn_ContactEmail" value="" />
                                <%= util.RenderDropdown("please select","ContactEmail","ContactEmail",UserTbl1,"","","contactemail_onclick()","")%>--%>

                                            <%= util.CustomRenderDropdown("select", "", "contactemail", "ContactEmail", "ContactEmail", UserTbl, "ContactEmail", "", "")%> 
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" style="vertical-align: top;">
                                            <font class="control-label">Phone :&nbsp;&nbsp;</font>
                                        </td>
                                        <td>
                                            <input type="text" name="phone" id="phone" value="<%= util.GetColumnValue(UserTbl,1,"Phone","","") %>" />

                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" style="vertical-align: top;">
                                            <font class="control-label">Shipping Method :&nbsp;&nbsp;</font>
                                        </td>
                                        <td>
                                            <input type="text" name="Shipping" id="Shipping" value="<%= util.GetColumnValue(UserTbl,0,"ShippingMethod","","") %>" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" style="vertical-align: top;">
                                            <font class="control-label">Billing Period :&nbsp;&nbsp;</font>
                                        </td>
                                        <td>Select
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div class="col-sm-3" style="margin-bottom: 65px; position: relative; bottom: 7px; padding-right: 0px;">
                                <table style="line-height: 2.5;">
                                    <tr>
                                        <td align="right">
                                            <font class="control-label">Cust Ref : &nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <input type="text" name="Custref" id="Custref" value="" />
                                        </td>
                                    </tr>

                                    <tr style="height: 30px;">
                                        <td align="right">
                                            <font class="control-label">Expiration Date :&nbsp;&nbsp;</font>
                                        </td>

                                        <td>
                                            <input type="datetime" name="expdate" id="expdate" value="<%= util.GetColumnValue(UserTbl,0,"ExpirationDate","","") %>" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <font class="control-label">Payment Terms : &nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <%-- <input type="hidden" name ="PaymentTerms" id="PaymentTerms" value="" />--%>
                                            <%= util.CustomRenderDropdown("select", "", "paymentterms", "PaymentTerms", "PaymentTerms", UserTbl, "PaymentTerms", "", "")%> 
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right">
                                            <font class="control-label">Customer Po : &nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <%= util.GetColumnValue(UserTbl,0,"CustomerPo","","") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <font class="control-label">Quote Title : &nbsp;&nbsp;
                                            </font>
                                        </td>
                                        <td>
                                            <input type="text" name="QuoteTitle" id="QuoteTitle" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <font class="control-label">
                                                <b>Total Tax Exempt : &nbsp;&nbsp;</b>
                                            </font>
                                        </td>
                                        <td style="">N/A
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <font class="control-label">
                                                <b>Tax Exempt : &nbsp;&nbsp;</b>
                                            </font>
                                        </td>
                                        <td style="">N/A
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" name="xml" id="xml" value="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-striped table-invoice" border="0" style="width: 101.3% !important; max-width: 101%;">
            <thead>
                <tr>

                    <th>&nbsp;</th>
                    <th>&nbsp;</th>


                    <th>Item #</th>
                    <th>Group Name</th>
                    <th>Manufacturer</th>
                    <th style="width: 12%;">Description</th>
                    <th>Supplier</th>
                    <th>&nbsp;</th>
                    <th class="tdrightalign" style="width: 9%;">Qty</th>
                    <th class="tdrightalign" style="width: 9%;">SD</th>
                    <th>Billing Period</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th class="tdrightalign">Unit Cost</th>
                    <th class="tdrightalign" style="width: 10%;" nowrap="">Unit Price</th>
                    <th class="tdrightalign">Ext Cost</th>
                    <th class="tdrightalign">Ext Price</th>
                    <th class="tdrightalign">GP</th>
                    <th class="tdrightalign">GP %</th>

                </tr>
            </thead>
            <tbody>
                <%  for (int i = 0; i < UserTbl.Rows.Count; i++)
                  { %>
                <tr>

                    <td>&nbsp;</td>
                    <td>&nbsp;</td>

                    <%--  <input type="hidden" id="hdn_lineid_0" name="hdn_lineid_0" value="1317443" />
                <input type="hidden" id="hdn_itemname_0" name="hdn_itemname_0" value="910-001917" />--%>


                    <td>
                        <input type="hidden" name="hdn_itempart_<%=i%>" id="hdn_itempart_<%=i%>" value="<%=util.GetColumnValue(UserTbl, i, "Item", "", "")%>" />
                        <%=util.GetColumnValue(UserTbl, i, "Item", "", "")%> 
                    </td>


                    <td></td>
                    <td id="td_manufacturer_<%=i%>"><%= util.GetColumnValue(UserTbl, i, "Manufacturer", "", "")%></td>
                    <td id="td_description_<%=i%>" title="" data-placement="top"
                        data-content="WIRELESS MOUSE M310/PEACOCK BLUE" style="font-size: 10pt;" data-original-title="Description">
                        <%= util.GetColumnValue(UserTbl, i, "Description", "", "")%>
                    </td>
                    <td id="td_supplier_"><%= util.GetColumnValue(UserTbl, i, "Supplier", "", "")%></td>
                    <td>&nbsp;</td>
                    <td style="text-align: right">

                        <input type="number" id="qty_<%=i%>" name="qty_<%=i%>" onchange="changeLineItems(<%=i%>)" maxlength="4" size="4"
                            value="<%= util.GetColumnValue(UserTbl, i, "Qty", "", "")%>" />
                    </td>
                    <td>
                        <input type="text" id="td_Sd_<%=i%>" name="td_Sd_<%=i%>" value="<%= util.GetColumnValue(UserTbl, i, "SD", "", "")%>" maxlength="4" size="4" />
                    </td>
                    <td>
                        <input type="hidden" name="td_BillingPeriod_<%=i%>" value="<%= util.CustomRenderDropdown("Pleaseselect", "", "td_BillingPeriod_" + i, "BillingPeriod", "BillingPeriod", UserTbl, "BillingPeriod", "", "")%> " />
                        <select id="td_BillingPeriod_<%=i%>" name="td_BillingPeriod_<%=i%>">
                            <option <%if (util.GetColumnValue(UserTbl, i, "BillingPeriod", "", "") == "fullterm") {  %> selected="selected" <%} %> value="fullterm">FullTerm</option>
                            <option <%if (util.GetColumnValue(UserTbl, i, "BillingPeriod", "", "") == "Yearly") {  %> selected="selected" <%} %> value="yearly">Yearly</option>
                            <option <%if (util.GetColumnValue(UserTbl, i, "BillingPeriod", "", "") == "monthly") {  %> selected="selected" <%} %> value="monthly">Monthly</option>

                        </select>
                    </td>
                    <td>
                        <input type="datetime" class="form-control" id="td_StartDate_<%=i%>" name="td_StartDate_<%=i%>" value="<%= util.GetColumnValue(UserTbl,i,"StartDate","","") %>" />
                    </td>
                    <td>
                        <input type="datetime" class="form-control" id="td_EndDate_<%=i%>" name="td_EndDate_<%=i%>" value="<%= util.GetColumnValue(UserTbl,i,"EndDate","","") %>" />
                    </td>
                    <script>
                        flatpickr("#td_StartDate_<%=i%>", {
                            enableTime: true,
                            dateFormat: "Y-m-d ",
                        });
                        flatpickr("#td_EndDate_<%=i%>", {
                            enableTime: true,
                            dateFormat: "Y-m-d ",
                        });
                    </script>

                    <td style="text-align: right;">
                        <input type="text" name="Ucost_<%=i%>" id="Ucost_<%=i%>" maxlength="4" size="4"
                            value="<%= util.GetColumnValue(UserTbl,i,"UnitCost","","")%>" />
                    </td>

                    <td style="text-align: -webkit-right; text-align: right">
                        <input type="text" name="Uprice_<%=i%>" id="Uprice_<%=i%>" maxlength="4" size="4" value="<%= util.GetColumnValue(UserTbl,i,"UnitPrice","","")%>" />
                    </td>
                    <td style="text-align: right;" id="td_extcost_<%=i%>"><%= util.GetColumnValue(UserTbl,i,"ExtCost","","")%></td>
                    <%--  <td> 
                    <input type="hidden" name="td_extcost_<%=i%>" id="td_extcost_<%=i%>" value="<%= util.GetColumnValue(UserTbl,i,"ExtCost","","")%>" /> 
                    <%= util.GetColumnValue(UserTbl,i,"ExtCost","","")%>
                </td>--%>
                    <td style="text-align: right;" id="td_extprice_<%=i%>"><%= util.GetColumnValue(UserTbl,i,"ExtPrice","","")%></td>
                    <td style="text-align: right;" id="td_gp_<%=i%>"><%= util.GetColumnValue(UserTbl,i,"GP","","")%></td>
                    <td style="text-align: right;" id="td_gppercentage_<%=i%>"><%= util.GetColumnValue(UserTbl,i,"GPPercentage","","")%></td>


                </tr>
                <% }%>
                <tr style="border: none;">
                    <td id="lblsubtotal" height="20" colspan="14" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Subtotal:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtsubtotal" height="20">
                        <font class="control-label bold">115.00
                        </font>
                    </td>
                    <td id="lblcost" height="20" colspan="2" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Cost
                                Subtotal:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtcost" height="20">
                        <font class="control-label bold">95.30
                        </font>
                    </td>
                    <td id="txtsub" class="tdtblnobordered" height="20" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td id="lblsalestax" height="20" colspan="14" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Sales Tax &nbsp;(0.00%):
                        </font>
                    </td>
                    <td id="txtsalestax" class="tdtblnobordered" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td id="lblinbound" height="20" colspan="2" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Inbound
                                Freight:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtinbound" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td id="txtsales" class="tdtblnobordered" height="20" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td id="lblrecyclefee" height="20" colspan="14" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Recycle Fee:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtrecyclefee" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td id="lbloutbound" height="20" colspan="2" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Outbound
                                Freight:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtoutbound" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtrecycle" height="20" colspan="2">&nbsp;&nbsp;
                    </td>
                </tr>
                <tr style="background-color: #fff !important;">
                    <td id="lblshipping" height="20" class="tdtblnobordered" colspan="14" align="right">
                        <font class="control-label bold">Shipping&nbsp;&nbsp;(5.00%):
                        </font>
                    </td>
                    <td id="txtshipping" class="tdtblnobordered" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td id="lbloutbound" height="20" colspan="2" align="right" class="taxes tdtblnobordered">
                        <font class="control-label bold">Freight Cost:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtoutbound" height="20">
                        <font class="control-label bold">0.00
                        </font>
                    </td>
                    <td id="txtship" height="20" class="tdtblnobordered" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr style="background-color: #fff !important;">
                    <td id="lbltotal" class="tdtblnobordered" height="20" colspan="14" align="right">
                        <font class="control-label bold">Total:
                        </font>
                    </td>
                    <td id="txttotal" class="tdtblnobordered" height="20">
                        <font class="control-label bold">115.00
                        </font>
                    </td>
                    <td id="txtamt" class="tdtblnobordered" height="20" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr style="background-color: #fff !important;">
                    <td id="lblgp" class="tdtblnobordered" height="20" colspan="14" align="right">
                        <font class="control-label bold">GP:
                        </font>
                    </td>
                    <td id="txtgp" class="tdtblnobordered" height="20">
                        <font class="control-label bold">19.70
                        </font>
                    </td>
                    <td id="txt" class="tdtblnobordered" height="20" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td id="lblgpperc" class="tdtblnobordered" height="20" colspan="14" align="right">
                        <font class="control-label bold">GP %:
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtgpperc" height="20">
                        <font class="control-label bold">17.13
                        </font>
                    </td>
                    <td class="tdtblnobordered" id="txtperc" height="20" colspan="2">&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="hidden" name="saction" id="saction" value="" />
   </asp:Content>