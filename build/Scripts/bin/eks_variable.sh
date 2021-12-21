#!/bin/bash
#********************************************************************
#Declare Environment Variables.
#********************************************************************

home_dir=$(echo "$bin_dir"|sed -e 's/\/bin//g')

export home_dir

export log_dir=${home_dir}/logs
export conf_dir=${home_dir}/config
url="https://github.com/phayes/geoPHP/tarball/master"
