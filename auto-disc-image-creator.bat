:loop
cdbxpcmd --wait-for-disc -device:0

for /f "tokens=2 delims==" %%G in ('wmic os get localdatetime /value') do set datetime=%%G
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%
set hour=%datetime:~8,2%
set minute=%datetime:~10,2%
set second=%datetime:~12,2%
set newdatetime=%year%-%month%-%day% %hour% %minute% %second%

cdbxpcmd --burn-data -folder:g:\ -iso:"%newdatetime%.iso" -format:iso -changefiledates
cdbxpcmd --eject -device:0

goto loop