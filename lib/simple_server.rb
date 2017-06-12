require "socket"

PORT = ENV['PORT'] || 8080
server = TCPServer.open(PORT)

puts "Listening PORT: #{PORT}"

def read_html
	File.open(File.expand_path('../index.html', __FILE__)) do |f|
    f.read
  end
end

while true
  Thread.start(server.accept) do |socket|
    p socket.peeraddr

    request = socket.gets
    p request

    content = read_html
    socket.write <<-EOF
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Server: rserver
Connection: close

#{content}
    EOF

    socket.close
  end
end

server.close
