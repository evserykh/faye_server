Faye messaging server with authentication and Redis-backend support

More info:

* http://faye.jcoglan.com
* https://github.com/dimelo/faye-authentication
* https://github.com/faye/faye-redis-ruby

### How to start

```
git clone https://github.com/evserykh/faye_server.git && cd faye_server
bundle
cp config/settings.yml.example config/settings.yml
```

Specify settings in **config/settings.yml** and run server with

```
bundle exec puma
```

### Usage with Nginx
**TL;DR**

```
location LOCATION {
  proxy_pass PROXY_PATH_TO_FAYE_SERVER;
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "upgrade";
}
```

Details http://nginx.org/en/docs/http/websocket.html
