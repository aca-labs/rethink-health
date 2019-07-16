require "crystal-rethinkdb"

include RethinkDB::Shortcuts

HOST = ENV["RETHINKDB_HOST"]? || "localhost"
PORT = ENV["RETHINKDB_PORT"]? || "28015"

begin
  cxn = r.connect(
    host: HOST,
    port: PORT,
    db: "rethinkdb",
  )
  r.table("server_status").pluck("id", "name").run(cxn).to_a.first
rescue e
  puts e
  exit(1)
end
