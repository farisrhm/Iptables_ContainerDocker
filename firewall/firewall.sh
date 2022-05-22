#!/bin/bash

SERVEUR_IP="172.16.31.2"
CLIENT_IP="192.168.1.2"


#Règle n°1 

sudo iptables -A INPUT -s $CLIENT_IP -d 192.168.1.1 -i enp0s8 -p icmp --icmp-type echo-request -j ACCEPT

#Règle n°2

sudo iptables -A OUTPUT -s 192.168.1.1 -d $CLIENT_IP -o enp0s8 -p icmp --icmp-type echo-reply -j ACCEPT

#Règle n°3 

#http
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 80 -j ACCEPT
#https
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 443 -j ACCEPT 
#smtp
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 25 -j ACCEPT 
#pop
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 110 -j ACCEPT 
#imap
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 143 -j ACCEPT 
#ssh
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p tcp --dport 22 -j ACCEPT 
#dns
sudo iptables -A FORWARD -s $CLIENT_IP -d $SERVEUR_IP -i enp0s8 -p udp --dport 53 -j ACCEPT 