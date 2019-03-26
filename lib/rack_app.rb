require 'erb'

class RackApp
  def call(env)
    Rack::Response.new(
      render(
        view_path("index.html.erb")
      )
    )
  end

  private

  def render(path)
    ERB.new(File.read(path)).result(binding)
  end

  def view_path(template)
    File.expand_path("../../views/#{template}", __FILE__)
  end
end