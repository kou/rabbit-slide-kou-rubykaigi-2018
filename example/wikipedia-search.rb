require "fileutils"
require "groonga"
require "datasets"

FileUtils.rm_rf("/tmp/db")
FileUtils.mkdir_p("/tmp/db")

Groonga::Database.create(path: "/tmp/db/db")

Groonga::Schema.define do |schema|
  schema.create_table("pages") do |table|
    table.short_text("title")
    table.text("content")
  end

  schema.create_lexicon("terms") do |table|
    table.index("pages", "title", "content")
  end
end

pages = Groonga["pages"]
wikipedia = Datasets::Wikipedia.new(language: :ja)
wikipedia.each do |page|
  pages.add(title: page.title,
            content: page.revision.text)
end

ruby_pages = pages.select do |record|
  record.match("Ruby OR Rails") do |target|
    (target.title * 10) | (target.content)
  end
end
p ruby_pages.size
ruby_pages.each do |page|
  p [page.title, page.score]
end
