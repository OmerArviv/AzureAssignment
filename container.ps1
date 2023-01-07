# $rGroup = 'rgroup1'
# $cName1 = 'container1'
# $cName2 = 'container2'

# # az group show `
# #     --name 'rgroup1'

# #az storage account keys list --account-name omerstorage1
# $acInfo1 = @(az storage account keys list --account-name omerstorage1 | ConvertFrom-Json)
# $acKey1 = $acInfo1[0].value
# write-output $acKey1

# $acInfo2 = @(az storage account keys list --account-name omerstorage2 | ConvertFrom-Json)
# $acKey2 = $acInfo2[0].value
# write-output $acKey2

# #creating 2 containers 

# az storage container create `
#     --name $cName1 `
#     --account-name omerstorage1 `
#     --public-access blob `
#     --account-key $acKey1


# az storage container create `
#     --name $cName2 `
#     --account-name omerstorage2 `
#     --public-access blob `
#     --account-key $acKey2



dir ENV:

# creating and uploading 100 files to container1 in omerstorage1

# New-Item -Path "C:\Users\User\OneDrive\Desktop\Azure" -Name "blobs" -ItemType "directory"

# $dirPath = "C:\Users\User\OneDrive\Desktop\Azure\blobs"

# for ($num = 1 ; $num -le 5 ; $num++) {
#     $fileName = "testfile" + $num + ".txt"
#     $fileText = "This is a text string number " + $num

#     New-Item -Path $dirPath -Name $fileName -ItemType "file" -Value $fileText
#     $filePath = $dirPath + "\" + $fileName

#     az storage blob upload `
#         -f $filePath `
#         -c $cName1 `
#         -n $fileName `
#         --account-name omerstorage1 `
#         --account-key $acKey1
    
    
#     Remove-Item $filePath
# }

# # delete blobs directory
# Remove-Item $dirPath

# # copying all the testfiles*.txt from container1 (omerstorage1) to container2 (omerstorage2)

# az storage blob copy start-batch `
#     --account-key $acKey2 `
#     --account-name omerstorage2 `
#     --destination-container $cName2 `
#     --source-uri https://omerstorage1.blob.core.windows.net/container1/ `
#     --pattern testfile*.txt




