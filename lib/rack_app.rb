require 'erb'

class RackApp
  def call(env)
    request = Rack::Request.new(env)

    if(request.request_method == 'GET')
      index_page
    else
      post_image
    end
  end

  private

  def index_page
    Rack::Response.new(
      render(
        view_path("index.html.erb")
      )
    )
  end

  def render(path)
    ERB.new(File.read(path)).result(binding)
  end

  def view_path(template)
    File.expand_path("../../views/#{template}", __FILE__)
  end
end