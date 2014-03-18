require "socket"  
server = TCPServer.new('localhost', 20000)  

loop do  
  Thread.start(server.accept) do |client|  
    print(client, " is accepted\n") 
    client.puts "Hello" 
    client.send("GoTo\n", 0)
    client.write(Time.now)
    coming_data = client.gets
    puts "Incoming: #{coming_data}"
    print(client, " is gone\n")  
    client.close  
  end  
end  
