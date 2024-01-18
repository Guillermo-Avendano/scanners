#!/bin/bash 
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #
# ************************************************      
# Define Rochade environment                            
# ************************************************      
#                                                       
_ROCHADE_HOME=${rocbase}
#                                                       
# ************************************************      
# Define Java environment                               
# ************************************************      
#                                                       
_JAVA_HOME=${javahome}
#
# ************************************************
_ROCHADE_BIN=$_ROCHADE_HOME/bin
# 
# Define dataspace file, please adjust next line only if standard is not used
# 
_ROCHADE_DTSP=RRT-dataspace.xml
# 
# ************************************************
# Define Java options, please adjust if required only
# ***************************************************
# _JAVA_OPTS=
#
_JAVA_OPTS=-Xmx4096m 
#
# cache options
# set _DWRT_COPTS=-cs=<cnt> -ct=<cnt>  -cd=[0|1|2] -perf -threads=<numThreads>
# cs & ct defaults are 10000, 0 disables the cache
# cd 0 - no cache statistics, 1 & 2 cache statistics
# perf - enables the performance logging
# threads - enables multi-threading
# numThreads - number of threads used
#
_DWRT_OPTS='-cd=1 -threads=4'
#
_RUN_JAVA="$_JAVA_HOME/bin/java $_JAVA_OPTS"
# 
_CP="$_ROCHADE_BIN/rrt.jar:$_ROCHADE_BIN/rochade.jar:$_ROCHADE_BIN/roacccxj.jar:$_ROCHADE_BIN/js.jar"
# 
_RUN_DWRT="$_RUN_JAVA -cp $_CP com.rochade.rrt.ReconciliationToolkit $_DWRT_OPTS"

