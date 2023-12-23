# OpenClash

[规则集](https://github.com/Loyalsoldier/clash-rules) 越多内存占用越大

## clash_tun

```yaml
dns:
  enable: true
  ipv6: false
  default-nameserver:
    - 223.5.5.5
    - 119.29.29.29
  nameserver:
    - https://doh.pub/dns-query
    - https://dns.alidns.com/dns-query
  fallback:
    - https://dns.cloudflare.com/dns-query
    - https://dns.twnic.tw/dns-query
    - tls://8.8.4.4:853
  fallback-filter: 
    geoip: true
    ipcidr: 
      - 240.0.0.0/4
      - 0.0.0.0/32

proxy-providers:
  yiyuan:
    type: http
    url: "https://yiyuan.com&flag=clash"
    interval: 900
    path: ./yiyuan.yaml
    health-check:
      enable: true
      interval: 600
      # lazy: true
      url: http://www.gstatic.com/generate_204

#代理组配置
proxy-groups:
  - name: 节点选择
    type: select
    proxies:
      - DIRECT
      - yiyuan机场
  - name: yiyuan机场
    type: select
    use:
      - yiyuan
  - name: 漏网之鱼
    type: select
    proxies:
      - DIRECT
      - 节点选择

rule-providers:
  代理域名:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/proxy.txt"
    path: ./ruleset/proxy.yaml
    interval: 86400

rules:
  # 内网-IP
  - IP-CIDR,0.0.0.0/8,DIRECT
  - IP-CIDR,10.0.0.0/8,DIRECT
  - IP-CIDR,100.64.0.0/10,DIRECT
  - IP-CIDR,127.0.0.0/8,DIRECT
  - IP-CIDR,169.254.0.0/16,DIRECT
  - IP-CIDR,172.16.0.0/12,DIRECT
  - IP-CIDR,192.0.0.0/24,DIRECT
  - IP-CIDR,192.0.2.0/24,DIRECT
  - IP-CIDR,192.88.99.0/24,DIRECT
  - IP-CIDR,192.168.0.0/16,DIRECT
  - IP-CIDR,198.18.0.0/15,DIRECT
  - IP-CIDR,198.51.100.0/24,DIRECT
  - IP-CIDR,203.0.113.0/24,DIRECT
  - IP-CIDR,224.0.0.0/3,DIRECT
  - IP-CIDR6,::1/128,DIRECT
  - IP-CIDR6,fc00::/7,DIRECT
  - IP-CIDR6,fe80::/10,DIRECT

  # Telegram
  - IP-CIDR,91.105.192.0/23,节点选择
  - IP-CIDR,91.108.4.0/22,节点选择
  - IP-CIDR,91.108.8.0/21,节点选择
  - IP-CIDR,91.108.16.0/21,节点选择
  - IP-CIDR,91.108.56.0/22,节点选择
  - IP-CIDR,95.161.64.0/20,节点选择
  - IP-CIDR,149.154.160.0/20,节点选择
  - IP-CIDR,185.76.151.0/24,节点选择
  - IP-CIDR6,2001:67c:4e8::/48,节点选择
  - IP-CIDR6,2001:b28:f23c::/47,节点选择
  - IP-CIDR6,2001:b28:f23f::/48,节点选择
  - IP-CIDR6,2a0a:f280::/32,节点选择

  - RULE-SET,代理域名,节点选择

  - GEOIP,CN,DIRECT
  - MATCH,漏网之鱼
```

## clash_meta

```yaml
dns:
  enable: true
  prefer-h3: true
  ipv6: true
  default-nameserver:
    - tls://223.5.5.5:853
    - https://223.5.5.5/dns-query
  nameserver:
    - https://dns.alidns.com/dns-query#h3=true
    - tls://223.5.5.5:853
    - tls://223.6.6.6:853
  fallback:
    - 8.8.8.8
    - 8.8.4.4
    - "tls://dns.google#节点选择"

# 代理配置
# proxies:
#   - name: "xxx"
#     type: vmess
#     server: xxx.xxx.xxx.xxx
#     port: 1234
#     uuid: xxxxxxxx
#     alterId: 0
#     cipher: auto

proxy-providers:
  yiyuan:
    type: http
    url: "https://yiyuan.com&flag=clash"
    interval: 900
    path: ./yiyuan.yaml
    

#代理组配置
proxy-groups:
  - name: 节点选择
    type: select
    proxies:
      - DIRECT
      - yiyuan机场
  - name: yiyuan机场
    type: select
    use:
      - yiyuan
  - name: 广告拦截
    type: select
    proxies:
      - REJECT
      - 节点选择
      - DIRECT
  - name: 漏网之鱼
    type: select
    proxies:
      - DIRECT
      - 节点选择

listeners:
  - name: socks5代理(全局)
    type: socks
    port: 10808
    listen: 0.0.0.0
    proxy: 节点选择 # 如果不为空则直接将该入站流量交由指定proxy处理
    udp: true
    # rule: sub-rule-name1 # 默认使用 rules，如果未找到 sub-rule 则直接使用 rules

rule-providers:
  代理域名:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/proxy.txt"
    path: ./ruleset/proxy.yaml
    interval: 86400
  TG_IP:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/telegramcidr.txt"
    path: ./ruleset/telegramcidr.yaml
    interval: 86400
  广告域名:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/reject.txt"
    path: ./ruleset/reject.yaml
    interval: 86400

rules:
  # 内网-IP
  - IP-CIDR,0.0.0.0/8,DIRECT
  - IP-CIDR,10.0.0.0/8,DIRECT
  - IP-CIDR,100.64.0.0/10,DIRECT
  - IP-CIDR,127.0.0.0/8,DIRECT
  - IP-CIDR,169.254.0.0/16,DIRECT
  - IP-CIDR,172.16.0.0/12,DIRECT
  - IP-CIDR,192.0.0.0/24,DIRECT
  - IP-CIDR,192.0.2.0/24,DIRECT
  - IP-CIDR,192.88.99.0/24,DIRECT
  - IP-CIDR,192.168.0.0/16,DIRECT
  - IP-CIDR,198.18.0.0/15,DIRECT
  - IP-CIDR,198.51.100.0/24,DIRECT
  - IP-CIDR,203.0.113.0/24,DIRECT
  - IP-CIDR,224.0.0.0/3,DIRECT
  - IP-CIDR6,::1/128,DIRECT
  - IP-CIDR6,fc00::/7,DIRECT
  - IP-CIDR6,fe80::/10,DIRECT

  - RULE-SET,代理域名,节点选择
  - RULE-SET,TG_IP,节点选择
  - RULE-SET,广告域名,广告拦截

  - GEOIP,CN,DIRECT
  - MATCH,漏网之鱼
```
