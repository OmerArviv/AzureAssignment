

# deploying resource group

az group create -l centralus -n rgroup1

# deploying 2 storage accounts

az group deployment create -g rgroup1 --template-file .\storage1.json
az group deployment create -g rgroup1 --template-file .\storage2.json

$cName1 = 'container1'
$cName2 = 'container2'

# saving the account keys in variables

$acInfo1 = @(az storage account keys list --account-name omerstorage1 | ConvertFrom-Json )
$acKey1 = $acInfo1.value[0]

$acInfo2 = @(az storage account keys list --account-name omerstorage2 | ConvertFrom-Json)
$acKey2 = $acInfo2.value[0]


# #creating 2 containers 

az storage container create `
    --name $cName1 `
    --account-name omerstorage1 `
    --public-access blob `
    --account-key $acKey1


az storage container create `
    --name $cName2 `
    --account-name omerstorage2 `
    --public-access blob `
    --account-key $acKey2


 
# $dirPath = "C:\Users\User\OneDrive\Desktop\Azure\blobs"
# dir ENV:
$dirpath = $ENV:AGENT_BUILDDIRECTORY + "\blobs"

# creating a directory for the blob creating

New-Item -Path $ENV:AGENT_BUILDDIRECTORY -Name "blobs" -ItemType "directory"

#  creating and uploading 100 files to container1 in omerstorage1

for ($num = 1 ; $num -le 100 ; $num++) {
    $fileName = "testfile" + $num + ".txt"
    $fileText = "This is a text string number " + $num

    New-Item -Path $dirPath -Name $fileName -ItemType "file" -Value $fileText
    $filePath = $dirPath + "\" + $fileName

    az storage blob upload `
        -f $filePath `
        -c $cName1 `
        -n $fileName `
        --account-name omerstorage1 `
        --account-key $acKey1 `
        --overwrite       # can be removed if we don't want to overwrite existing files

    
    
    Remove-Item $filePath
}

# delete blobs directory
Remove-Item $dirPath

# # copying all the testfiles*.txt from container1 (omerstorage1) to container2 (omerstorage2)

az storage blob copy start-batch `
    --account-key $acKey2 `
    --account-name omerstorage2 `
    --destination-container $cName2 `
    --source-uri https://omerstorage1.blob.core.windows.net/container1/ `
    --pattern testfile*.txt