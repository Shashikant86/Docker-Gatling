#!/bin/bash

GATLING_VERSION=2.2.5
cd ${WORKSPACE}

# Remove old Gatling reports and version Download New
echo "======== Remove old Gatling Snapshot if already exist ========== "
echo "*********************************\n "
rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION

echo "======== Downloading Gatling Framework from Web ========== "
echo "*********************************\n "
echo "========Please be patient as it might take some time depending on the network speed ========\n"
curl -sf -o ${WORKSPACE}/gatling-$GATLING_VERSION.zip \
  -L https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip
ls

echo "======== Gatling Zip successfully downloaded ========== "
echo "*********************************\n "

echo "======== Unziping Gatling ========== "
echo "*********************************\n "

unzip ${WORKSPACE}/gatling-$GATLING_VERSION.zip

chmod +x ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/bin/gatling.sh
 # Set GATLING_HOME

export GATLING_HOME=${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION

# Remove default simulations & Config and add our own

echo "======== Removing the default Simulations and replacing with our own \n ========== "
echo "*********************************\n "

rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/simulations/
rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/conf
cp ${WORKSPACE}/user-files/ ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/
cp ${WORKSPACE}/conf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/conf/

# RUN Gatling TEST WITH CLASS CLASS/TEST SCENARIO SPECIFIED
echo "======== Running Gatling Performance/Load Test \n ========== "
echo "*********************************\n "

sh ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/bin/gatling.sh -sf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/simulations/ -s SampleLoadTEST -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/results/
