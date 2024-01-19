#!/bin/bash
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #

echo -------------------------------------------------------------------------
echo ASG Rochade RDBMS PostProcessor V6
echo -------------------------------------------------------------------------
export JAVA_HOME="${javahome}"
   
SCNBIN="${instdir}\bin"
ROC="${rocbase}/bin"
CP1="$ROC/rochade.jar":"$ROC/js.jar":"$ROC/ScanLogging.jar":"$ROC/roacccxj.jar":"${rocbase}/bin/scansqlsrvr.jar":"$SCNBIN/SQLPostProcess.jar":"${instdir}/bin/rochade_ui.jar"
CP2="$SCNBIN/ScannerUtils.jar":"$SCNBIN/SQL2XML.jar":"$SCNBIN/ds-utils.jar":"$SCNBIN/json.jar":"${rocbase}/scansqlsrvr/V203/bin/ds-utils.jar"

   
ANA="${instdir}/bin/LINUX/sql2xml"
if [ ! -x "$ANA" ]; then
    # make the external analyzer executable
    chmod a+x "$ANA"
fi


echo Started : $(date)

"$JAVA_HOME/bin/java" -cp "$CP1":"$CP2" -Xmx4096m -Djava.library.path="$ROC" -Djava.util.logging.config.file="${cmdprefix}-post-log.properties" com.rochade.rdbms.post.SQLPostProcess -properties="${cmdprefix}-post.properties"
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

 