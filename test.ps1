Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

$context = Get-AzSubscription -SubscriptionId a8108c2b-496c-424d-8347-ecc8afb6384c

Write-Output $context
