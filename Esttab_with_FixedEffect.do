global DV DependentVariable
global IV InddependentVariable
global CV ControlVariable

// Estimation Store
eststo clear

// Regression
eststo: quietly xtreg $DV $IV $CV $FE, fe r

// Estimation Tabulate, without ControlVar nor FixedEffect nor Constant
esttab , b(%9.4f) t(%9.3f) star(* 0.1 ** 0.05 *** 0.01) r2 ar2 nogaps noeqlines compress drop($CV $FE _cons)

// Export
local FileName FileName
esttab , b(%9.4f) t(%9.3f) star(* 0.1 ** 0.05 *** 0.01) r2 ar2 nogaps noeqlines compress order(`IV'), using `FileName'.rtf, replace
