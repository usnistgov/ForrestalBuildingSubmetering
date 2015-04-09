@ECHO OFF
cls
REM Curl up all files in output directory
FOR /R .\output %%f IN (*.xml) DO (
	ECHO Processing full path:  %%f

curl -v -k --cacert ~/git/energyos/test/OpenESPI-GreenButtonCMDTest/SOAPUI/etc/openespi.pem --header "Content-Type:application/xml" --header "Authorization: Bearer 688b026c-665f-4994-9139-6b21b13fbeee" -X POST -d "@.\output\%%~nf.xml" "https://localhost:8443/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/15/UsagePoint"
	
	move .\output\%%~nf.xml .\archive
)

