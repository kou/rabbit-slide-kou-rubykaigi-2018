require "fileutils"
require "groonga"

FileUtils.rm_rf("/tmp/db")
FileUtils.mkdir_p("/tmp/db")

Groonga::Database.create(path: "/tmp/db/db")

Groonga::Schema.define do |schema|
  schema.create_table("docs") do |table|
    table.text("content")
  end

  schema.create_lexicon("terms") do |table|
    table.index("docs.content")
  end
end

docs = Groonga["docs"]
docs.add(content: "String#<< concatenates ...")
docs.add(content: "String#dup duplicates ...")

matches = docs.select do |record|
  record.content =~ "concat"
end

p matches.size
matches.each do |record|
  p record.content
end
