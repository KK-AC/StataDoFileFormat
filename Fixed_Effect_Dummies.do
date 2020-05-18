// Fixed Effects
{
 	// Generate dummies
	quietly tab Year, gen(yr)
	// Drop base
	drop yr1
  
	// Generate dummies
	quietly tab Indcd, gen(ind)
	// Drop base
	drop ind1
  
	// Fixed Effets
	global FE yr* ind*
}
