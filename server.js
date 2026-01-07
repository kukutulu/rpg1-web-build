const express = require("express");
const path = require("path");
const app = express();
const PORT = 8080;

// Middleware to handle gzip-compressed files
app.use((req, res, next) => {
  if (req.url.endsWith(".js.gz")) {
    res.set("Content-Encoding", "gzip");
    res.set("Content-Type", "application/javascript");
  } else if (req.url.endsWith(".wasm.gz")) {
    res.set("Content-Encoding", "gzip");
    res.set("Content-Type", "application/wasm");
  } else if (req.url.endsWith(".data.gz")) {
    res.set("Content-Encoding", "gzip");
    res.set("Content-Type", "application/octet-stream");
  }
  next();
});

// Serve static files
app.use(express.static(__dirname));

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
  console.log("Press Ctrl+C to stop");
});
