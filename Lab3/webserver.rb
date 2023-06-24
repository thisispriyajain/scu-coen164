#!/usr/bin/ruby
require "socket"

port = ARGV[0].to_i

if ARGV.empty? || port <= 0 || port > 99999 || ARGV[0][0] == '0' || ARGV[0].length < 4 || ARGV[0].length > 5
	puts "Usage: ruby web_server.rb [port]"
	puts "Port number must be a numerical value between 1000 and 99999 with no leading zeros"
	exit
end

server = TCPServer.new("127.0.0.1", 1234)
Socket.accept_loop(server) do |connection|
	request = connection.gets
	#GET /hello.htm HTTP/1.1
	request = request.gsub(/GET\ \//, "").gsub(/\ HTTP.*/, "")
	puts request
	filename = request.chomp #remove carriage return/stuff at the end
	if filename == ""
		filename = "index.html"
	end
	begin
		f = File.open(filename, "r")
		content = f.read() #read everthing into string
		#construct response document
		connection.print "HTTP/1.1 200 OK\r\n"
		connection.print "Content-type:text/html\r\n"
		connection.print "Content-Length: #{content.length}"
		connection.print "Connection:close\r\n"
		connection.print "\r\n"
		connection.print content
	rescue Errno::ENOENT
		connection.print "HTTP/1.1 404 Not Found\r\n"
		connection.print "Server: my sever"
		connection.print "Connection:close\r\n"
		conneciton.print "\r\n"
		connection.print "<h1>File not found...</h1>"
	end
	connection.close
end