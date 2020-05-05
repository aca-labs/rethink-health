require "rethinkdb"

include RethinkDB::Shortcuts

HOST = ENV["RETHINKDB_HOST"]? || "localhost"
PORT = (ENV["RETHINKDB_PORT"]? || 28015).to_i

def healthcheck
  cxn = r.connect(
    host: HOST,
    port: PORT,
    db: "rethinkdb",
    max_retry_attempts: 1,
  )
  r.table("server_status").pluck("id", "name").run(cxn).to_a.first
rescue e
  puts e
  exit(1)
end
