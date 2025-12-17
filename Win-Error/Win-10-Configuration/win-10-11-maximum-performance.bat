@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
SET MYERROR=%ERRORLEVEL%
echo powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 Error=%MYERROR%
echo powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 Error=%MYERROR% >> log.txt

chcp 866

control powercfg.cpl
