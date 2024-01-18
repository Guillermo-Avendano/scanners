#!/bin/bash
#  --------------------------------------------------------------------------- #
#  * Copyright (c) 1983-2024 Rocket Software, Inc. or its affiliates.       * #
#  * All rights reserved.                                                    * #
#  * This program is protected by U.S. and international copyright laws.     * #
#  --------------------------------------------------------------------------- #

INPUT="${xml-file}"
TARGET="${use-appl_appl-url}"
EXMOD="${instdir}/schema/SQL_exchModel.xml"


export JAVA_HOME="${javahome}"
BIN="${rocbase}/bin"
CP=$BIN/rochadexml.jar:$BIN/rochade.jar:$BIN/roacccxj.jar:$BIN/ScanLogging.jar
                
echo -------------------------------------------------------------------------
echo ASG Rochade XMLF2 import
echo -------------------------------------------------------------------------
echo Begin: $(date)
echo
echo importing    : $INPUT
echo into         : $TARGET
echo options      : -m="$EXMOD" -i="$INPUT" -t="$TARGET?pwd=%24%7Buse-appl_password%7D" -me=999999 --isThrowingExceptionOnDeferredError=off -ps="${accfile}" -g="${xml-file}.import.log" -ga=on
echo Java options : -Xmx1024m -Djava.library.path="$BIN" -Djava.util.logging.config.file="${cmdprefix}-import-log.properties"

"$JAVA_HOME/bin/java" -cp "$CP" -Xmx1024m -Djava.library.path="$BIN" -Djava.util.logging.config.file="${cmdprefix}-import-log.properties" de.rochade.xml.XmlImporter -m="$EXMOD" -i="$INPUT" -t="$TARGET?pwd=%24%7Buse-appl_password%7D" -me=999999 --isThrowingExceptionOnDeferredError=off -ps="${accfile}" -g="${xml-file}.import.log" -ga=on 2>&1
RC="$?"
echo End: $(date)

if [ "$RC" -gt 0 ]; then
    echo -------------------------------------------------------------------------
    echo Error : ASG Rochade XMLF2 import completed with error code $RC
    echo -------------------------------------------------------------------------
    exit $RC
fi

echo -------------------------------------------------------------------------
echo ASG Rochade XMLF2 import successful.
echo -------------------------------------------------------------------------
exit 0

