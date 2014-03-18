require 'socket'  

hostname = 'localhost'
port = 20000

streamSock = TCPSocket.new(hostname, port)  
streamSock.send("GoToServer\n", 0)
while line = streamSock.gets 
  puts line
end  

streamSock.close  
