global VarToIpolate var1 var2

foreach i in $VarToIpolate{
    by IdvID: ipolate `i' TimeID, gen(`i'Iplt)
    // by IdvID: ipolate `i' TimeID, epolate gen(`i'Iplt)
    replace `i'Iplt = 0 if `i'Iplt <= 0
}
