const http = require('http');
const { createClient } = require('redis');

const port = process.env.PORT || 3000;
const redisUrl = process.env.REDIS_URL || 'redis://localhost:6379';

const client = createClient({ url: redisUrl });

client.on('error', (err) => console.log('Redis Client Error', err));

async function startServer() {
  await client.connect();

  const server = http.createServer(async (req, res) => {
    if (req.url === '/favicon.ico') {
      res.statusCode = 204;
      return res.end();
    }

    // Incrémente le compteur de visites dans Redis
    const visits = await client.incr('visits');

    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(`Hello from Docker Compose & Redis!\nNombre de visites: ${visits}\n`);
  });

  server.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
}

startServer();