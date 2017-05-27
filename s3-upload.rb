require 'aws-sdk'
s3 = Aws::S3::Resource.new(region:'us-east')
obj = s3.bucket('eventrep-images').object(ENV['AWSSecretKey'])
obj.upload_file('README.md')
