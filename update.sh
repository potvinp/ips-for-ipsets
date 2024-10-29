#!/bin/bash
USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"

echo -n "Fetching Cloudflare IPv4 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://www.cloudflare.com/ips-v4/ > cloudflare-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching Cloudflare IPv6 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://www.cloudflare.com/ips-v6/ > cloudflare-v6.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching HetrixTools IPv6 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://hetrixtools.com/resources/uptime-monitor-only-ips.txt > hetrixtools-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching UptimeRobot IPv4 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://uptimerobot.com/inc/files/ips/IPv4.txt > uptimerobot-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching UptimeRobot IPv6 addresses"
curl -H "User-Agent: $USER_AGENT" -s https://uptimerobot.com/inc/files/ips/IPv6.txt > uptimerobot-v6.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching PerplexityBot IPv4 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://www.perplexity.ai/perplexitybot.json | jq -r '.prefixes[].ipv4Prefix' > PerplexityBot-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching ShadowServer IPv4 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://raw.githubusercontent.com/NoahVail/BadIPs/main/shadowserver.txt | sed 's/#.*$//;/^$/d' > shadowserver-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching ShadowServer IPv6 addresses"
curl -H "User-Agent: $USER_AGENT" -w "\n" -s https://raw.githubusercontent.com/NoahVail/BadIPs/main/shadowserveripv6.txt | sed 's/#.*$//;/^$/d' > shadowserver-v6.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching NodePing IPv4 addresses"
dig @8.8.8.8 +short probes.nodeping.com in a | sort > nodeping-v4.txt
echo " [ Done ]"
sleep 2
echo -n "Fetching NodePing IPv6 addresses"
dig @8.8.8.8 +short probes.nodeping.com in aaaa | sort > nodeping-v6.txt
echo " [ Done ]"
