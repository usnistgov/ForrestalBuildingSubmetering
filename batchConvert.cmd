@ECHO OFF
cls
REM Process all xlsx files in input directory
FOR /R .\input %%f IN (*.xlsx) DO (
	ECHO Processing full path:  %%f
	ECHO file: %%~nf.xlsx
	copy .\input\%%~nf.xlsx .\temp_in.xlsx
	start /WAIT excel .\ConvertDataFile.xlsm /e/FILES/temp_in.xlsx/Settings.xlsm/temp_out.xml
	del .\temp_in.xlsx
	move temp_out.xml .\output\%%~nf.xml
)
