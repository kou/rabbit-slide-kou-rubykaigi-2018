require "groonga/client"

url = "http://localhost:10041"
Groonga::Client.open(url: url) do |client|
  response =
    client.select(table: "docs",
                  match_columns: "content",
                  query: "concat")
  p response.n_hits
end
