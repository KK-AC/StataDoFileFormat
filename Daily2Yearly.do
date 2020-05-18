// Transform daily to yearly
local Daily DailyData2Transform
gen day = date(`Daily',"YMD")
format day %td
gen Year = year(day)
drop day `Daily'
