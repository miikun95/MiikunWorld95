#!/usr/bin/pwsh
Write-Progress -Activity "処理中" -Status "0 / 5" -PercentComplete 0
sudo git add -A
Write-Progress -Activity "処理中" -Status "1 / 5" -PercentComplete 20
sudo git commit -am "更新"
Write-Progress -Activity "処理中" -Status "2 / 5" -PercentComplete 40
sudo git push
Write-Progress -Activity "処理中" -Status "3 / 5" -PercentComplete 60
sudo git push github
Write-Progress -Activity "処理中" -Status "4 / 5" -PercentComplete 80
sudo git push gitlab
Write-Progress -Activity "処理中" -Status "5 / 5" -PercentComplete 100
Write-Progress -Activity "処理中" -Complete
