require "db"
require "pg"
require "http/server"

# the database config - there must be a neater way to do this...
config = {
  host: "db",
  port: 5432,
  dbname: "postgres",
  user: "postgres",
  password: "weak-password"
}
db_conn_string = "postgres://#{config[:user]}:#{config[:password]}@#{config[:host]}:#{config[:port]}/#{config[:dbname]}"

# sets up a database connection
connection = PG.connect(db_conn_string)

# sets up a simple web server
server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"

  response = ""

  # loops through rows from the table database and adds them to the response
  beatles = connection.query "SELECT name FROM beatles"  do |rs|
    rs.each do
      name = rs.read(String)
      response += "#{name}\n"
    end
  end

  context.response.print response
end

# NOTE: If docker is forwarding to this port it needs to be bound to 0.0.0.0 (not the default of of localhost 127.0.0.1)
address = server.bind_tcp "0.0.0.0", 8080
puts "Listening on http://#{address}"
server.listen