// SA Index
gen SA = 0.043 * lnAsset * lnAsset - 0.737 * lnAsset - 0.04 * EstbDuration

// KZ Index
{
	// Generate Factor
	{
		// Ratio of Net CashFlow on l.Asset
		{
			rename C001000000 CF
			gen RatioCFA = 0
			replace RatioCFA = CF / l.Asset * 100 if l.Asset != 0
		}
		// Ratio of Div on l.Asset
		{
			rename F110101B divExT
			rename F110201B divPoT
			foreach div in ExT PoT {
				gen Div`div' = div`div' * Nshrttl
				gen RatioDiv`div'A = 0
				replace RatioDiv`div'A = Div`div' / l.Asset * 100 if l.Asset != 0
			}
		}
		// Ratio of Cash on l.Asset
		{
			rename C006000000 Cash
			gen RatioCA = 0
			replace RatioCA = Cash / l.Asset * 100 if l.Asset != 0
		}
	}
	// Generate kz
	foreach kz in RatioCFA RatioDivExTA RatioDivPoTA RatioCA {
		quietly sum `kz', detail
		local mid r(p50)
		gen kz`kz' = 0
		replace kz`kz' = 1 if `kz' < `mid'
	}
	foreach kz in Leverage TobinQ {
		quietly sum `kz', detail
		local mid r(p50)
		gen kz`kz' = 0
		replace kz`kz' = 1 if `kz' > `mid'
	}
	// Generate KZ, & Regression
	gen kzscor = kzRatioCFA + kzRatioDivExTA + kzRatioCA + kzLeverage + kzTobinQ
	// quietly xtologit kzscor RatioCFA RatioDivExTA RatioCA Leverage TobinQ
	quietly ologit kzscor RatioCFA RatioDivExTA RatioCA Leverage TobinQ, r
	// Replace KZ with KZhat = KZ - Resid
	predict KZ
	replace KZ = KZ * 100
	predict KZScore, xb
	// winsor2 KZ KZScore, cuts(1 99) replace
}
