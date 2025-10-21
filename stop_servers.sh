

#!/bin/bash

if [ -f /workspace/server_pids.txt ]; then
    PIDS=$(cat /workspace/server_pids.txt)
    echo "Stopping servers with PIDs: $PIDS"
    kill $PIDS 2>/dev/null
    rm /workspace/server_pids.txt
    echo "Servers stopped successfully."
else
    echo "No server PIDs found. Servers may not be running."
    # Try to find and kill any Python or Node processes
    echo "Attempting to find and stop any running server processes..."
    pkill -f "python /workspace/local-api-server/app.py" 2>/dev/null
    pkill -f "node /workspace/remote-ui-server/server.js" 2>/dev/null
    echo "Done."
fi

