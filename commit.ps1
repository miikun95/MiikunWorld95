#!/usr/bin/pwsh
param(
  [Parameter(Mandatory = $true)]
  [string]$Message
)
Set-Location /srv/www/
Write-Progress -Activity "処理中" -Status "0 / 6" -PercentComplete 0
sudo git add -A
Write-Progress -Activity "処理中" -Status "1 / 6" -PercentComplete 17
sudo git commit -am "$Message"
Write-Progress -Activity "処理中" -Status "2 / 6" -PercentComplete 34
sudo git push
Write-Progress -Activity "処理中" -Status "3 / 6" -PercentComplete 51
Set-Location /srv/www/git/html/miikunworld95.git/
sudo git update-server-info
Write-Progress -Activity "処理中" -Status "4 / 6" -PercentComplete 68
Set-Location /srv/www/
sudo git push github
Write-Progress -Activity "処理中" -Status "5 / 6" -PercentComplete 85
sudo git push gitlab
Write-Progress -Activity "処理中" -Status "6 / 6" -PercentComplete 100
Write-Progress -Activity "処理中" -Complete
