export DNSDOMAIN=local.monifair.com
export DNSDOMAINIP=192.168.1.15  #change  with  ipaddress of Ubuntu machine
#docker-machine start default
#docker-machine env
#sleep 2
#eval $(docker-machine env)
docker-compose down -v --remove-orphans
#docker-compose up -d --force-recreate --build
# optional: list machines, images, and containers
#docker-compose run --rm start_dependencies
docker-compose up  --force-recreate --build
#docker-compose -f docker-compose.yml  -f docker-compose.blockchain.yml up --force-recreate --build
