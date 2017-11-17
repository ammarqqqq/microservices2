#!/bin/sh

########################################################################
#
# title:          Microservices Soci80Bank Project Integration Tests
# author:         Arne-Richard Hofsøy
# url:            https://github.com/fintechinnovationas/microservices
# description:    Performs integration tests on the Sosi80Bank
#                 microservices
# to run:         sh tests.sh
# docker-machine: sh tests.sh $(docker-machine ip test)
#
# See also: https://programmaticponderings.com/2015/06/27/continuous-integration-and-delivery-of-microservices-using-jenkins-ci-docker-machine-and-docker-compose/
########################################################################

echo --- Liveness Tests ---
echo

### VARIABLES ###
hostname=${1-'localhost'} # use input param or default to localhost
application="Test API Client $(date +%s)" # randomized
secret="$(date +%s | sha256sum | base64 | head -c 15)" # randomized
make="Test"
model="Foo"

echo hostname: ${hostname}
echo domainenv : ${DNSDOMAIN}
echo application: ${application}
echo secret: ${secret}
echo make: ${make}
echo model: ${model}
echo

### TESTS ###
echo "TEST: GET request should return microservices in the response body"
url="https://"${DNSDOMAIN}
echo ${url}
curl --user serviceadmin:admin1234 -X GET -H 'Accept: application/json; charset=UTF-8' \
--url "${url}" \
| grep microservices > /dev/null
[ "$?" -ne 0 ] && echo "RESULT: fail" && exit 1
echo "RESULT: pass"
echo
