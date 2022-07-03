curl -H "Content-Type: application/json"  172.16.22.124:8545 -X POST --data '{"method":"eth_call","params":[{"from": "0x737a2816821a7d5a65028cd02ba9426d1c8036ca", "to": "0xd29bbc4895742b1f3f2bb85d866782f493493a8a", "data": "0x76ea87ac"}, "latest"],"id":1}'  > f1
#./f2.sh

