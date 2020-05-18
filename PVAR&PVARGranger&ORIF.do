global PVARVarList var1 var2 var3

// PVAR
pvar $ECO, lags(1) fod instlag(1/2) gmmstyle vce(robust)

pvargranger

pvarirf, oirf byoption(xrescale yrescale b1title("Forecast horizon") l1title("Orthogonalized impulse response function") ) yline(0) xlabel(0(2)10) porder($ECO)

// Graph Export
graph save Graph OirfRescale-L1IL12.gph, replace
graph export OirfRescale-L1IL2.emf, replace
