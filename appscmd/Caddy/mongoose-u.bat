@echo on

pushd "%CD%"
cd /d "%~dp0"

del mongoose.exe
curl -o mongoose.exe https://mongoose.ws/downloads/mws/mongoose.exe

popd

EXIT /b
