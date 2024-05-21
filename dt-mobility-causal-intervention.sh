#!/bin/bash
ODTP_USER_EMAIL=
DT_PATH=$(pwd)

DIGITAL_TWIN_NAME=dt-mobility-causal-intervention
EXECUTION_NAME=dt-mobility-causal-intervention-execution-1

# Pulling all the components and versions
odtp new odtp-component-entry \
--name odtp-sql-dataloader \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-sql-dataloader

odtp new odtp-component-entry \
--name odtp-postgis-dataloader \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-postgis-dataloader

odtp new odtp-component-entry \
--name odtp-mobility-simulation \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-mobility-simulation

odtp new odtp-component-entry \
--name odtp-mobility-metrics \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-mobility-metrics

odtp new odtp-component-entry \
--name odtp-next-location-prediction \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-next-location-prediction

# Creating new digital twin
odtp new digital-twin-entry \
--user-email ${ODTP_USER_EMAIL}  \
--name ${DIGITAL_TWIN_NAME}

# Creating new execution
# TBD