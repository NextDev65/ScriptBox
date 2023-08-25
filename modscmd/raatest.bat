::https://stackoverflow.com/a/54150008

@echo off

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  rem need to get admin rights, check batch script Elevate.cmd to see how to do that
  echo You have no admin rights. Cannot continue.
  goto end

:gotPrivileges
  echo You have admin rights. Continuing...
  rem *** do your admin tasks here ***

:end
  pause