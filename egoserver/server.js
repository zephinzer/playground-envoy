const http = require('http')
const port = process.env.PORT || 3000;
const name = process.env.NAME || 'unnamed';
const wait = process.env.WAIT ? process.env.WAIT : 0;

const requestHandler = (request, response) => {
  setTimeout(() =>
    response.end(JSON.stringify({
      message: `Hello, I'm ${name}`,
      headersReceived: {
        headers: request.headers,
        method: request.method,
      },
    }, null, 2)), wait);
};

const server = http.createServer(requestHandler);

server.listen(port, (err) => {
  if (err) {
    console.log('something bad happened', err);
    process.exit(1);
  }
  console.log(`server [${name}] is listening on ${port}.`);
});
