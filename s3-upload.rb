require 'aws-sdk'
s3 = Aws::S3::Resource.new(region:'us-east')
obj = s3.bucket('eventrep-images').object('DnTnG9vMj5J4vc+HhfxPAMO7oNZUDHreAVQxiehk')
obj.upload_file('README.md')
