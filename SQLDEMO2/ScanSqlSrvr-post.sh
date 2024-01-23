#!/bin/bash
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #

echo -------------------------------------------------------------------------
echo ASG Rochade RDBMS PostProcessor V6
echo -------------------------------------------------------------------------
export JAVA_HOME="/usr/lib/jvm/jre"
   
SCNBIN="/home/rocket/rochade/scansqlsrvr/V203/bin"
ROC="/home/rocket/rochade/bin"
CP1="$ROC/rochade.jar":"$ROC/js.jar":"$ROC/ScanLogging.jar":"$ROC/roacccxj.jar":"/home/rocket/rochade/scansqlsrvr/V203/bin/scansqlsrvr.jar":"$SCNBIN/SQLPostProcess.jar":"./bin/rochade_ui.jar"
CP2="$SCNBIN/ScannerUtils.jar":"$SCNBIN/SQL2XML.jar":"$SCNBIN/ds-utils.jar":"$SCNBIN/json.jar":"/home/rocket/rochade/scansqlsrvr/V203/bin/ds-utils.jar"

   
ANA="./bin/LINUX/sql2xml"
if [ ! -x "$ANA" ]; then
    # make the external analyzer executable
    chmod a+x "$ANA"
fi


echo Started : $(date)

"$JAVA_HOME/bin/java" -cp "$CP1":"$CP2" -Xmx4096m -Djava.library.path="$ROC" -Djava.util.logging.config.file="ScanSqlSrvr-post-log.properties" com.rochade.rdbms.post.SQLPostProcess -properties="ScanSqlSrvr-post.properties"
RC="$?"
if [ "$RC" -gt 2 ]; then
    echo -------------------------------------------------------------------------
    echo Error : RDBMS Post Processor completed with error code $RC
    echo -------------------------------------------------------------------------
    echo Ended : $(date)
    exit $RC
fi
echo Ended : $(date)
exit 0

 