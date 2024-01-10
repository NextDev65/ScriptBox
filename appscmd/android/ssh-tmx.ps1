$androidIP = Get-Content -Path (Join-Path $PSScriptRoot ".cfg\andip.txt")
ssh $androidIP -p 8022 $args

Exit
