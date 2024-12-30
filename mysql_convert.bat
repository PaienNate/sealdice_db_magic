chcp 65001
@echo off
rem 获取当前 bat 文件所在的目录
set SCRIPT_DIR=%~dp0

rem 设置 Java 的相对路径
set JAVA_HOME=%SCRIPT_DIR%jre
set PATH=%JAVA_HOME%\bin;%PATH%

rem 设置 Python 的相对路径
set PYTHON_HOME=%SCRIPT_DIR%python
set PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%

echo -----TESTING JAVA----------
rem 测试 Java 是否可用
java -version
echo -----TESTING JAVA END---------- 

echo -----TESTING PYTHON---------- 
rem 测试 Python 是否可用
python --version
echo -----TESTING PYTHON END---------- 

rem 执行 DataX 脚本
rem 转换data.db
python bin\datax.py script_mysql\attrs.json
python bin\datax.py script_mysql\ban_info.json
python bin\datax.py script_mysql\endpoint_info.json
python bin\datax.py script_mysql\group_info.json
python bin\datax.py script_mysql\group_player_info.json
rem 转换data-logs.db
python bin\datax.py script_mysql\log_items.json
python bin\datax.py script_mysql\logs.json
pause