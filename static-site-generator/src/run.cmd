ECHO OFF
SETLOCAL
ECHO "Installing dependencies..."
CALL npm install

ECHO "Running gulp..."
CALL .\node_modules\.bin\gulp
ENDLOCAL
