@echo off
title Hosts �ļ�ͨ���滻�ű� 2.0
:main
cls
color 2E
echo -------------------------------------------------------------------------------
echo          �̡�    �̡�  �̡̡�      �̡̡̡�  �̡̡̡̡�    �̡̡̡�
echo          ��    ��  ��      ��  ��      ��  ��  ��  ��  ��      ��
echo          ��    ��  ��      ��  ��              ��      ��
echo          �̡̡̡�  ��      ��    �̡�          ��        �̡�
echo          ��    ��  ��      ��        ��        ��            ��
echo          ��    ��  ��      ��          ��      ��              ��
echo          ��    ��  ��      ��  ��      ��      ��      ��      ��
echo        �̡�    �̡�  �̡̡�    �̡̡̡�      �̡̡�    �̡̡̡�
echo --------------------------------------------------------------------------------
echo ����360�Ȱ�ȫ������ѣ��빴ѡ����Ͳ������ѣ�
echo.
echo ��OKEX �Ƿ��ڻ���Լթƭ��άȨ�ͻ��ر����ѣ�
echo.
echo ���ȴ򿪱�Ŀ¼�µ� hosts �ļ���ȥ��IP��ַǰ��ľ��ţ������нű�������������¼��
echo --------------------------------------------------------------------------------
echo.
echo ��ѡ��
echo.
echo  1.ʹ�ô�ǽ hosts
echo.
echo  2.���ư������� Aurora DNS Ŀ¼
echo.
echo  3.�ָ�ԭʼ hosts	
echo.
echo --------------------------------------------------------------------------------
echo.
if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=��������Ӧ���ֲ����س���ȷ��:

echo.
if %choice%==1 goto host DNS
if %choice%==2 goto AuroraDNS
if %choice%==3 goto CL
cls
"set choice="
echo ����������������ѡ��
goto main

:Win7Choice
choice /c 123 /n /m "��������Ӧ���֣�"
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
echo �ɹ����Ǳ��� hosts ��ˢ�±��� DNS ��������!
echo.
goto end

:AuroraDNS
@echo off
set "FileName=AuroraGUI.exe"
echo �������� Aurora DNS Ŀ¼�����Ժ�......
for %%a in ("%FileName%") do (
  set "nName=%%~na"
  set "xName=%%~xa"
)
set "xName=%xName:~1%"
for /f "skip=1 delims=" %%a in ('wmic datafile where "filename='%nName%' and Extension='%xName%'" get name') do (
  echo.
  echo ���ҵ� Aurora DNS Ŀ¼��%%~dpa
  echo.
  echo ���ڸ��ư������ļ������Ժ�......
  echo.
  copy /y %~dp0white.list %%~dpa\white.list
  echo.
  echo ������ɣ�
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
echo ��ϲ����hosts �Ѿ��ָ�ԭ״!
echo.
goto end

:end
echo �밴������˳���
@Pause>nul