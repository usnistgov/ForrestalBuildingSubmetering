# ForrestalBuildingSubmetering
Project to convert Forrestal Building data to Green Button

## Data files
Data files are obtained from DOE and converted via git clone git@github.com:boscomonkey/pepco-submeter.git project

The resulting csv files can be converted to Green Button using this project

## Excel spreadsheet conversions

### ConvertDataFile.xlsm
This file contains Excel macros that can transform csv data to xml Green Button

### Settings.xlsm
This file contains the descriptions of each UsagePoint in the csv files to be converted. Contains identifiers and UUIDs as well as ReadingType and LocalTimeParamters data.


## some useful batch files (dos command files)
###process.cmd
batch file to curl up all data in the ./output directory

curl -v -k --cacert ~/git/energyos/test/OpenESPI-GreenButtonCMDTest/SOAPUI/etc/openespi.pem --header "Content-Type:application/xml" --header "Authorization: Bearer 688b026c-665f-4994-9139-6b21b13fbeee" -X POST -d "@DEM_Report_01-01-14.xml" "https://localhost:8443/DataCustodian/espi/1_1/resource/Batch/RetailCustomer/15/UsagePoint"

###doConvert.cmd
converts a data file

###batchConvert.cmd
converts all csv data files in ./input directory to green button xml files in ./output directory
