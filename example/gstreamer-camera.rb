require "gst"

pipeline = Gst::Pipeline.new
source = Gst::Element["autovideosrc"]
converter = Gst::Element["videoconvert"]
sink = Gst::Element["autovideosink"]

pipeline << source << converter << sink
source >> converter
converter >> sink

pipeline.play
loop do
  message = pipeline.bus.poll
  break if message.type.eos?
end
pipeline.stop
