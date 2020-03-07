FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add wireguard-lts wireguard-tools-wg wireguard-tools bash

# Use iptables masquerade NAT rule
#ENV IPTABLES_MASQ=1
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Use iptables masquerade NAT rule
#ENV IPTABLES_MASQ=1


COPY start /start

# Normal behavior is just to run wireguard with existing configs
CMD ["./start"]
