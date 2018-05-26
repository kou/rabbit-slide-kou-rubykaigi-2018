require "gst"

pipeline = Gst.parse_launch("autovideosrc ! videoconvert ! autovideosink")
pipeline.play
loop do
  message = pipeline.bus.poll
  break if message.type.eos?
end
pipeline.stop
