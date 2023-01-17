

# az login
# az account set --name MSEC_Candidates_Homeworks_new

#creating resource group
$rgroup = 'rgroup1'

az group create -l centralus -n $rgroup
az config set defaults.location=centralus defaults.group=$rgroup

#creating the vm group

az group deployment create -g $rgroup --template-file .\linuxt.json --parameters @linuxt-parameters.json



