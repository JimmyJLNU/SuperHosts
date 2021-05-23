@echo off
title Hosts 文件通用替换脚本 2.0
:main
cls
color 2E
echo -------------------------------------------------------------------------------
echo          √√    √√  √√√      √√√√  √√√√√    √√√√
echo          √    √  √      √  √      √  √  √  √  √      √
echo          √    √  √      √  √              √      √
echo          √√√√  √      √    √√          √        √√
echo          √    √  √      √        √        √            √
echo          √    √  √      √          √      √              √
echo          √    √  √      √  √      √      √      √      √
echo        √√    √√  √√√    √√√√      √√√    √√√√
echo --------------------------------------------------------------------------------
echo 如有360等安全软件提醒，请勾选允许和不再提醒！
echo.
echo “OKEX 非法期货合约诈骗”维权客户特别提醒：
echo.
echo 请先打开本目录下的 hosts 文件，去掉IP地址前面的井号，再运行脚本，即可正常登录！
echo --------------------------------------------------------------------------------
echo.
echo 请选择：
echo.
echo  1.使用穿墙 hosts
echo.
echo  2.复制白名单到 Aurora DNS 目录
echo.
echo  3.恢复原始 hosts	
echo.
echo --------------------------------------------------------------------------------
echo.
if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=请输入相应数字并按回车键确认:

echo.
if %choice%==1 goto host DNS
if %choice%==2 goto AuroraDNS
if %choice%==3 goto CL
cls
"set choice="
echo 您输入有误，请重新选择。
goto main

:Win7Choice
choice /c 123 /n /m "请输入相应数字："
if %errorlevel%==1 goto host DNS
if %errorlevel%==2 goto AuroraDNS
if %errorlevel%==3 goto CL
cls
goto main

:host DNS
cls
color 2f
ver|find /i " 10.0">nul &&echo y|cacls "%SystemRoot%\System32\drivers\etc\hosts" /c /p Everyone:f
attrib -r -s -h %SystemRoot%\System32\drivers\etc\hosts
copy /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
echo.
echo --------------------------------------------------------------------------------
echo.
echo 成功覆盖本地 hosts 并刷新本地 DNS 解析缓存!
echo.
goto end

:AuroraDNS
@echo off
set "FileName=AuroraGUI.exe"
echo 正在搜索 Aurora DNS 目录，请稍候......
for %%a in ("%FileName%") do (
  set "nName=%%~na"
  set "xName=%%~xa"
)
set "xName=%xName:~1%"
for /f "skip=1 delims=" %%a in ('wmic datafile where "filename='%nName%' and Extension='%xName%'" get name') do (
  echo.
  echo 已找到 Aurora DNS 目录：%%~dpa
  echo.
  echo 正在复制白名单文件，请稍候......
  echo.
  copy /y %~dp0white.list %%~dpa\white.list
  echo.
  echo 复制完成！
  echo.
  goto end
)


:CL
cls
color 2f
ver|find /i " 10.0">nul &&echo y|cacls "%SystemRoot%\System32\drivers\etc\hosts" /c /p Everyone:f
attrib -r -s -h %SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1 localhost > %SystemRoot%\System32\drivers\etc\hosts
echo.
echo 恭喜您，hosts 已经恢复原状!
echo.
goto end

:end
echo 请按任意键退出。
@Pause>nul