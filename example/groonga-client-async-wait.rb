require "groonga/client"

url = "http://localhost:10041"
Groonga::Client.open(url: url) do |client|
  request =
    client.select(table: "docs",
                  match_columns: "content",
                  query: "concat") do |response|
    p response.n_hits
  end
  p :here
  request.wait
end
