#!/bin/bash

# Function to check if the port is in use
check_port() {
  lsof -i :8000 &> /dev/null
  if [ $? -eq 0 ]; then
    echo "Port 8000 is already in use. Trying to kill the process using port 8000."
    PID=$(lsof -ti :8000)
    kill -9 $PID
    if [ $? -eq 0 ]; then
      echo "Successfully killed the process using port 8000."
    else
      echo "Failed to kill the process using port 8000. Please try manually."
      exit 1
    fi
  fi
}

# Script'in bulunduğu dizine git
cd "$(dirname "$0")" || exit

# Bulunduğu dizini kontrol et ve ekrana yaz
echo "Current directory: $(pwd)"

# Check and free the port if in use
check_port

# Start http-server
http-server "$(pwd)" -p 8000 &

# Wait for the server to start
sleep 2

# Open the default browser
open http://localhost:8000

# Keep the terminal open
echo "Server is running. Close the terminal or press CTRL+C to stop the server."
read -p "Press ENTER to exit..."


#!/bin/bash

