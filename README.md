# Two-Server Setup: Local API and Remote UI

This project demonstrates a two-server setup:
1. A local API server that provides data through RESTful endpoints
2. A remote UI server that serves a web interface and makes API calls to the local server

## Directory Structure

```
/workspace/
├── local-api-server/     # Flask API server
│   └── app.py            # API server code
└── remote-ui-server/     # Express.js UI server
    ├── public/           # Static files
    │   └── index.html    # UI interface
    ├── package.json      # Node.js dependencies
    └── server.js         # UI server code
```

## Running the Servers

### 1. Start the Local API Server

```bash
cd /workspace/local-api-server
python app.py
```

The API server will run on http://localhost:54512 with the following endpoints:
- GET /api/users - Returns a list of users
- GET /api/products - Returns a list of products
- GET /api/status - Returns the API status

### 2. Start the Remote UI Server

```bash
cd /workspace/remote-ui-server
npm start
```

The UI server will run on http://localhost:57028

## How It Works

1. The local API server (Flask) provides data through RESTful endpoints
2. The remote UI server (Express.js) serves the HTML/CSS/JavaScript interface
3. When the UI is loaded in a browser, JavaScript makes fetch requests to the local API server
4. The API responses are displayed in the UI

## CORS Configuration

Both servers are configured to handle Cross-Origin Resource Sharing (CORS):
- The Flask API server uses flask-cors to allow requests from any origin
- The Express UI server uses the cors middleware to handle CORS headers
