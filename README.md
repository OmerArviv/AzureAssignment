# AzureAssignment

Hey,
welcome to AzureAssignment README :

my first task was to create 1 Resource Group, which I named "rgroup1",
with 2 Storage Users, named "omerstorage1/2".

after that I've created a Linux Virtual Machine named "simpleLinuxVM", which uses:
    - "simpleLinuxVMNetInet" as a network interface.
    - "simpleLinuxVMPublicIP" as a public IP.
    - "Vnet1" as a virtual network.
    - "networkSecurityGroup" as a network security group.

I've created a tool of powershell using Azure CLI.
Running it with Azure DevOps Pipeline to deploy the Storage accounts and the server in a continuous manner.

I've made a script the creates and upload 100 text files as blobs, and copying them from "omerstorage1" to "omerstorage2".

The agent is my pc.
