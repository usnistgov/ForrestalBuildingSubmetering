#!/bin/bash

echo "processing incoming xml files: on $(date)"  >> /home/net0/log/results.log

for file in /home/net0/incoming/*.xml ; do

	echo processing $file

	echo "   " >> /home/net0/log/results.log
	echo "*************************************************" >> /home/net0/log/results.log
	echo "upload on $(date) of $file"  >> /home/net0/log/results.log
	/opt/bitnami/common/bin/curl --header "Content-Type:text/xml" -X POST -d @$file http://localhost:80/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/14 >> /home/net0/log/results.log 2>&1
	echo "*************************************************" >> /home/net0/log/results.log
	echo "   " >> /home/net0/log/results.log

	mv /home/net0/incoming/$(basename $file) /home/net0/load/$(basename $file)

done

