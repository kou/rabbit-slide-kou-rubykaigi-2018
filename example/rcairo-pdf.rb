require "cairo"

Cairo::PDFSurface.create("x.pdf", "A4") do |surface|
  Cairo::Context.create(surface) do |context|
    context.set_source_color(:red)
    context.paint
  end
end
