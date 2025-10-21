# Two-Server Setup: Local API and Remote UI

This project demonstrates a two-server setup:
1. A local API server that provides data through RESTful endpoints
2. A remote UI server that serves a web interface and makes API calls to the local server

## Directory Structure

```
./
├── local-api-server/     # Flask API server
│   └── app.py            # API server code
└── remote-ui-server/     # Express.js UI server
    ├── public/           # Static files
    │   └── index.html    # UI interface
    ├── package.json      # Node.js dependencies
    └── server.js         # UI server code
```

## Requirements

### Local API Server
- Python 3.6+
- Flask (`pip install flask`)
- Flask-CORS (`pip install flask-cors`)

### Remote UI Server
- Node.js 14+
- npm or yarn

## Running the Servers

### 1. Start the Local API Server

```bash
cd local-api-server
python app.py
```

The API server will run on http://localhost:54512 with the following endpoints:
- GET /api/users - Returns a list of users
- GET /api/products - Returns a list of products
- GET /api/status - Returns the API status

### 2. Start the Remote UI Server

```bash
cd remote-ui-server
npm start
```

The UI server will run on http://localhost:57028

### Using Convenience Scripts

This repository includes scripts to easily start and stop both servers:

```bash
# Start both servers
./start_servers.sh

# Stop both servers
./stop_servers.sh
```

The start script will launch both servers in the background and save their PIDs to `server_pids.txt`.

## How It Works

1. The local API server (Flask) provides data through RESTful endpoints
2. The remote UI server (Express.js) serves the HTML/CSS/JavaScript interface
3. When the UI is loaded in a browser, JavaScript makes fetch requests to the local API server
4. The API responses are displayed in the UI

## Configurable API URL

The UI includes a feature to configure the API server URL:

1. At the top of the UI, you'll find an input field for the API server URL
2. By default, it's set to `http://localhost:54512/api`
3. You can change this to point to a different API server if needed
4. Click "Save & Connect" to update the configuration
5. The UI will show the connection status (running or offline)
6. The setting is saved in localStorage for persistence

## CORS Configuration

Both servers are configured to handle Cross-Origin Resource Sharing (CORS):
- The Flask API server uses flask-cors to allow requests from any origin
- The Express UI server uses the cors middleware to handle CORS headers
