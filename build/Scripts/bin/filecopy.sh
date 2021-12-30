#!/bin/bash
#*********************************************************************************
#SCRIPT NAME: Filecopy.sh
#PURPOSE: Copy files to Kubernetes Cluster
#*********************************************************************************
os=$(uname)
if [[ ${os} = Darwin ]]; then
	run_dir=$(greadlink -f "$0")
	export run_dir
else
	run_dir=$(readlink -f "$0")
fi
bin_dir=$(dirname "$run_dir")
export bin_dir
PATH=$PATH:$bin_dir
export PATH

#***********************************************************************************
#Declare Variables
#***********************************************************************************
. "${bin_dir}/eks_variable.sh"
. "${bin_dir}/eks_func.sh"


curr_date_time=$(date +%Y%m%d%H%M%S)

export curr_date_time

export ldf_runtime_log_dir=${log_dir}/EKS_INFRA_SETUP_${curr_date_time}
export LOG_FILE_NAME=${ldf_runtime_log_dir}/eks_infra_setup_logs

_log "[INFO]: Downloading the file"

if curl ${url} -o ${conf_dir}/file.xml
    then
    _log "[INFO]: File downloaded Successfully and saved in ${conf_dir}"
    _log "[INFO]: Pushing the file to /data"
else 
    _log "[ERROR]: Error in Downloading the file"
    exit 1
fi