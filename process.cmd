@ECHO OFF
cls
REM Curl up all files in output directory
FOR /R .\output %%f IN (*.xml) DO (
	ECHO Processing full path:  %%f

curl -v --header "Content-Type:application/xml" --header "Authorization: Bearer 688b026c-665f-4994-9139-6b21b13fbeee" -X POST -d "@.\output\%%~nf.xml" "http://services.greenbuttondata.org/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/14/UsagePoint"
	
	move .\output\%%~nf.xml .\archive
)

