ECHO OFF
SETLOCAL
ECHO "Installing dependencies..."
CALL npm install

ECHO "Building project..."
CALL .\node_modules\.bin\gulp build-project
ENDLOCAL
