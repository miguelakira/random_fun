#!/usr/bin/env ruby
require 'socket'
port = ARGV.shift

clientSession = TCPSocket.new("localhost", port)
puts "log: Iniciando conexao"
puts "log: Dizendo ola"
clientSession.puts("Client: Ola mund- digo, servidor!")
while !(clientSession.closed?) && (serverMessage = clientSession.gets)
    puts serverMessage
    if serverMessage.include?("Goodbye")
        puts "log: fechando conexao"
        clientSession.close
    end
end

