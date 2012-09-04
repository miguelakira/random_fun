#!/usr/bin/env ruby

require 'socket'


port = ARGV.shift
if port.nil?
    puts "inicie o servidor com o comando ./server.rb <porta>, por exemplo ./server.rb 2008"
else
    puts "Iniciando servidor na porta #{port}..."
    #establish server 
    server = TCPServer.new(port)
    while (session = server.accept)
        #start new thread conversation
        ## Here we will stablish a new thread for a connection client
        Thread.start do 
            puts "log: Conexao de #{session.peeraddr[2]} em #{session.peeraddr[3]}"  
            puts "log: recebeu input do cliente"

            input = session.gets
            puts input
            session.puts "Server: bem-vindo #{session.peeraddr[2]}\n"
            puts "log: Enviando goodbye"
            session.puts "Server: Goodbye\n"
        end
    end
end