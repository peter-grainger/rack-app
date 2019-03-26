require 'erb'

class RackApp
  # Each request creates a new instance of the app in order
  # to isolate instance variables per request.
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    if(@request.request_method == 'GET')
      index_page
    else
      post_image(@request.params)
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

  def post_image(params)
    Rack::Response.new do |response|
      response.set_cookie('photo_path', params["photo_path"])
      response.redirect("/")
    end
  end

  def render(path)
    ERB.new(File.read(path)).result(binding)
  end

  def view_path(template)
    File.expand_path("../../views/#{template}", __FILE__)
  end
end