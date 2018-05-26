require "cairo"

1000.times do |i|
  Cairo::ImageSurface.new(:argb32, 6000, 6000)
end
puts File.readlines("/proc/self/status").grep(/VmRSS/)
