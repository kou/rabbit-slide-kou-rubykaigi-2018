#!/usr/bin/env ruby

require "cv"

camera = CV::Camera.new
image = camera.read
image_gray = image.convert_color(:bgr2gray)

classifier = CV::CascadeClassifier.new("frontalface_default")
color = CV::Color.new(0, 0, 255)
objects = classifier.detect(image_gray)
objects.each do |object|
  image.draw_rectangle(object, color)
end
image.write("detect.jpg")
