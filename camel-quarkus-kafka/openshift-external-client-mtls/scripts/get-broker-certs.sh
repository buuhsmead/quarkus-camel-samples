#!/usr/bin/env bash

PROJECT_HOME=$(pwd)/../

OCP_PROJECT=labs-amq-streams
STRIMZI_CLUSTER=labs-cluster

CERT_DIR=${PROJECT_HOME}/kafka-cert

echo "Creating destination for retrieved certificates at [${CERT_DIR}]"
mkdir -p ${CERT_DIR}

echo "Get client certificate"
oc get secret ${STRIMZI_CLUSTER}-clients-ca-cert -n ${OCP_PROJECT} -o jsonpath='{.data.ca\.p12}'| base64 -d > ${CERT_DIR}/client-ca.p12

echo "Get client certificate password"
oc get secret ${STRIMZI_CLUSTER}-clients-ca-cert -n ${OCP_PROJECT} -o jsonpath='{.data.ca\.password}' | base64 -d > ${CERT_DIR}/client-ca.password

echo "Get strimzi cluster certificate"
oc get secret ${STRIMZI_CLUSTER}-cluster-ca-cert -n ${OCP_PROJECT} -o jsonpath='{.data.ca\.p12}'| base64 -d > ${CERT_DIR}/cluster-ca.p12

echo "Get strimzi cluster certificate password"
oc get secret ${STRIMZI_CLUSTER}-cluster-ca-cert -n ${OCP_PROJECT} -o jsonpath='{.data.ca\.password}'| base64 -d > ${CERT_DIR}/cluster-ca.password

echo "Overview of retrieved information in:"
echo "${CERT_DIR}"
ls -l ${CERT_DIR}
