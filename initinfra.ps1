

# az login
# az account set --name MSEC_Candidates_Homeworks_new

#creating resource group


az group create -l centralus -n rgroup1
az config set defaults.location=centralus defaults.group=rgroup1

# #creating 2 storage accounts

# az group deployment create -g rgroup1 --template-file .\storage1.json
# az group deployment create -g rgroup1 --template-file .\storage2.json

#creating the vm group

az group deployment create -g rgroup1 --template-file .\linuxt.json --parameters @linuxt-parameters.json



#setup environment
#Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

# $context = Get-AzSubscription -SubscriptionId a8108c2b-496c-424d-8347-ecc8afb6384c
# Set-AzContext $context

#create resource group

# New-AzResourceGroup `
#   -Name "rgroup1" `
#   -Location "centralus"

# Set-AzDefault -ResourceGroupName rgroup1

#creatine blanktemplatedeployment 

# $templateFile="template.json"
# $today=Get-Date -Format "MM-dd-yyyy"
# $deploymentName="blanktemplate-"+"$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -TemplateFile $templateFile

#creating 2 storage accounts   

# $templateFile = "storage1.json"
# $today = Get-Date -Format "MM-dd-yyyy"
# $deploymentName = "addstorage-" + "$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -TemplateFile $templateFile

# $templateFile = "storage2.json"
# $today = Get-Date -Format "MM-dd-yyyy"
# $deploymentName = "addstorage2-" + "$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -TemplateFile $templateFile


#creating virutalnetwork + subnets

# $templateFile="vnet-subnets.json"
# $today=Get-Date -Format "MM-dd-yyyy"
# $deploymentName="create-vnetwork-subnets"+"$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -ResourceGroupName "rgroup1" `
#   -TemplateFile $templateFile

#create nic with public ip

# $templateFile="nic-publicip.json"
# $templateparameterfile="nic-publicip-parameters.json"
# $today=Get-Date -Format "MM-dd-yyyy"
# $deploymentName="create-nic-publicip"+"$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -ResourceGroupName "rgroup1" `
#   -TemplateFile $templateFile `
#   -TemplateParameterFile $templateparameterfile


# creating security group

# $templateFile="security-group.json"
# $today=Get-Date -Format "MM-dd-yyyy"
# $deploymentName="create-security-group"+"$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -ResourceGroupName "rgroup1" `
#   -TemplateFile $templateFile
  

# #creating linux vm

# $templateFile = "linuxt.json"
# $today = Get-Date -Format "MM-dd-yyyy"
# $deploymentName = "createlvm-" + "$today"
# New-AzResourceGroupDeployment `
#   -Name $deploymentName `
#   -ResourceGroupName "rgroup1" `
#   -TemplateFile $templateFile



#ssh Omer@simplelinuxvm-zxelw3vh7ich6.centralus.cloudapp.azure.com