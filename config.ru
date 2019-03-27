require 'aws-sdk-s3'

app = proc do |env|
  req = Rack::Request.new(env)
  case req.path
  when '/'
    Rack::Response.new('Hello, Certers!')
  when %r{^\/get\/(.*)}
    client = Aws::S3::Client.new
    client.get_object(
      bucket: 'cert-exam-app-bucket',
      key: 'IMG_20190225_123713540_HDR.jpg'
    )
    Rack::Response.new("Hello, #{Regexp.last_match(1)}!")
  else
    Rack::Response.new('Not found', 404)
  end
end

run app
