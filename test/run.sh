#!/bin/bash
status=0
container_host="${1:-nginx}"

echo "Testing $container_host host"
# Test /version
echo -n "Test /version contains correct container version: "
if [[ $(curl -s $container_host/version) =~ "CONTAINER_VERSION=test" ]]; then
  echo "Success!"
else
  echo "Failed!"; ((status++))
fi

# Check redirect
echo -n "Test: path / should return 301 redirect to _plugin/kibana/: "
if [[ $(curl -s -o /dev/null -w "%{http_code} %{redirect_url}" $container_host) = "301 http://$container_host/_plugin/kibana/" ]]; then
  echo "Success!"
else
  echo "Failed!"; ((status++))
fi

# Check proxypass
echo -n "Test: header HOST test should route to test_host: "
if [[ $(curl -H 'Host: test' -s $container_host/_plugin/kibana/) = "test_host" ]]; then
  echo "Success!"
else
  echo "Failed!"; ((status++))
fi

echo -n "Test: header HOST test2 should route to elk_host2: "
if [[ $(curl -H 'Host: test2' -s $container_host/_plugin/kibana/) = "test_host2" ]]; then
  echo "Success!"
else
  echo "Failed!"; ((status++))
fi

echo -n "Test summary: "
if [[ $status = 0 ]]; then
  echo "Success!"
else
  echo "Failed!"
fi
exit $status
