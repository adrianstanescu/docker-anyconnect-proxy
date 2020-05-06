# Docker Anyconnect Socks Proxy

## Setup

Create a `.env` file and set the environment variables as in `.env.example`:
```
ANYCONNECT_SERVER=vpn.example.com
ANYCONNECT_USERNAME=username@example.com
ANYCONNECT_PASSWORD=password
```
Review the socks proxy configuration file `danted.conf`

⚠️ Warning: by default, the configuration file allows connections from anywhere to anywhere without authentication.

Check https://www.inet.no/dante/doc/1.3.x/config/server.html for more info.

## Run
`docker-compose up`