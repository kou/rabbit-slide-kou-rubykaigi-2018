require "poppler"

doc = Poppler::Document.new(ARGV[0])
doc.each do |page|
  puts page.text
end
