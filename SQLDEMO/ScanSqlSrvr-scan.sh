#!/bin/bash
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #

echo -------------------------------------------------------------------------
echo SCANSQLSRVR version 2.03 DB Scanner
echo -------------------------------------------------------------------------

export JAVA_HOME="${javahome}"

ROC_BIN="${rocbase}/bin"
BIN="${rocbase}/scansqlsrvr/V203/bin"
CP="${rocbase}/scansqlsrvr/mssql-jdbc.jar":"$BIN/scansqlsrvr.jar":"$BIN/SQL2XML.jar":"$BIN/json.jar":"$BIN/SQLPostProcess.jar":"$BIN/ScannerUtils.jar":"$ROC_BIN/roacccxj.jar":"$ROC_BIN/ScanLogging.jar":"$ROC_BIN/rochade.jar"

echo Started : $(date)
echo Starting the scanner...
"$JAVA_HOME/bin/java" -cp "$CP" -Xmx1024m -Djava.util.logging.config.file="ScanSqlSrvr-scan-log.properties" com.rochade.scanrdbms.scd.ScanSQLServer -properties="ScanSqlSrvr-scan.properties"
RC="$?"
if [ "$RC" -gt 1 ]; then
  echo -------------------------------------------------------------------------
  echo Error : Scanner completed with error code $RC
  echo -------------------------------------------------------------------------
  echo Ended : $(date)
  exit $RC
fi
echo Ended : $(date)
exit 0
