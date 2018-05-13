require "gtk3"

app = Gtk::Application.new
app.signal_connect(:activate) do
  window = Gtk::ApplicationWindow.new(app)
  window.show_all
end
app.run
