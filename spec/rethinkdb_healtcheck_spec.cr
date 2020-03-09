require "spec"
require "../src/rethinkdb-health"

describe "rethinkdb-health" do
  it "healthchecks" do
    healthcheck.should be_truthy
  end
end
