#!/bin/bash
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #

function error
{
  echo -------------------------------------------------------------------------
  echo Error : SCANSQLSRVR cancelled due to an error in a processing step.
  echo -------------------------------------------------------------------------
  exit 2
}

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$DIR"

echo -------------------------------------------------------------------------
echo SCANSQLSRVR version 2.03 
echo Complete run...
echo -------------------------------------------------------------------------
echo
echo === Step 1: Scan database...
./ScanSqlSrvr-scan.sh
if [ "$?" -ge 2 ]; then error; fi

echo
echo === Step 2: Import scanner result into Rochade...
./ScanSqlSrvr-import.sh
if [ "$?" -ge 1 ]; then error; fi

echo
echo === Step 3: Run post processor for imported items...
./ScanSqlSrvr-post.sh
if [ "$?" -ge 2 ]; then error; fi

echo
echo -------------------------------------------------------------------------
echo SCANSQLSRVR completed successfully.
echo -------------------------------------------------------------------------
exit 0

