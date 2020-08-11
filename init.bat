@echo off

SET pipurl=https://bootstrap.pypa.io/get-pip.py
SET env=python-env
SET pipfile=get-pip.py
SET libfile=%env%\lib
SET pth=python*._pth


if not exist %pipfile% (
	curl -o %pipfile% %pipurl%
)

if not exist %libfile% (
	cd %env%
	.\python ..\%pipfile%
	for /f "delims=" %%i in ('dir /b %pth%') do (
		(echo lib\site-packages) >> %%i
	)
)