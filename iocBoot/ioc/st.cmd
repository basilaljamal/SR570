#!../../bin/linux-x86_64/ioc

## You may have to change ioc to something else
## everywhere it appears in this file

#< iocBoot/ioc/envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH","protocol")
cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ioc.dbd"
ioc_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/App.db")

drvAsynSerialPortConfigure("SR570","/dev/ttyUSB0",0,0,0) 
asynSetOption("serial0", -1, "baud", "9600") 
asynSetOption("serial0", -1, "bits", "8") 
asynSetOption("serial0", -1, "parity", "none") 
asynSetOption("serial0", -1, "stop", "2") 

cd "${TOP}/iocBoot/${IOC}"

< iocBoot/ioc/autosave.cmd

iocInit

create_monitor_set("pv.req", 1)
## Start any sequence programs
#seq sncxxx,"user=basilHost"
