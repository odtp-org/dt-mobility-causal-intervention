#!/bin/bash
ODTP_USER_EMAIL=maxm@gmail.com
DT_PATH=$(pwd)

DIGITAL_TWIN_NAME=dt-mobility-causal-intervention-full
EXECUTION_NAME=execution-1

rm  ${DT_PATH}/${DIGITAL_TWIN_NAME}/${EXECUTION_NAME}/.gitkeep

# Pulling all the components and versions
odtp new odtp-component-entry \
--name odtp-sql-dataloader \
--component-version v0.1.0 \
--repository https://github.com/odtp-org/odtp-sql-dataloader

odtp new odtp-component-entry \
--name odtp-postgis-dataloader \
--component-version v0.1.1 \
--repository https://github.com/odtp-org/odtp-postgis-dataloader

odtp new odtp-component-entry \
--name odtp-mobility-simulation \
--component-version v0.1.0 \
--repository https://github.com/odtp-org/odtp-mobility-simulation

odtp new odtp-component-entry \
--name odtp-mobility-metrics \
--component-version v0.0.2 \
--repository https://github.com/odtp-org/odtp-mobility-metrics

odtp new odtp-component-entry \
--name odtp-next-location-prediction \
--component-version v0.0.2 \
--repository https://github.com/odtp-org/odtp-next-location-prediction

odtp new odtp-component-entry \
--name odtp-pygwalker \
--component-version v0.1.3 \
--repository https://github.com/odtp-org/odtp-pygwalker

# Creating new digital twin
odtp new digital-twin-entry \
--user-email ${ODTP_USER_EMAIL}  \
--name ${DIGITAL_TWIN_NAME}

# Creating new execution
odtp new execution-entry \
--name ${EXECUTION_NAME} \
--digital-twin-name ${DIGITAL_TWIN_NAME} \
--component-tags odtp-sql-dataloader:v0.1.0,odtp-postgis-dataloader:v0.1.1,odtp-mobility-simulation:v0.1.0,odtp-mobility-metrics:v0.0.2,odtp-next-location-prediction:v0.0.2,odtp-pygwalker:v0.1.3 \
--parameter-files ${DT_PATH}/${DIGITAL_TWIN_NAME}/001.parameters,${DT_PATH}/${DIGITAL_TWIN_NAME}/002.parameters,${DT_PATH}/${DIGITAL_TWIN_NAME}/003.parameters,${DT_PATH}/${DIGITAL_TWIN_NAME}/004.parameters,${DT_PATH}/${DIGITAL_TWIN_NAME}/005.parameters, \
--ports ,,,,,8555:8501

# Preparing execution
odtp execution prepare \
--execution-name ${EXECUTION_NAME} \
--project-path ${DT_PATH}/${DIGITAL_TWIN_NAME}/${EXECUTION_NAME}

# Running execution
odtp execution run \
--execution-name ${EXECUTION_NAME} \
--secrets-files ${DT_PATH}/${DIGITAL_TWIN_NAME}/001.secrets,${DT_PATH}/${DIGITAL_TWIN_NAME}/002.secrets,,,, \
--project-path ${DT_PATH}/${DIGITAL_TWIN_NAME}/${EXECUTION_NAME} \


#odtp execution delete --execution-name execution --project-path ${DT_PATH}/${DIGITAL_TWIN_NAME}/${EXECUTION_NAME}