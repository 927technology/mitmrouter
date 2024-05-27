### MITM Router

## Usage

```
mkdir -p ~/mitmproxy
chown 1000:1000 ~/mitmproxy
sudo mkdir /var/log/mitmproxy
sudo chown 1000:1000 /var/log/mitmproxy

docker run                      \
  -d                            \
  --rm                          \
  --hostname mitmrouter         \
  -p 80:8080                    \
  -p 443:8080                   \
  -p 8080:8080                  \
  -p 8081:8081                  \
  -e MODE=proxy                 \
  -e WEB_HOST=0.0.0.0           \
  -v ~/mitmproxy:/etc/mitm      \
  -v /var/log/mitmproxy:/var/log/mitmproxy  \
  927technology/mitmrouter:0.0.2

```

Port 8081 is used for the web interface to review traffic http://<host_ip>:8081

Port 8080 is the proxy port.  It only listens when the router is in proxy mode.  

Ports 80 and 443 are redirected to 8080 when router is in transparent mode.  


## Modes
regular - This allows you to run each application proxy settings through the router.  Settings require you to set the application or global system settings to proxy through the host's IP on port 8080 for http and TLS traffic

socks5

transparent - this allows you to run the router as an in-line device without any proxy configuration on the client.

## Certificate
When the router starts it generates certs for use in the TLS process.  The certs must be trusted by your application or OS.  