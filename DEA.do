gen dmu = Individual_ID

global InputVar inputvar1 inputvar2 inputvar3
global OutputVar outputvar
global SaveFileName savefilename

dea $InputVar = $OutputVar, rts(vrs) ort(in) saving($SaveFileName)
matrix DEA_InOrient_`year' = r(dearslt)
