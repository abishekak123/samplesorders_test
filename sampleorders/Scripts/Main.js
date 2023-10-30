function myFunction(prodcount) {
    var contactname = document.getElementById("contactname");
    var phone = document.getElementById("phone");
    var shippingmethod = document.getElementById("Shipping");
    var CustRef = document.getElementById("Custref");
    var Expirationdate = document.getElementById("expdate");
    var Quotetitle = document.getElementById("QuoteTitle")
    var errormsg = "following fields are invalid:\n";
    var err = false;

    if (contactname.value == null || contactname.value == "") {
        errormsg += "contactname is required\n";
        err = true;
    }
    if (phone.value == null || phone.value == "") {
        errormsg += "phone is required\n";
        err = true;
    }
    if (shippingmethod.value == null || shippingmethod.value == "") {
        errormsg += "shippingmethod is required\n";
        err = true;
    }
    if (CustRef.value == null || CustRef.value == "") {
        errormsg += "CustRef is required\n";
        err = true;
    }
    if (Expirationdate.value == null || Expirationdate.value == "") {
        errormsg += "Expirationdate is required\n";
        err = true;
    }
    if (Quotetitle.value == null || Quotetitle.value == "") {
        errormsg += "Quotetitle is required\n";
        err = true;
    }   
    if (err) {
        alert(errormsg);
    }         
    else {
        var xmlstr;
        
        xmlstr =   "<lineitems>" 
            
        for (i = 0; i < prodcount; i++)
        {   

            xmlstr = xmlstr + "<lineitem>"
            xmlstr = xmlstr + "<Item>" + document.getElementById("hdn_itempart_" + i).value +"</Item>";
            xmlstr = xmlstr + "<Manufacturer>" + document.getElementById("td_manufacturer_" + i).value +"</Manufacturer>";
            xmlstr = xmlstr + "<Description>" + document.getElementById("td_description_" + i).value +"</Description>";
            xmlstr = xmlstr + "<Supplier>" + document.getElementById("td_supplier_" + i).value +"</Supplier>";
            xmlstr = xmlstr + "<Qty>" + document.getElementById("qty_" + i).value + "</Qty>";
            xmlstr = xmlstr + "<SD>" + document.getElementById("td_Sd_" + i).value +"</SD>";
            xmlstr = xmlstr + "<BillingPeriod>" + document.getElementById("td_BillingPeriod_" + i).value + "</BillingPeriod>"
            xmlstr = xmlstr + "<StartDate>" + document.getElementById("td_StartDate_" + i).value + "</StartDate>";
            xmlstr = xmlstr + "<EndDate>" + document.getElementById("td_EndDate_" + i).value + "</EndDate>";
            xmlstr = xmlstr + "<UnitCost>" + document.getElementById("Ucost_" + i).value + "</UnitCost>";
            xmlstr = xmlstr + "<UnitPrice>" + document.getElementById("Uprice_" + i).value + "</UnitPrice>";
            xmlstr = xmlstr + "<ExtCost>" + document.getElementById("td_extcost_" + i).innerHTML + "</ExtCost>";
            xmlstr = xmlstr + "<ExtPrice>" + document.getElementById("td_extprice_" + i).innerHTML + "</ExtPrice>";
            xmlstr = xmlstr + "<GP>" + document.getElementById("td_gp_" + i).innerHTML + "</GP>";
            xmlstr = xmlstr + "<GPPercentage>" + document.getElementById("td_gppercentage_" + i).innerHTML + "</GPPercentage>";
            xmlstr = xmlstr + "</lineitem>";
        }
        
        xmlstr = xmlstr + "</lineitems>";  

  
        //for (i = 0; i < prodcount; i++) {
        //    var qty;
        //    var item
        //    qty = document.getElementById("qty_" + i).value
        //    item = document.getElementById("hdn_itempart_" + i).value
        //    alert(qty)
        //    alert(item)

        //}


        //for (i = 0; i < prodcount  ;i++) {
        //    var qty; /*= document.getElementById("qty_" + i).value*/
        //    qty = document.getElementById("qty_" + i).value
        //    alert(qty)
        //}
        
        document.getElementById("xml").value = xmlstr;
        document.getElementById("saction").value = "Addemp";
        document.forms[0].submit();
    }

}

function changeLineItems(i) {
   var ExtCost;
   var ExtPrice;
   var GP;
   var GPPercentage
   var Qty = document.getElementById("qty_" + i).value;
   var UnitCost = document.getElementById("Ucost_" + i).value;
   var UnitPrice = document.getElementById("Uprice_" + i).value;
   var SD = document.getElementById("td_Sd_" + i).value;
   var Monthly = document.getElementById("td_BillingPeriod_" + i).value;
  
   //var ExtCost =  parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitCost)) ;
   //var ExtPrice = parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitPrice)) ;

  
    
    //document.getElementById("td_extcost_" + i).innerHTML = ExtCost;
    //document.getElementById("td_extprice_" + i).innerHTML = ExtPrice;
   

    if (Monthly == "monthly") {
        ExtCost = parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitCost)) * 12;
        ExtPrice = parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitPrice)) * 12;
        document.getElementById("td_extcost_" + i).innerHTML = ExtCost;
        document.getElementById("td_extprice_" + i).innerHTML = ExtPrice;
        GP = parseFloat(ExtPrice) - parseFloat(ExtCost);
        GPPercentage = (((parseFloat(GP) / parseFloat(ExtCost)) * 100));
        document.getElementById("td_gp_" + i).innerHTML = GP;
        document.getElementById("td_gppercentage_" + i).innerHTML = GPPercentage.toFixed(2);
        
    }
    else {

        ExtCost = parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitCost));
        ExtPrice = parseFloat(SD) * (parseFloat(Qty) * parseFloat(UnitPrice));
        document.getElementById("td_extcost_" + i).innerHTML = ExtCost;
        document.getElementById("td_extprice_" + i).innerHTML = ExtPrice;
        GP = parseFloat(ExtPrice) - parseFloat(ExtCost);
        GPPercentage = (((parseFloat(GP) / parseFloat(ExtCost)) * 100));
        document.getElementById("td_gp_" + i).innerHTML = GP;
        document.getElementById("td_gppercentage_" + i).innerHTML = GPPercentage.toFixed(2);
    }

}


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

    /*if (paramtype == "PageSize") { pgnovalue = 1; }*/



    //document.getElementById("hdn_pg_no").value = pgnovalue;
    //document.getElementById("hdn_pg_size").value = pgsizeValue;

    //document.forms[0].submit();

    
    window.location.href = "https://localhost:44313/ViewQuotes.aspx?PageNo=" + pgnovalue + "&PageSize=" + pgsizeValue;

}

