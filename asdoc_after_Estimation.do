global VarList var1 var2
local SavingFileName filenameforsaving

quietly asdoc sum $VarList, ///
	  stats(N mean sd min max) fs(9) dec(4) ///
	  save(`SavingFileName'.doc) replace

  // After Estimation
  quietly asdoc sum $VarList ///
	    if e(sample) == 1 , ///
	    stats(N mean sd min max) fs(9) dec(4) ///
	    save(`SavingFileName'.doc) replace
