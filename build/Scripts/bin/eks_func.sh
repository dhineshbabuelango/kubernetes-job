#!/bin/bash

#****************************************************************
#Function to create log files
#****************************************************************
function _log

{

if [ -z "$1" ]; then
        echo "[WHAT]:[$(date)]:Log info is missing $1"
else
        echo "[$(date)]:$1" |tee -a "${LOG_FILE_NAME}"
fi
}

#****************************************************************
#Function to create directories
#****************************************************************
function _val_dir
{
if [[ ! -d "$1" ]]; then
#        _log "[INFO]:Directory doesnot exists $1"
        mkdir -p "$1"
        chmod -R 755 "$1"

else
        _log "[INFO]:Directory $1 exists, Do nothing"
fi
}
#****************************************************************
#Function to create files
#****************************************************************
function _val_file
{
if [[ ! -f "$1" ]];then
        _log "[INFO]:File deosn't exists"
        if touch "$1"
        	then
        	_log "[INFO]:file $1 created successfully"
        else
        	_log "[ERROR]:Error creating the file $1"
        fi

else
        _log "[INFO]:File  exists"
fi
}

