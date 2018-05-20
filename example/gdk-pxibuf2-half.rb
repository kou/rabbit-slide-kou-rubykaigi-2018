require "gdk_pixbuf2"

pixbuf = GdkPixbuf::Pixbuf.new(file: ARGV[0])
half = pixbuf.scale(pixbuf.width / 2,
                    pixbuf.height / 2,
                    :bilinear)
half.save("#{File.basename(ARGV[0], ".*")}-half.png")
