require 'aws-sdk'
require 'dotenv'
require 'aws/s3'
Dotenv.load
AWS::S3::Base.establish_connection!(
  :access_key_id     => 'AKIAIRXZVFA6JRVL6IDQ',
  :secret_access_key => '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',
)
#USE FIRST TIME
#s3 = Aws::S3::Client.new(region: 'us-east-2')
#s3.create_bucket(bucket: 'images-raspberrypie')

pictures = ['raspberry.jpg','mascot.png','pie.jpg', ]
pictures.each do |x|
  s3 = Aws::S3::Resource.new(region:'us-east-2')
  obj = s3.bucket('images-raspberrypie').object(x)
  obj.upload_file(x)
end
#s3 = Aws::S3::Client.new(region: 'us-east-1')
#s3.create_bucket(bucket: 'eventrep')
