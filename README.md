# docker-elk-proxy

The nginx powered image to proxy AWS ElasticSearch Kibana running within a VPC.

There are enviromental variables to set:
* SERVER_NAME (default is '_')
* AUTH (default is 'test:test')
* ELK_HOST (default is 'elk.example.com')
* SCHEME (default is 'https')

Example:
```
docker run -e "ELK_HOST=elk.jetbrains.com" -p 80:80 jetbrainsinfra/elk-proxy
```