@echo off

pushd "%CD%"
cd /d "%~dp0"

caddy run --config Caddyfile

popd
