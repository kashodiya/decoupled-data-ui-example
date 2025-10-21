
#!/bin/bash

# Start the local API server in the background
echo "Starting local API server on port 54512..."
cd /workspace/local-api-server
python app.py > api_server.log 2>&1 &
API_PID=$!
echo "Local API server started with PID: $API_PID"

# Wait a moment to ensure the API server is up
sleep 2

# Start the remote UI server in the background
echo "Starting remote UI server on port 57028..."
cd /workspace/remote-ui-server
npm start > ui_server.log 2>&1 &
UI_PID=$!
echo "Remote UI server started with PID: $UI_PID"

echo ""
echo "Both servers are now running:"
echo "- Local API server: http://localhost:54512"
echo "- Remote UI server: http://localhost:57028"
echo ""
echo "To stop the servers, run: kill $API_PID $UI_PID"
echo "To view server logs:"
echo "- API server: cat /workspace/local-api-server/api_server.log"
echo "- UI server: cat /workspace/remote-ui-server/ui_server.log"

# Save PIDs to a file for easy stopping later
echo "$API_PID $UI_PID" > /workspace/server_pids.txt
echo "Server PIDs saved to /workspace/server_pids.txt"
