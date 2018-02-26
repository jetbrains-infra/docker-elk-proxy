# docker-elk-proxy

The nginx powered image to proxy AWS ElasticSearch Kibana running within a VPC.

There are enviromental variables to set:
* SERVER_NAME (default is '_')
* AUTH (default is 'test:YZOheU342o4OU', which is 'test' in base64)
* ELK_HOST (default is 'elk.example.com')
* SCHEME (default is 'https')
* RESOLVER (default is '8.8.8.8')

Example:
```
docker run -e "ELK_HOST=elk.jetbrains.com" -p 80:80 jetbrainsinfra/elk-proxy
```