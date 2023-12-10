const http = require('node:http');
const url = require('url');
const PORT = 3000;
const SERVER = 20.244.34.80
const server = http.createServer((req,res)=>{
   if(req.url == "/"){
       res.end(" You are on home page");
   } 
   else if(req.url == "/contact"){
    res.end(" You are on contact page");
   } 
  else if(req.url == "/about"){
    res.end(" You are on about page");
   } 
   else{
       res.writeHead(403, {"content-type":"text/html"});
       res.end("Page Not Found")
    }
})

server.listen($PORT, "", ()=>{
    console.log("Listening to Port number 3000")
})
