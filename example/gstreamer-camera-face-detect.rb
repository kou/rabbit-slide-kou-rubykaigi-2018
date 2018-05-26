require "gst"

description = [
  "autovideosrc",  # Camera
  "videoconvert",  # Filter
  "facedetect",    # Face detection
  "videoconvert",  # Filter
  "autovideosink", # Window
].join(" ! ")
pipeline = Gst.parse_launch(description)
pipeline.play
loop do
  message = pipeline.bus.poll
  break if message.type.eos?
end
pipeline.stop
