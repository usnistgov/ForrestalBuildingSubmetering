#!/bin/bash

echo "processing load xml files: on $(date)" 

for file in /home/net0/load/*.xml ; do

	echo processing $file

	echo "*************************************************"
	echo "load on $(date) of $file" 
	curl --header "Content-Type:text/xml" -X POST -d @$file http://localhost:80/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/14
	echo "*************************************************"

done

