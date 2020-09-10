param(
  [Parameter(
    Mandatory = $true,
    ValueFromPipeline = $true)]
  [ValidateNotNullOrEmpty()]
  [String]$primaryuser
)

$objUser = New-Object System.Security.Principal.NTAccount("$primaryuser")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$primaryusersid = $strSID.Value
$userpath = (Get-CimInstance -ClassName Win32_UserProfile -Filter "sid LIKE '$($primaryusersid)'").LocalPath

return $userpath
