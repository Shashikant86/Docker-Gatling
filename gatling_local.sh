#!/bin/bash
GATLING_VERSION=2.2.5

# Remove old Gatling reports and version Download New
echo "======== Remove old Gatling Snapshot if it's there  ========== "
echo "*********************************\n "
rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/
rm -rf gatling-${GATLING_VERSION}.zip/

echo "======== Downloading Gatling Framework from Web ========== "
echo "*********************************\n "
curl -sf -o gatling-${GATLING_VERSION}.zip \
  -L https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip
ls
echo "======== Gatling Zip successfully downloaded ========== "
echo "*********************************\n "

echo "======== Unziping Gatling. Please be patient as it wil take some tme depending on network ========== "
echo "*********************************\n "
unzip gatling-${GATLING_VERSION}.zip

chmod +x gatling-charts-highcharts-bundle-${GATLING_VERSION}/bin/gatling.sh
 # Set GATLING_HOME

export GATLING_HOME=gatling-charts-highcharts-bundle-${GATLING_VERSION}

# Remove default simulations and Config and add our own

echo "======== Removing the default Simulations and replacing with our own \n ========== "
echo "*********************************\n "

rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/conf
cp -rf user-files/ gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
cp -rf config/ gatling-charts-highcharts-bundle-${GATLING_VERSION}/config

# RUN Gatling TEST WITH CLASS CLASS/TEST SCENARIO SPECIFIED

echo "======== Running Gatling Performance/Load Test \n ========== "
echo "*********************************\n "
sh gatling-charts-highcharts-bundle-${GATLING_VERSION}/bin/gatling.sh -sf gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/simulations/ -s SampleLoadTest -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/results/
