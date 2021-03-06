require "gtk3"

app = Gtk::Application.new
app.signal_connect(:activate) do
  window = Gtk::ApplicationWindow.new(app)
  drawing_area = Gtk::DrawingArea.new
  drawing_area.signal_connect("draw") do |_, context|
    context.set_source_color("white")
    context.paint
    context.set_source_color("black")
    markup = "<span color='red'>Hello</span>こんにちは。🍣"
    attributes, text = Pango.parse_markup(markup)
    layout = context.create_pango_layout
    layout.text = text
    layout.attributes = attributes
    layout.font_description = Pango::FontDescription.new("Sans 32")
    layout.width = drawing_area.allocation.width * Pango::SCALE
    layout.alignment = :center
    context.show_pango_layout(layout)
    true
  end
  window.add(drawing_area)
  window.show_all
end
app.run
