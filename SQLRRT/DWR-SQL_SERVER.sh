#!/bin/bash 
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #
#
#cd ${0%/*}
#
# Initialize DWRT environment
#
source ./RRT-set-env.sh
#
# $_RUN_DWRT    -ds=<dataspace.xml> -j=<job-item-name> -i=<seed-item> -u=<user> [-p=<passwd>] [-a=<accfile-app>] [-af=<accfile>] [-d=rrt.properties]
# or 
# $_RUN_DWRT    -ds=<dataspace.xml> -jf=<job-file-name> -jm <mapping-schema-name> -i=<seed-item> -u=<user> [-p=<passwd>] [-a=<accfile-app>] [-af=<accfile>] [-d=rrt.properties]
# or 
# $_RUN_DWRT    -ds=<dataspace.xml> -jf=<job-file-name> -jm <mapping-schema-name> -if=<seed-item-file> -u=<user> [-p=<passwd>] [-a=<accfile-app>] [-af=<accfile>] [-d=rrt.properties]
# 
# please adjust the following statements
# 
# Rochade user
_DWRT_USR=ADMIN
#  
# Rochade password
_DWRT_PWD=rochade
#
# Seed item type is SQL/SERVER 
#  
# Seeditem name
_DWRT_ITM=*
#  
# JOB file
_DWRT_FILE=DWR-SQL_SERVER.xml
#  
# JOB mapping
_DWRT_MAP=DWR-MS_SQL_SERVER
#  
echo $_RUN_DWRT -ds=$_ROCHADE_DTSP -jf=$_DWRT_FILE -jm=$_DWRT_MAP -u=$_DWRT_USR -i=$_DWRT_ITM -p=****

$_RUN_DWRT -ds=$_ROCHADE_DTSP -jf=$_DWRT_FILE -jm=$_DWRT_MAP -u=$_DWRT_USR -i=$_DWRT_ITM -p=$_DWRT_PWD
ERR="$?"
#
#
exit $ERR


 
