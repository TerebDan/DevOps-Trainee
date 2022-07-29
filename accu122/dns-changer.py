import param
import sys
import socket
import requests

def main():
    
    #validation of input parameters
    if len(sys.argv) > 2:
        print("too many arguments")
        exit(1)
    elif len(sys.argv) == 2:
        vm_name = sys.argv[1]
    else:
        vm_name = param.vm_name
    

    domain_name = vm_name + "." + param.domain
    host_ip = socket.gethostbyname(socket.gethostname())

    #config input parameters for http request
    my_headers = {
    'X-Auth-Email': param.email_address,
    'X-Auth-Key': param.auth_key,
    'Content-Type': "application//json",
    }

    json_data = {
    'type': 'A',
    'name': domain_name,
    'content': host_ip,
    }

    #get data about DNS record
    response = requests.get(f"https://api.cloudflare.com/client/v4/zones/{param.dns_zone}/dns_records?&name={domain_name}", \
        headers=my_headers).json()
    
    #DNS record existence check
    try:
        dns_id = str(response["result"][0]["id"])
    except:
        dns_id = ""

    if dns_id:
        remote_ip = str(response["result"][0]["content"])
        if remote_ip==host_ip:
            #DNS record exists and contains up-to-date data
            print("all fine")
        else:
            #updating record if the DNS record exist but contain outdated data 
            requests.put(f"https://api.cloudflare.com/client/v4/zones/{param.dns_zone}/dns_records/{dns_id}", \
                headers=my_headers, json=json_data)
    else:
        #creating a new record if the DNS entry does not exist 
        requests.post(f"https://api.cloudflare.com/client/v4/zones/{param.dns_zone}/dns_records", \
            headers=my_headers, json=json_data)


main()
