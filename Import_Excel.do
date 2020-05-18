cd "FileDirectory"
import excel "ExcelFileName.xlsx", sheet("Sheet1") firstrow clear

// Label, if import from CSMAR
foreach i of varlist * {
	local vlabel = `i'[1]
	label var `i' "`vlabel'"
}
drop in 1/2
