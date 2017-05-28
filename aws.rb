require 'aws-sdk'
require 'json'
Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new('AKIAIRXZVFA6JRVL6IDQ', 'v72QNXwpnT2VU/v4K07uonvr8J+/re3UDdF9afzS')
})
list=[]
s3 = Aws::S3::Client.new
resp = s3.list_objects(bucket: 'images-raspberrypi', max_keys: 10000)
resp.contents.each do |object|
   list.push("https://s3.us-east-2.amazonaws.com/images-raspberrypi/#{object.key}")
end

File.open("links.json","w") do |f|
  f.write('{"links":["')
  list.each do |link|
    f.write(link+'","')
  end
  f.write('"]}')
end
