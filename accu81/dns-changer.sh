#!/bin/bash

#add parameters from source file
source /home/parameters.conf

#get host ip address
host_ip="$(hostname -I | grep -o '^[^ ]*')"

#validation of input parameters
#if exist then rewrite parameter vm_name in souce file
if [[ -n "$1" ]]; then
	vm_name=$1
	sed -i "s/vm_name=.*/vm_name=\'${vm_name}\'/" "/home/parameters.conf"
fi

domain_name="${vm_name}.${domain}"

#get all information about dns_record
dns_record="$( \
	curl --no-progress-meter -X GET "https://api.cloudflare.com/client/v4/zones/${dns_zone}/dns_records?&name=${domain_name}" \
		-H "X-Auth-Email: ${email_address}" \
		-H "X-Auth-Key: ${auth_key}" \
		-H "Content-Type: application/json" \
)"

#get record id
dns_id="$(jq -r .result[].id <<< "$dns_record")"

#if record doesn't exist then will created new 
#if record exist then will started ip test
if [[ -z "$dns_id" ]]; then
	curl -X POST "https://api.cloudflare.com/client/v4/zones/${dns_zone}/dns_records" \
     		-H "X-Auth-Email: ${email_address}" \
     		-H "X-Auth-Key: ${auth_key}" \
     		-H "Content-Type: application/json" \
     		--data "{\"type\":\"A\",\"name\":\"${domain_name}\",\"content\":\"${host_ip}\"}"
else
	remote_ip="$(jq -r .result[].content <<< "$dns_record")"
	if [[ "$remote_ip" == "$host_ip" ]]; then
		echo "all fine"
	else
		curl --no-progress-meter -X PUT "https://api.cloudflare.com/client/v4/zones/${dns_zone}/dns_records/${dns_id}" \
     			-H "X-Auth-Email: ${email_address}" \
     			-H "X-Auth-Key: ${auth_key}" \
			-H "Content-Type: application/json" \
     			--data "{\"type\":\"A\",\"name\":\"${domain_name}\",\"content\":\"${host_ip}\"}"
	fi 
fi
