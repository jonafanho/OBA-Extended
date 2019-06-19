del /q /f GTFS\*.txt

curl https://raw.githubusercontent.com/whatcomtrans/publicwtadata/master/GTFS/wta_gtfs_latest.zip > GTFS/WTA.zip
curl http://gtfs.s3.amazonaws.com/skagit-transit_20150429_1915.zip > GTFS/Skagit_Transit.zip
curl https://raw.githubusercontent.com/transitland/gtfs-archives-not-hosted-elsewhere/master/island-transit-wa-us.zip > GTFS/Island_Transit.zip
curl http://mjcaction.com/MJC_GTFS_Public/jefferson_google_transit.zip > GTFS/Jefferson_Transit.zip

GTFS\7za e GTFS/Skagit_Transit.zip -oGTFS

powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '80X - N3', '80X-N3'}) | Set-Content $_ }"
powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '80X - N4', '80X-N4'}) | Set-Content $_ }"
powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '80X - N5', '80X-N5'}) | Set-Content $_ }"
powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '90X -N1', '90X-N1'}) | Set-Content $_ }"
powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '90X -N4', '90X-N4'}) | Set-Content $_ }"
powershell -Command "gci GTFS/*.txt -recurse | ForEach { (Get-Content $_ | ForEach {$_ -replace '90X - S2', '90X-S2'}) | Set-Content $_ }"

GTFS\7za a GTFS/Skagit_Transit.zip ./GTFS/*.txt

del /q /f GTFS\*.txt

GTFS\7za a GTFS/Skagit_Transit.zip ./GTFS/Patches/*
GTFS\7za a GTFS/Island_Transit.zip ./GTFS/Patches/*
pause