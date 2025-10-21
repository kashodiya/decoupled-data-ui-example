
const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();

// Enable CORS for all routes
app.use(cors());

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Main route
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server
const PORT = 57028; // Using port 57028 as specified in the runtime information
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Remote UI server running on http://localhost:${PORT}`);
});
