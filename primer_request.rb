require 'uri'
require 'net/http'
require 'json'

def request(address)
url = URI("address")
http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Get.new(url)
request["User-Agent"] = 'PostmanRuntime/7.11.0'
request["Accept"] = '*/*'
request["Cache-Control"] = 'no-cache'
request["Postman-Token"] = 'e2d1d57b-6749-4d7e-a022-c0043c857119,dc6ce1c8-6c83-4544-bf01-5ed156a4b84c'
request["Host"] = 'jsonplaceholder.typicode.com'
request["accept-encoding"] = 'gzip, deflate'
request["Connection"] = 'keep-alive'
request["cache-control"] = 'no-cache'

response = http.request(request)
JSON.parse response.read_body
end

body = request('https://jsonplaceholder.typicode.com/posts')
body.each do |post|
  puts post['title']
end
