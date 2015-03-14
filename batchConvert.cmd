@ECHO OFF
cls
REM Process all csv files in input directory
FOR /R .\input %%f IN (*.csv) DO (
	ECHO Processing full path:  %%f
	ECHO file: %%~nf.csv
	copy .\input\%%~nf.csv .\temp_in.csv
	start /WAIT excel .\ConvertDataFile.xlsm /e/FILES/temp_in.csv/Settings.xlsm/temp_out.xml
	del .\temp_in.csv
	move temp_out.xml .\output\%%~nf.xml
)
