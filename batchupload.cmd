@ECHO OFF
rem set HOST=http://192.168.227.135:8080
set HOST=https://services.greenbuttondata.org
@ECHO Process all xml files in input directory
FOR /R incoming %%f IN (*.xml) DO (
	echo start %date% %time% processing %%f >> .\log\results.log
	echo "*************************************************" >> .\log\results.log
	echo "upload of %%f"  >> .\log\results.log
	curl --header "Content-Type:application/xml" --header "Authorization: Bearer 688b026c-665f-4994-9139-6b21b13fbeee" -X POST -d@%%f "%HOST%/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/15/UsagePoint" >> .\log\results.log 2>&1
	
	echo complete %date% %time% >> .\log\results.log
	echo "*************************************************" >> .\log\results.log
	echo "   " >> .\log\results.log

	move %%f load
)
