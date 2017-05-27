require 'aws-sdk'
require 'dotenv'
require 'aws/s3'
require 's3'
Dotenv.load
service = S3::Service.new(:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                          :secret_access_key => ENV['AWS_SECRET_KEY'])
AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_KEY']
)
#USE FIRST TIME
s3 = Aws::S3::Client.new(region: 'us-east-2')
s3.create_bucket(bucket: 'images-raspberrypi')

pictures = ['raspberry.jpg','mascot.png','pie.jpg']
pictures.each do |x|
  s3 = Aws::S3::Resource.new(region:'us-east-2')
  obj = s3.bucket('images-raspberrypi').object(x)
  obj.upload_file(x)
end
#s3 = Aws::S3::Client.new(region: 'us-east-1')
#s3.create_bucket(bucket: 'eventrep')
