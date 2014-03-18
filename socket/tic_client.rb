require 'socket'

hostname = 'localhost'
port = 2000

stream_socket = TCPSocket.open(hostname, port)

data = stream_socket.gets.chop

while data != "QUIT"
  token = data.split
  case token[0]
  when "PNT"
    puts token[1,token.size-1].join(" ")
  when "BRD"
    puts "#{token[1]}|#{token[2]}|#{token[3]}"
    puts "-----"
    puts "#{token[4]}|#{token[5]}|#{token[6]}"
    puts "-----"
    puts "#{token[7]}|#{token[8]}|#{token[9]}"
  when "REQ"
    puts "Where do you want to move <1-9>?"
    move = gets.to_i
    while(move > 9 or move < 1)
      puts "You input the wrong position! Input again!!"
      puts "Where do you want to move <1-9>?"
      move = gets.to_i
    end
    stream_socket.puts move
  when "CLR"
    system("clear")
  end
    data = stream_socket.gets.chop
end

stream_socket.close

