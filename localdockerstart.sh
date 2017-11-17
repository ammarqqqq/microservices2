export DNSDOMAIN=local.monifair.com
export DNSDOMAINIP=192.168.99.100
docker-machine start default
docker-machine env
sleep 2
eval $(docker-machine env)
docker-compose down -v --remove-orphans
#docker-compose up -d --force-recreate --build
#docker-compose -f docker-compose.blockchain.yml up -d --force-recreate --build
# optional: list machines, images, and containers
#docker-compose run --rm start_dependencies
docker-compose -f docker-compose.yml  -f docker-compose.override.yml  -f  docker-compose.blockchain.yml up -d --force-recreate --build
