var err = initInstall("Polski slownik poprawnej pisowni", "pl@dictionaries.addons.mozilla.org", "1.0.20110621");
if (err != SUCCESS)
    cancelInstall();

var fProgram = getFolder("Program");
err = addDirectory("", "pl@dictionaries.addons.mozilla.org",
		   "dictionaries", fProgram, "dictionaries", true);
if (err != SUCCESS)
    cancelInstall();

performInstall();