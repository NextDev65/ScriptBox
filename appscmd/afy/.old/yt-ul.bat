@echo off

for /f "tokens=*" %%f in ('dir /B /O:D *.mp4') do (
  ::echo %%f
  youtube-uploader -filename "%%f" -categoryId 20 -secrets client_secret_40253407573-0svqts338qd0hdihnd047dkqme7b8l0q.apps.googleusercontent.com.json -description "" && del "%%f"
)

EXIT /b
