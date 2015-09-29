function do_statistics(input_params){
    var args = {};
    var match = null;
    var search = decodeURIComponent(location.search.substring(1));
    var reg = /(?:([^&]+)=([^&]+))/g;
    while((match = reg.exec(search))!==null){
        args[match[1]] = match[2];
    }
    var input_statistics = args.statistics;
    var input_referrer = document.referrer;
    $.post("/ajax/statistics/do_statistics",{statistics:input_statistics,referrer:input_referrer,params:input_params},function(data){
           
    });  
}

$(function(){
    var static_income = $("#static_income").val();
    var static_caseid = $("#static_caseid").val();
    var static_uid = $("#static_uid").val();
    var static_isreg = $("#static_isreg").val();
    var static_isactive = $("#static_isactive").val();
    var static_has_pay = $("#static_has_pay").val();

    var input_params = {
        income:static_income,
        caseid:static_caseid,
        uid:static_uid,
        isreg:static_isreg,
        isactive:static_isactive,
        has_pay:static_has_pay,
    };
    do_statistics(input_params);
});
