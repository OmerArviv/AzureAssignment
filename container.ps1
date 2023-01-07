$rGroup = 'rgroup1'
$cName1 = 'container1'
$cName2 = 'container2'

# az group show `
#     --name 'rgroup1'

#az storage account keys list --account-name omerstorage1

# 2 account keys for omerstorage1:
#   Ur1Cp9SEmQnlstxi4WKI5sW9f4MSHR66+2tJKAQtfZyMslZeqsYje+te8oi//yEw/arwVzQn0O1W+ASt1jOlnA==
#   +YRC/QsBsaCN1ko7C0dN/ePdHtKh9s24aUnI333u0fNA/bcpTSVGcj/PVXyMDAbUoNoYa659LWY9+AStKBoM8w==

#az storage account keys list --account-name omerstorage2

# 2 account keys for omerstorage2:
# RIeO3WmKsBcRYbKeIXrpyDLNIQeY8r7KQv5D8qfinyOUw98pkaGFdQ4eT9gESFvwes+ia5rjEM8N+AStmt+khw==
# fMETzLC5pFuNPwG9/KFXE9qCYXyRHTLPgkgSHS/jqDPn0EWEoiIHks/hDsbUB6REdGCbDIIN7Aqb+AStpBinYQ==

#creating 2 containers 

az storage container create `
    --name $cName1 `
    --account-name omerstorage1 `
    --public-access blob `
    --account-key Ur1Cp9SEmQnlstxi4WKI5sW9f4MSHR66+2tJKAQtfZyMslZeqsYje+te8oi//yEw/arwVzQn0O1W+ASt1jOlnA==


az storage container create `
    --name $cName2 `
    --account-name omerstorage2 `
    --public-access blob `
    --account-key RIeO3WmKsBcRYbKeIXrpyDLNIQeY8r7KQv5D8qfinyOUw98pkaGFdQ4eT9gESFvwes+ia5rjEM8N+AStmt+khw==



#Agent.BuildDirectory

# creating and uploading 100 files to container1 in omerstorage1

New-Item -Path "C:\Users\User\OneDrive\Desktop\Azure" -Name "blobs" -ItemType "directory"

$dirPath = "C:\Users\User\OneDrive\Desktop\Azure\blobs"

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
        --account-key Ur1Cp9SEmQnlstxi4WKI5sW9f4MSHR66+2tJKAQtfZyMslZeqsYje+te8oi//yEw/arwVzQn0O1W+ASt1jOlnA==
    
    
    Remove-Item $filePath
}
# delete blobs directory
Remove-Item $dirPath

# copying all the testfiles*.txt from container1 (omerstorage1) to container2 (omerstorage2)

az storage blob copy start-batch `
    --account-key RIeO3WmKsBcRYbKeIXrpyDLNIQeY8r7KQv5D8qfinyOUw98pkaGFdQ4eT9gESFvwes+ia5rjEM8N+AStmt+khw== `
    --account-name omerstorage2 `
    --destination-container $cName2 `
    --source-uri https://omerstorage1.blob.core.windows.net/container1/ `
    --pattern testfile*.txt




