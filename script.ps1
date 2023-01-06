#setup environment
#Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

$Path = "C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Program Files\Git\cmd;C:\Program Files\nodejs\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\dotnet\;C:\Users\User\AppData\Local\Programs\Python\Python39;C:\Users\User\AppData\Local\Programs\Python\Python39\Scripts;C:\Program Files\PowerShell\7\;C:\Users\User\AppData\Local\Microsoft\WindowsApps;C:\Users\User\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\User\AppData\Roaming\npm;C:\Users\User\.dotnet\tools"

# $context = Get-AzSubscription -SubscriptionId a8108c2b-496c-424d-8347-ecc8afb6384c
# Set-AzContext $context

#create resource group

az group create -l centralus -n rgroup1
az config set defaults.location=centralus defaults.group=rgroup1

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

az account list --all

# az group deployment create -g rgroup1 --template-file .\storage1.json
# az group deployment create -g rgroup1 --template-file .\storage2.json

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