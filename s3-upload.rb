require 'aws-sdk'
require 'dotenv'
require 'aws/s3'
s3 = Aws::S3::Resource.new(region: 'ap-southeast-1', access_key_id: 'AKIAIRXZVFA6JRVL6IDQ', secret_access_key: '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' )
data_files = s3.bucket().objects(prefix: 'prefix/', delimiter: 'delimiter').collect(&:key)
